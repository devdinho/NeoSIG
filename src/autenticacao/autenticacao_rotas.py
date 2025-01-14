from fastapi import APIRouter
from fastapi.security import OAuth2PasswordRequestForm
from fastapi import APIRouter, status, Depends, Body
from autenticacao.autenticacao_db import UsuarioAuthDb, JwtRefreshTokenDb
from autenticacao.autenticacao_modelos import EntrarModelo, CadastroModelo
from usuario.usuario_db import UsuarioDb
from utilitarios.functions import gerar_hash_sha256, verificar_email
from playhouse.shortcuts import model_to_dict
import datetime
from config import Settings
import jwt

settings = Settings()

router = APIRouter(prefix = '/autenticacao', 
tags=['Autenticação'])

@router.post('/cadastrar', status_code=status.HTTP_201_CREATED, response_model=CadastroModelo)
def cadastrar(nome: str, senha: str, email: str):
    if len(nome) == 0:
        return CadastroModelo(status=False, erro='Nome inválido')
    elif len(senha) < 8:
        return CadastroModelo(status=False, erro='Senha muito curta')
    elif verificar_email(email) is False:
        return CadastroModelo(status=False, erro='Email inválido')
    else:
        usuario = UsuarioAuthDb().select().where(UsuarioAuthDb.email == email)
        if usuario.exists():
            return CadastroModelo(status=False, erro='Email já cadastrado')

        usuario = UsuarioAuthDb().select().where(UsuarioAuthDb.nome == nome)
        if usuario.exists():
            return CadastroModelo(status=False, erro='Nome já cadastrado')

    senha_hash = gerar_hash_sha256(senha)

    usuario_auth = UsuarioAuthDb(nome=nome,
                                 email=email,
                                 registrado_em=datetime.datetime.now(),
                                 ultimo_acesso_em=datetime.datetime.now(),
                                 senha_hash=senha_hash)
    usuario_auth.save()

    UsuarioDb.insert(id=usuario_auth.id, cor='#fff').execute()

    return CadastroModelo(status=True)


@router.post('/entrar')
def entrar(form_data : OAuth2PasswordRequestForm = Depends()):
    email = form_data.username
    password = form_data.password
    usuario = UsuarioAuthDb().select().where(UsuarioAuthDb.email == email)
    if not usuario.exists():
        return EntrarModelo(status=False, erro='Email não cadastrado')
    usuario = usuario.first()
    senha_hash = gerar_hash_sha256(password)
    if senha_hash != usuario.senha_hash:
        return EntrarModelo(status=False, erro='Senha incorreta')

    tipo_usuario_db = UsuarioDb.select().where(UsuarioDb.id_id == usuario.id).first()
    usuario_payload = model_to_dict(usuario)
    usuario_payload['exp'] = datetime.datetime.now() + datetime.timedelta(seconds=settings.tempo_expiracao_jwt)

    usuario_payload['jwt_refresh_id'] = JwtRefreshTokenDb.insert(emitido_em=datetime.datetime.now(),
                                                                 expira_em=usuario_payload['exp'],
                                                                 invalidado_em=None,
                                                                 id_ultimo_token=None,
                                                                 usuario_id=usuario.id).execute()

    for chave_datetime in ['registrado_em', 'ultimo_acesso_em']:
        usuario_payload[chave_datetime] = usuario_payload[chave_datetime].isoformat()

    usuario_payload['exp'] = usuario_payload['exp'].timestamp()

    enc_jwt = jwt.encode(payload=usuario_payload, key=settings.jwt_secret, algorithm='HS256')

    usuario.ultimo_acesso_em = datetime.datetime.now()
    usuario.save()
    UsuarioDb.select
    print(enc_jwt)
    return {"access_token": enc_jwt, "token_type": "bearer", 'status': True, 'tipo_usuario': tipo_usuario_db.tipo_usuario}
