# API REST de Personas - Kotlin Spring Boot

API RESTful para gestión de personas desarrollada con Kotlin, Spring Boot 4.0.5, Spring Data JPA y base de datos H2 en memoria.

## Requisitos Previos

- JDK 24
- Gradle (incluido en el proyecto)

## Estructura del Proyecto

```
src/main/kotlin/com/example/kotlin_spring/
├── controller/
│   └── PersonaController.kt    # Endpoints REST
├── model/
│   └── Persona.kt               # Entidad JPA
├── repository/
│   └── PersonaRepository.kt     # Repositorio JPA
└── service/
    └── PersonaService.kt        # Lógica de negocio
```

## Endpoints Disponibles

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/{id}` | Obtener persona por ID |
| POST | `/api/personas` | Crear nueva persona |
| PUT | `/api/personas/{id}` | Actualizar persona completa |
| PATCH | `/api/personas/{id}` | Actualizar parcialmente persona |
| DELETE | `/api/personas/{id}` | Eliminar persona |

## Ejecutar la Aplicación

```bash
./gradlew bootRun
```

La aplicación iniciara en `http://localhost:5000`

## Prueba con requests.http

Si usas VS Code con la extension REST Client, puedes ejecutar las peticiones en `requests.http`:

1. Abre el archivo `requests.http`
2. Ejecuta las peticiones haciendo clic en "Send Request"

O usa curl:

```bash
# Listar personas
curl http://localhost:5000/api/personas

# Crear persona
curl -X POST http://localhost:5000/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan","apellido":"Pérez","documento":"12345678","direccion":"Calle Falsa 123"}'

# Obtener persona por ID
curl http://localhost:5000/api/personas/1

# Actualizar persona (PUT)
curl -X PUT http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan Actualizado","apellido":"Pérez García","documento":"87654321","direccion":"Nueva Dirección 456"}'

# Actualizar parcialmente (PATCH)
curl -X PATCH http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"direccion":"Dirección Modificada"}'

# Eliminar persona
curl -X DELETE http://localhost:5000/api/personas/1
```

## Consola H2

Accede a la consola de la base de datos en: `http://localhost:5000/h2-console`

- JDBC URL: `jdbc:h2:mem:testdb`
- Username: `sa`
- Password: (vacío)

## Ejecutar Tests

```bash
./gradlew test
```

## Construir JAR

```bash
./gradlew bootJar
```