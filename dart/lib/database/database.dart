import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:xdg_directories/xdg_directories.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Personas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().withLength(min: 1, max: 100)();
  TextColumn get apellido => text().withLength(min: 1, max: 100)();
  TextColumn get documento => text().withLength(min: 1, max: 20)();
  TextColumn get direccion => text().withLength(min: 1, max: 200)();
}

@DriftDatabase(tables: [Personas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Persona>> getAllPersonas() => select(personas).get();

  Future<Persona?> getPersonaById(int id) =>
      (select(personas)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertPersona(PersonasCompanion persona) =>
      into(personas).insert(persona);

  Future<bool> updatePersona(Persona persona) =>
      update(personas).replace(persona);

  Future<int> deletePersona(int id) =>
      (delete(personas)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dataDir = dataHome;
    final dbDir = Directory('${dataDir.path}/persona_crud');
    if (!await dbDir.exists()) {
      await dbDir.create(recursive: true);
    }
    final file = File(p.join(dbDir.path, 'personas.db'));
    return NativeDatabase.createInBackground(file);
  });
}
