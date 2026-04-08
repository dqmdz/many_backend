# Java Spring CRUD - Ejemplo

API RESTful construida con Spring Boot 4.0.5 y JPA para gestionar entidades `Persona`.

## Requisitos

- Java 25
- Maven

## Ejecutar la aplicación

```bash
./mvnw spring-boot:run
```

La aplicación se iniciara en `http://localhost:8080`

## Endpoints CRUD

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/{id}` | Obtener una persona por ID |
| POST | `/api/personas` | Crear una nueva persona |
| PUT | `/api/personas/{id}` | Actualizar completamente una persona |
| PATCH | `/api/personas/{id}` | Actualizar parcialmente una persona |
| DELETE | `/api/personas/{id}` | Eliminar una persona |

## Probar la API

Usa el archivo `requests.http` con tu cliente HTTP (IntelliJ IDEA, VS Code con REST Client, etc.).

Ejemplo de request POST:

```json
{
  "nombre": "Juan",
  "apellido": "Pérez",
  "documento": "12345678",
  "direccion": "Calle Falsa 123"
}
```

## Base de datos

Se utiliza H2 en memoria. La consola H2 está disponible en `http://localhost:8080/h2-console` (configuración por defecto).
