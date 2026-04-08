import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:persona_crud/database/database.dart';
import 'package:persona_crud/routes/persona_routes.dart';

void main() async {
  final db = AppDatabase();
  final personaRoutes = PersonaRoutes(db);

  final appRouter = Router()..mount('/api/personas', personaRoutes.router.call);

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(_corsMiddleware())
      .addHandler(appRouter.call);

  final server = await shelf_io.serve(handler, 'localhost', 5000);
  print('Servidor corriendo en http://${server.address.host}:${server.port}');
}

Middleware _corsMiddleware() {
  return (innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: _corsHeaders);
      }
      final response = await innerHandler(request);
      final body = await response.readAsString();
      return Response(
        response.statusCode,
        body: body,
        headers: {...response.headers, ..._corsHeaders},
      );
    };
  };
}

const _corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
};
