# API CRUD Personas - Ktor + Exposed + SQLite

Aplicación de ejemplo que implementa un CRUD completo de personas usando Kotlin, Ktor framework y Exposed ORM con SQLite.

## Requisitos

- JDK 17 o superior
- Gradle (included wrapper)

## Estructura del Proyecto

```
kotlin_ktor/
├── build.gradle.kts
├── src/main/kotlin/com/example/
│   ├── Application.kt          # Punto de entrada
│   ├── data/
│   │   ├── Persona.kt          # Modelo y DTOs
│   │   ├── PersonaRepository.kt # Repositorio CRUD
│   │   └── DatabaseFactory.kt  # Configuración de DB
│   └── routes/
│       └── PersonaRoutes.kt   # Endpoints HTTP
├── src/main/resources/
│   └── logback.xml            # Configuración de logs
└── requests.http              # Solicitudes HTTP de ejemplo
```

## Endpoints

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/{id}` | Obtener una persona por ID |
| POST | `/api/personas` | Crear una nueva persona |
| PUT | `/api/personas/{id}` | Actualizar una persona (completo) |
| PATCH | `/api/personas/{id}` | Actualizar parcialmente una persona |
| DELETE | `/api/personas/{id}` | Eliminar una persona |

## Ejecutar la Aplicación

### Linux/Mac

```bash
./gradlew run
```

### Windows

```bash
gradlew.bat run
```

La aplicación se ejecutará en `http://localhost:5000`

## Pruebas con requests.http

1. Abre el archivo `requests.http` en IntelliJ IDEA o VS Code con la extensión REST Client
2. Ejecuta las solicitudes haciendo clic en "Send Request" o usando la combinación de teclas correspondiente

### Ejemplo usando curl

```bash
# Listar todas las personas
curl http://localhost:5000/api/personas

# Crear una persona
curl -X POST http://localhost:5000/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan","apellido":"Pérez","documento":"12345678","direccion":"Calle Falsa 123"}'

# Obtener persona por ID
curl http://localhost:5000/api/personas/1

# Actualizar completamente
curl -X PUT http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Juan Actualizado","apellido":"Pérez García","documento":"87654321","direccion":"Nueva Dirección 456"}'

# Actualizar parcialmente
curl -X PATCH http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"direccion":"Dirección Modificada"}'

# Eliminar
curl -X DELETE http://localhost:5000/api/personas/1
```

## Tecnologías

- **Kotlin** - Lenguaje de programación
- **Ktor** - Framework web
- **Exposed** - ORM de JetBrains
- **SQLite** - Base de datos embebida
- **Gson** - Serialización JSON
