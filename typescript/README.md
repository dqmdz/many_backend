# CRUD TypeScript + Express + Prisma (SQLite)

Ejemplo de API RESTful con operaciones CRUD para el modelo Persona.

## Requisitos Previos

- Node.js (v18+)
- npm

## Instalación

```bash
npm install
```

## Configuración de Base de Datos

1. Generar el cliente Prisma:
```bash
npm run prisma:generate
```

2. Crear la base de datos y tablas:
```bash
npm run prisma:migrate
```

## Ejecución

### Desarrollo (con hot-reload)
```bash
npm run dev
```

### Producción
```bash
npm run build
npm start
```

El servidor se ejecutará en `http://localhost:5000`

## Endpoints

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/personas` | Listar todas las personas |
| GET | `/api/personas/:id` | Obtener una persona por ID |
| POST | `/api/personas` | Crear una nueva persona |
| PUT | `/api/personas/:id` | Actualizar completamente una persona |
| PATCH | `/api/personas/:id` | Actualizar parcialmente una persona |
| DELETE | `/api/personas/:id` | Eliminar una persona |

## Ejemplos de Solicitud

### Crear persona
```bash
POST http://localhost:5000/api/personas
Content-Type: application/json

{
  "nombre": "Juan",
  "apellido": "Pérez",
  "documento": "12345678",
  "direccion": "Calle Falsa 123"
}
```

### Actualizar persona
```bash
PUT http://localhost:5000/api/personas/1
Content-Type: application/json

{
  "nombre": "Juan Actualizado",
  "apellido": "Pérez García",
  "documento": "87654321",
  "direccion": "Nueva Dirección 456"
}
```

### Actualización parcial
```bash
PATCH http://localhost:5000/api/personas/1
Content-Type: application/json

{
  "direccion": "Dirección Modificada"
}
```

## Usar con REST Client (VS Code)

Si usas VS Code, puedes instalar la extensión **REST Client** y ejecutar las solicitudes definidas en `requests.http`.
