import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../database/database.dart';

class PersonaRoutes {
  final AppDatabase db;

  PersonaRoutes(this.db);

  Router get router => Router()
    ..get('/', _getAllPersonas)
    ..get('/<id>', _getPersonaById)
    ..post('/', _createPersona)
    ..put('/<id>', _updatePersona)
    ..patch('/<id>', _patchPersona)
    ..delete('/<id>', _deletePersona);

  Future<Response> _getAllPersonas(Request request) async {
    final personas = await db.getAllPersonas();
    return Response.ok(
      jsonEncode(_personasToJson(personas)),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> _getPersonaById(Request request) async {
    final id = int.tryParse(request.params['id']!);
    if (id == null) {
      return Response.badRequest(body: 'ID inválido');
    }
    final persona = await db.getPersonaById(id);
    if (persona == null) {
      return Response.notFound('{"error": "Persona no encontrada"}');
    }
    return Response.ok(
      jsonEncode(_personaToJson(persona)),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> _createPersona(Request request) async {
    final body = await request.readAsString();
    final data = _parseJson(body);

    final persona = PersonasCompanion(
      nombre: Value(data['nombre'] as String),
      apellido: Value(data['apellido'] as String),
      documento: Value(data['documento'] as String),
      direccion: Value(data['direccion'] as String),
    );

    final id = await db.insertPersona(persona);
    return Response(
      201,
      body: '{"id": $id, "message": "Persona creada"}',
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> _updatePersona(Request request) async {
    final id = int.tryParse(request.params['id']!);
    if (id == null) {
      return Response.badRequest(body: 'ID inválido');
    }

    final existing = await db.getPersonaById(id);
    if (existing == null) {
      return Response.notFound('{"error": "Persona no encontrada"}');
    }

    final body = await request.readAsString();
    final data = _parseJson(body);

    final updated = Persona(
      id: id,
      nombre: data['nombre'] as String,
      apellido: data['apellido'] as String,
      documento: data['documento'] as String,
      direccion: data['direccion'] as String,
    );

    await db.updatePersona(updated);
    return Response.ok(
      '{"message": "Persona actualizada"}',
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> _patchPersona(Request request) async {
    final id = int.tryParse(request.params['id']!);
    if (id == null) {
      return Response.badRequest(body: 'ID inválido');
    }

    final existing = await db.getPersonaById(id);
    if (existing == null) {
      return Response.notFound('{"error": "Persona no encontrada"}');
    }

    final body = await request.readAsString();
    final data = _parseJson(body);

    final updated = Persona(
      id: id,
      nombre: data['nombre'] as String? ?? existing.nombre,
      apellido: data['apellido'] as String? ?? existing.apellido,
      documento: data['documento'] as String? ?? existing.documento,
      direccion: data['direccion'] as String? ?? existing.direccion,
    );

    await db.updatePersona(updated);
    return Response.ok(
      '{"message": "Persona actualizada parcialmente"}',
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> _deletePersona(Request request) async {
    final id = int.tryParse(request.params['id']!);
    if (id == null) {
      return Response.badRequest(body: 'ID inválido');
    }

    final existing = await db.getPersonaById(id);
    if (existing == null) {
      return Response.notFound('{"error": "Persona no encontrada"}');
    }

    await db.deletePersona(id);
    return Response.ok(
      '{"message": "Persona eliminada"}',
      headers: {'Content-Type': 'application/json'},
    );
  }

  Map<String, dynamic> _personaToJson(Persona p) => {
        'id': p.id,
        'nombre': p.nombre,
        'apellido': p.apellido,
        'documento': p.documento,
        'direccion': p.direccion,
      };

  List<Map<String, dynamic>> _personasToJson(List<Persona> personas) =>
      personas.map(_personaToJson).toList();

  Map<String, dynamic> _parseJson(String body) {
    return jsonDecode(body) as Map<String, dynamic>;
  }
}
