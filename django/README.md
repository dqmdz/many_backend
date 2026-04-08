# API REST de Personas - Django

API REST para gestión de personas con operaciones CRUD.

## Requisitos

- Python 3.14+
- uv (gestor de paquetes)

## Instalación

```bash
# Crear entorno virtual
uv venv

# Activar entorno virtual
source .venv/bin/activate

# Instalar dependencias
uv pip install django djangorestframework
```

## Configuración y Ejecución

```bash
# Generar migraciones
python manage.py makemigrations

# Aplicar migraciones
python manage.py migrate

# Iniciar servidor
python manage.py runserver
```

El servidor arrancará en `http://localhost:8000`

## Endpoints

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/{id}` | Obtener una persona por ID |
| POST | `/api/personas` | Crear nueva persona |
| PUT | `/api/personas/{id}` | Actualizar persona completa |
| PATCH | `/api/personas/{id}` | Actualizar parcialmente |
| DELETE | `/api/personas/{id}` | Eliminar persona |

## Ejemplos de Uso

### Crear persona
```bash
curl -X POST http://localhost:8000/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan", "apellido": "Pérez", "documento": "12345678", "direccion": "Calle Falsa 123"}'
```

### Listar personas
```bash
curl http://localhost:8000/api/personas
```

### Actualizar persona
```bash
curl -X PUT http://localhost:8000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan Actualizado", "apellido": "Pérez", "documento": "87654321", "direccion": "Nueva Dirección"}'
```

### Eliminar persona
```bash
curl -X DELETE http://localhost:8000/api/personas/1
```

## Base de datos

Se utiliza SQLite (archivo `db.sqlite3` en el directorio raíz).
