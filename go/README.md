# API de Personas

API RESTful para gestión de personas con operaciones CRUD.

## Requisitos

- Go 1.21+

## Instalación

1. Clonar el repositorio
2. Instalar dependencias:
   ```bash
   go mod tidy
   ```

## Ejecución

```bash
go run cmd/server/main.go
```

El servidor iniciara en `http://localhost:5000`

## Endpoints

| Método | Endpoint | Descripción |
|--------|----------|--------------|
| GET | /api/personas | Listar todas las personas |
| GET | /api/personas/:id | Obtener persona por ID |
| POST | /api/personas | Crear nueva persona |
| PUT | /api/personas/:id | Actualizar persona |
| PATCH | /api/personas/:id | Actualizar parcialmente |
| DELETE | /api/personas/:id | Eliminar persona |

## Pruebas

Usar REST Client (VS Code) con el archivo `requests.http`:
```bash
# Click en "Send Request" o usar tecla de atajo
```

O con curl:
```bash
# Listar personas
curl http://localhost:5000/api/personas

# Crear persona
curl -X POST http://localhost:5000/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan","apellido":"Pérez","documento":"12345678","direccion":"Calle Falsa 123"}'

# Actualizar persona
curl -X PUT http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan Actualizado","apellido":"Pérez García","documento":"87654321","direccion":"Nueva Dirección 456"}'

# Eliminar persona
curl -X DELETE http://localhost:5000/api/personas/1
```

## Base de datos

SQLite: `personas.db` (se crea automáticamente)