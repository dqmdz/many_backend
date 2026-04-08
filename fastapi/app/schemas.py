from pydantic import BaseModel
from typing import Optional


class PersonaBase(BaseModel):
    nombre: str
    apellido: str
    documento: str
    direccion: Optional[str] = None


class PersonaCreate(PersonaBase):
    pass


class PersonaUpdate(BaseModel):
    nombre: Optional[str] = None
    apellido: Optional[str] = None
    documento: Optional[str] = None
    direccion: Optional[str] = None


class PersonaResponse(PersonaBase):
    id: int

    class Config:
        from_attributes = True
