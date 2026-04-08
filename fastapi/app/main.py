from fastapi import FastAPI, HTTPException, status, Depends
from sqlalchemy.orm import Session
from typing import List

from app.database import engine, get_db
from app.models import Persona
from app.schemas import PersonaCreate, PersonaUpdate, PersonaResponse
from app import models

models.Base.metadata.create_all(bind=engine)

app = FastAPI(title="Personas API", description="CRUD API for personas")


@app.get("/api/personas", response_model=List[PersonaResponse])
def listar_personas(db: Session = Depends(get_db)):
    return db.query(Persona).all()


@app.get("/api/personas/{persona_id}", response_model=PersonaResponse)
def obtener_persona(persona_id: int, db: Session = Depends(get_db)):
    persona = db.query(Persona).filter(Persona.id == persona_id).first()
    if not persona:
        raise HTTPException(status_code=404, detail="Persona no encontrada")
    return persona


@app.post(
    "/api/personas", response_model=PersonaResponse, status_code=status.HTTP_201_CREATED
)
def crear_persona(persona: PersonaCreate, db: Session = Depends(get_db)):
    db_persona = Persona(**persona.model_dump())
    db.add(db_persona)
    db.commit()
    db.refresh(db_persona)
    return db_persona


@app.put("/api/personas/{persona_id}", response_model=PersonaResponse)
def actualizar_persona(
    persona_id: int, persona: PersonaCreate, db: Session = Depends(get_db)
):
    db_persona = db.query(Persona).filter(Persona.id == persona_id).first()
    if not db_persona:
        raise HTTPException(status_code=404, detail="Persona no encontrada")
    for key, value in persona.model_dump().items():
        setattr(db_persona, key, value)
    db.commit()
    db.refresh(db_persona)
    return db_persona


@app.patch("/api/personas/{persona_id}", response_model=PersonaResponse)
def actualizar_parcial_persona(
    persona_id: int, persona: PersonaUpdate, db: Session = Depends(get_db)
):
    db_persona = db.query(Persona).filter(Persona.id == persona_id).first()
    if not db_persona:
        raise HTTPException(status_code=404, detail="Persona no encontrada")
    for key, value in persona.model_dump(exclude_unset=True).items():
        setattr(db_persona, key, value)
    db.commit()
    db.refresh(db_persona)
    return db_persona


@app.delete("/api/personas/{persona_id}", status_code=status.HTTP_204_NO_CONTENT)
def eliminar_persona(persona_id: int, db: Session = Depends(get_db)):
    db_persona = db.query(Persona).filter(Persona.id == persona_id).first()
    if not db_persona:
        raise HTTPException(status_code=404, detail="Persona no encontrada")
    db.delete(db_persona)
    db.commit()
    return None
