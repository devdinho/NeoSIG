from peewee import Model, CharField, ForeignKeyField, IntegerField

from autenticacao.autenticacao_db import UsuarioAuthDb
from db import db


class UsuarioDb(Model):
    id = ForeignKeyField(UsuarioAuthDb, backref='usuario', primary_key=True)
    # foto = CharField(max_length=2048, null=True)
    tipo_usuario = IntegerField(default = 0) # Funcionario(0), Administrador(1)
    cor = CharField(null=True)

    class Meta:
        database = db
        schema = 'usuario'
        db_table = 'usuario'