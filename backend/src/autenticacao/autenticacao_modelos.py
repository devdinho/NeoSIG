
from typing import Optional
from fastapi import HTTPException, status
from pydantic import BaseModel
import re


class CadastroModelo(BaseModel):
    status: bool
    erro: Optional[str]


class EntrarModelo(BaseModel):
    status: bool
    erro: Optional[str]
    jwt: Optional[str]


class AtualizarJwtModelo(BaseModel):
    status: bool
    erro: Optional[str]
    jwt: Optional[str]


class PostCadastroUsuario(BaseModel):
    nome: str
    senha: str
    email: str

    def verificar_nome(self):
        if len(self.nome) < 3:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail='Nome muito curto')

    def verificar_email(self):
        emailRegex = r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$"
        if not re.fullmatch(emailRegex, self.email):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail='Email inválido')

    def verificar_senha(self):
        if len(self.senha) < 6:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail='Senha muito curta')
