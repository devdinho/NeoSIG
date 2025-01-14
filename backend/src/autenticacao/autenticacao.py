import datetime

import jwt
from fastapi import Depends
from fastapi.security import OAuth2PasswordBearer

from config import Settings
from usuario.usuario_db import UsuarioDb

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="autenticacao/entrar")

settings = Settings()


def usuario_jwt(token: str = Depends(oauth2_scheme)):
    inicio = datetime.datetime.now()
    usuario_payload = jwt.decode(token, key=settings.jwt_secret, algorithms=["HS256"])

    usuario_id = usuario_payload["id"]
    usuario = UsuarioDb().select().where(UsuarioDb.id == usuario_id).first()
    print(datetime.datetime.now() - inicio)
    return usuario