from peewee import Model, CharField, DateTimeField, AutoField, ForeignKeyField, Field, fn
from db import db

class GeometryField(Field):
    field_type = 'geometry'

    def db_value(self, value):
        """
        Transforma GeoJSON para o tipo aceito pelo banco de dados.
        """
        if value:
            return fn.ST_GeomFromGeoJSON(value)
        return None

    def python_value(self, value):
        """
        Transforma a geometria do banco em GeoJSON para uso no Python.
        """
        if value:
            return value  # Retorna diretamente como string GeoJSON
        return None


class GeoLocalizacaoDb(Model):
    id = AutoField()
    nome = CharField(max_length=150)
    geometry = GeometryField()

    class Meta:
        database = db
        schema = 'public'
        table_name = 'geolocalizacao'
