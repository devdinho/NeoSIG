from autenticacao.autenticacao import usuario_jwt
from autenticacao.autenticacao_db import JwtRefreshTokenDb, UsuarioAuthDb
from autenticacao import autenticacao_rotas
from db import db
from typing import Union
from fastapi import FastAPI, Depends, BackgroundTasks
from starlette.middleware.cors import CORSMiddleware
from starlette.middleware.gzip import GZipMiddleware
from config import Settings

from usuario.usuario_db import UsuarioDb
Settings()


# autenticacao
# Links uteis
# Arquivos Sql
# Downloads Drivers
# Videos Youtube
# Notas Versão
db.create_tables([JwtRefreshTokenDb, UsuarioAuthDb, UsuarioDb])

app = FastAPI()
app.add_middleware(GZipMiddleware, minimum_size=100)
app.add_middleware(CORSMiddleware,
                   allow_origins='*',
                   allow_credentials=True,
                   allow_methods=["*"],
                   allow_headers=["*"])

app.include_router(autenticacao_rotas.router)


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/teste")
def teste(current_user: UsuarioDb = Depends(usuario_jwt)):
    return {current_user}
