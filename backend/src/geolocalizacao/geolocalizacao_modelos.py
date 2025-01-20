
from typing import Optional
from fastapi import HTTPException, status
from pydantic import BaseModel
import re

class GeoJSONShape(BaseModel):
    nome: str
    geometry: dict


