# Persona API - Quarkus + H2

API RESTful para gestión de personas con CRUD completo.

## Requisitos

- Java 17+
- Maven 3.8+

## Ejecución

```bash
cd java_quarkus
mvn quarkus:dev
```

La aplicación se ejecuta en `http://localhost:8080`

## Endpoints

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | /api/personas | Listar todas las personas |
| GET | /api/personas/{id} | Obtener persona por ID |
| POST | /api/personas | Crear nueva persona |
| PUT | /api/personas/{id} | Actualizar persona completa |
| PATCH | /api/personas/{id} | Actualizar parcialmente |
| DELETE | /api/personas/{id} | Eliminar persona |

## Ejemplo de uso

```bash
# Crear persona
curl -X POST http://localhost:8080/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan","apellido":"Pérez","documento":"12345678","direccion":"Calle Falsa 123"}'

# Listar personas
curl http://localhost:8080/api/personas

# Actualizar persona
curl -X PUT http://localhost:8080/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan Actualizado","apellido":"Pérez García","documento":"87654321","direccion":"Nueva Dirección 456"}'

# Eliminar persona
curl -X DELETE http://localhost:8080/api/personas/1
```

## Base de datos

- H2 en memoria (`jdbc:h2:mem:testdb`)
- Schema se genera automáticamente (`drop-and-create`)