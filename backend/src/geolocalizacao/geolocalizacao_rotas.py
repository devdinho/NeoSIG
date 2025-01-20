
from fastapi import FastAPI, Request, APIRouter, HTTPException, status
from config import Settings
from geoalchemy2 import Geometry
from geolocalizacao.geolocalizacao_modelos import GeoJSONShape
from geolocalizacao.geolocalizacao_db import GeoLocalizacaoDb
import json

settings = Settings()

# Criação do router para autenticação
router = APIRouter(
    prefix='/geolocalizacao',
    tags=['Geolocalizacao']
)


@router.post('/')
async def RegistroDeGeolocalizacao(data: GeoJSONShape):
    try:
        geojson_str = json.dumps(data.geometry)

        geoquery = GeoLocalizacaoDb.create(
            nome=data.nome,
            geometry=geojson_str
        )
        return {"id": geoquery.id, "message": "Geolocalização registrada com sucesso!"}
    except Exception as err:
        print('Erro ao registrar geolocalização', err)
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail='Erro ao registrar geolocalização')
