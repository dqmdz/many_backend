# Personas API

API RESTful para gestionar personas, construida con FastAPI, SQLAlchemy y SQLite.

## Requisitos

- Python 3.11+
- [uv](https://github.com/astral-sh/uv) (gestor de paquetes y entornos virtuales)

## Instalación

1. **Instalar uv** (si no lo tienes):
   ```bash
   pip install uv
   ```

2. **Crear entorno virtual e instalar dependencias**:
   ```bash
   uv sync
   ```

## Ejecución

Iniciar el servidor:
```bash
uv run uvicorn app.main:app --host 0.0.0.0 --port 5000 --reload
```

La API estará disponible en: `http://localhost:5000`

## Documentación

FastAPI genera documentación automática:
- **Swagger UI**: http://localhost:5000/docs
- **ReDoc**: http://localhost:5000/redoc

## Endpoints

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/{id}` | Obtener una persona por ID |
| POST | `/api/personas` | Crear una nueva persona |
| PUT | `/api/personas/{id}` | Actualizar una persona (completo) |
| PATCH | `/api/personas/{id}` | Actualizar parcialmente una persona |
| DELETE | `/api/personas/{id}` | Eliminar una persona |

## Probar la API

Puedes usar el archivo `requests.http` con la extensión **REST Client** de VS Code, o herramientas como curl:

```bash
# Listar personas
curl http://localhost:5000/api/personas

# Crear persona
curl -X POST http://localhost:5000/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan","apellido":"Pérez","documento":"12345678","direccion":"Calle Falsa 123"}'
```

## Base de datos

Se utiliza SQLite. El archivo `personas.db` se crea automáticamente en la raíz del proyecto.