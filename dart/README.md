# Persona CRUD - Dart + SQLite

API RESTful para gestionar personas con operaciones CRUD completas.

## Requisitos

- [Dart SDK](https://dart.dev/get-dart) (versión 3.0.0 o superior)

## Instalación

1. Instala las dependencias:
   ```bash
   dart pub get
   ```

2. Genera el código del ORM (Drift):
   ```bash
   dart run build_runner build
   ```

## Ejecución

Inicia el servidor:
```bash
dart run bin/main.dart
```

El servidor escuchará en `http://localhost:5000`

## Endpoints

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/:id` | Obtener una persona por ID |
| POST | `/api/personas` | Crear una nueva persona |
| PUT | `/api/personas/:id` | Actualizar una persona (completo) |
| PATCH | `/api/personas/:id` | Actualizar parcialmente |
| DELETE | `/api/personas/:id` | Eliminar una persona |

## Ejemplos de Uso

### Crear persona
```bash
curl -X POST http://localhost:5000/api/personas \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan", "apellido": "Pérez", "documento": "12345678", "direccion": "Calle Falsa 123"}'
```

### Listar personas
```bash
curl http://localhost:5000/api/personas
```

### Actualizar persona
```bash
curl -X PUT http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan Actualizado", "apellido": "Pérez García", "documento": "87654321", "direccion": "Nueva Dirección 456"}'
```

### Actualización parcial
```bash
curl -X PATCH http://localhost:5000/api/personas/1 \
  -H "Content-Type: application/json" \
  -d '{"direccion": "Dirección Modificada"}'
```

### Eliminar persona
```bash
curl -X DELETE http://localhost:5000/api/personas/1
```

## Estructura del Proyecto

```
lib/
├── database/
│   └── database.dart      # Definición de la base de datos con Drift
├── routes/
│   └── persona_routes.dart # Rutas API REST
bin/
└── main.dart              # Punto de entrada
```

## Base de Datos

La base de datos SQLite se crea automáticamente en el directorio de documentos del usuario como `personas.db`.

## Tecnologías

- **Shelf** - Servidor HTTP
- **Drift** - ORM para SQLite
- **sqlite3_flutter_libs** - Bindings de SQLite
