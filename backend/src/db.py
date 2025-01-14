from peewee import PostgresqlDatabase
from config import Settings
# from playhouse.shortcuts import ReconnectMixin

# class ReconnectMySQLDatabase(ReconnectMixin, PostgresqlDatabase):
#     pass

configuracao = Settings()

db = PostgresqlDatabase(
    configuracao.db_nome,  # Required by Peewee.
    user=configuracao.db_usuario,  # Will be passed directly to psycopg2.
    password=configuracao.db_senha,  # Ditto.
    host=configuracao.db_host,
    port=configuracao.db_porta)
