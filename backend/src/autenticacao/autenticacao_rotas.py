from fastapi import APIRouter, status, Depends, HTTPException
from fastapi.security import OAuth2PasswordRequestForm
from autenticacao.autenticacao_db import UsuarioAuthDb, JwtRefreshTokenDb
from autenticacao.autenticacao_modelos import EntrarModelo, CadastroModelo
from usuario.usuario_db import UsuarioDb
from utilitarios.functions import gerar_hash_sha256, verificar_email
from playhouse.shortcuts import model_to_dict
import datetime
from config import Settings
import jwt

# Instancia as configurações
settings = Settings()

# Criação do router para autenticação
router = APIRouter(
    prefix='/autenticacao',
    tags=['Autenticação']
)

@router.post('/cadastrar', status_code=status.HTTP_201_CREATED, response_model=CadastroModelo)
def cadastrar(usuario: PostCadastroUsuario):
    """
    Endpoint para cadastro de novos usuários.

    Args:
        nome (str): Nome do usuário.
        senha (str): Senha do usuário.
        email (str): Email do usuário.

    Returns:
        CadastroModelo: Modelo indicando sucesso ou erro do cadastro.
    """
    # Validações básicas de entrada
    PostCadastroUsuario.verificar_nome()
    PostCadastroUsuario.verificar_email()
    PostCadastroUsuario.verificar_senha()

    # Verifica se o email já está cadastrado
    if UsuarioAuthDb.select().where(UsuarioAuthDb.email == PostCadastroUsuario.email).exists():
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail='Email já cadastrado')

    # Verifica se o nome já está cadastrado
    if UsuarioAuthDb.select().where(UsuarioAuthDb.nome == PostCadastroUsuario.nome).exists():
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail='Nome já cadastrado')

    # Gera o hash da senha
    senha_hash = gerar_hash_sha256(PostCadastroUsuario.senha)

    # Cria e salva o usuário na base de dados
    usuario_auth = UsuarioAuthDb(
        nome=PostCadastroUsuario.nome,
        email=PostCadastroUsuario.email,
        registrado_em=datetime.datetime.now(),
        ultimo_acesso_em=datetime.datetime.now(),
        senha_hash=senha_hash
    )
    usuario_auth.save()

    # Adiciona o usuário na tabela auxiliar
    UsuarioDb.insert(id=usuario_auth.id, cor='#fff').execute()

    return CadastroModelo(status=True)


@router.post('/entrar', response_model=dict)
def entrar(form_data: OAuth2PasswordRequestForm = Depends()):
    """
    Endpoint para login de usuários.

    Args:
        form_data (OAuth2PasswordRequestForm): Dados de login (usuário e senha).

    Returns:
        dict: Token de acesso e tipo, além de informações do status do login.
    """
    email = form_data.username
    password = form_data.password

    # Busca o usuário pelo email
    usuario_query = UsuarioAuthDb.select().where(UsuarioAuthDb.email == email)
    if not usuario_query.exists():
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Email não cadastrado')

    usuario = usuario_query.first()

    # Verifica se a senha está correta
    senha_hash = gerar_hash_sha256(password)
    if senha_hash != usuario.senha_hash:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Senha incorreta')

    # Obtém informações adicionais do usuário
    tipo_usuario_db = UsuarioDb.select().where(UsuarioDb.id_id == usuario.id).first()

    # Cria o payload do token JWT
    usuario_payload = model_to_dict(usuario)
    usuario_payload['exp'] = datetime.datetime.now() + datetime.timedelta(seconds=settings.tempo_expiracao_jwt)

    # Gera e insere o token de refresh no banco de dados
    usuario_payload['jwt_refresh_id'] = JwtRefreshTokenDb.insert(
        emitido_em=datetime.datetime.now(),
        expira_em=usuario_payload['exp'],
        invalidado_em=None,
        id_ultimo_token=None,
        usuario_id=usuario.id
    ).execute()

    # Formata datas para string ISO
    for chave_datetime in ['registrado_em', 'ultimo_acesso_em']:
        usuario_payload[chave_datetime] = usuario_payload[chave_datetime].isoformat()

    # Define a expiração como timestamp
    usuario_payload['exp'] = usuario_payload['exp'].timestamp()

    # Gera o token JWT
    enc_jwt = jwt.encode(payload=usuario_payload, key=settings.jwt_secret, algorithm='HS256')

    # Atualiza o último acesso do usuário
    usuario.ultimo_acesso_em = datetime.datetime.now()
    usuario.save()

    return {
        "access_token": enc_jwt,
        "token_type": "bearer",
        "status": True,
        "tipo_usuario": tipo_usuario_db.tipo_usuario
    }
