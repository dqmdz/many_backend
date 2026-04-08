// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PersonasTable extends Personas with TableInfo<$PersonasTable, Persona> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _apellidoMeta =
      const VerificationMeta('apellido');
  @override
  late final GeneratedColumn<String> apellido = GeneratedColumn<String>(
      'apellido', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _documentoMeta =
      const VerificationMeta('documento');
  @override
  late final GeneratedColumn<String> documento = GeneratedColumn<String>(
      'documento', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _direccionMeta =
      const VerificationMeta('direccion');
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
      'direccion', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nombre, apellido, documento, direccion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personas';
  @override
  VerificationContext validateIntegrity(Insertable<Persona> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('apellido')) {
      context.handle(_apellidoMeta,
          apellido.isAcceptableOrUnknown(data['apellido']!, _apellidoMeta));
    } else if (isInserting) {
      context.missing(_apellidoMeta);
    }
    if (data.containsKey('documento')) {
      context.handle(_documentoMeta,
          documento.isAcceptableOrUnknown(data['documento']!, _documentoMeta));
    } else if (isInserting) {
      context.missing(_documentoMeta);
    }
    if (data.containsKey('direccion')) {
      context.handle(_direccionMeta,
          direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta));
    } else if (isInserting) {
      context.missing(_direccionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Persona map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Persona(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      apellido: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}apellido'])!,
      documento: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}documento'])!,
      direccion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direccion'])!,
    );
  }

  @override
  $PersonasTable createAlias(String alias) {
    return $PersonasTable(attachedDatabase, alias);
  }
}

class Persona extends DataClass implements Insertable<Persona> {
  final int id;
  final String nombre;
  final String apellido;
  final String documento;
  final String direccion;
  const Persona(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.documento,
      required this.direccion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['apellido'] = Variable<String>(apellido);
    map['documento'] = Variable<String>(documento);
    map['direccion'] = Variable<String>(direccion);
    return map;
  }

  PersonasCompanion toCompanion(bool nullToAbsent) {
    return PersonasCompanion(
      id: Value(id),
      nombre: Value(nombre),
      apellido: Value(apellido),
      documento: Value(documento),
      direccion: Value(direccion),
    );
  }

  factory Persona.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Persona(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      apellido: serializer.fromJson<String>(json['apellido']),
      documento: serializer.fromJson<String>(json['documento']),
      direccion: serializer.fromJson<String>(json['direccion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'apellido': serializer.toJson<String>(apellido),
      'documento': serializer.toJson<String>(documento),
      'direccion': serializer.toJson<String>(direccion),
    };
  }

  Persona copyWith(
          {int? id,
          String? nombre,
          String? apellido,
          String? documento,
          String? direccion}) =>
      Persona(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        documento: documento ?? this.documento,
        direccion: direccion ?? this.direccion,
      );
  Persona copyWithCompanion(PersonasCompanion data) {
    return Persona(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      apellido: data.apellido.present ? data.apellido.value : this.apellido,
      documento: data.documento.present ? data.documento.value : this.documento,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Persona(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('apellido: $apellido, ')
          ..write('documento: $documento, ')
          ..write('direccion: $direccion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, apellido, documento, direccion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Persona &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.apellido == this.apellido &&
          other.documento == this.documento &&
          other.direccion == this.direccion);
}

class PersonasCompanion extends UpdateCompanion<Persona> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> apellido;
  final Value<String> documento;
  final Value<String> direccion;
  const PersonasCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.apellido = const Value.absent(),
    this.documento = const Value.absent(),
    this.direccion = const Value.absent(),
  });
  PersonasCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String apellido,
    required String documento,
    required String direccion,
  })  : nombre = Value(nombre),
        apellido = Value(apellido),
        documento = Value(documento),
        direccion = Value(direccion);
  static Insertable<Persona> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? apellido,
    Expression<String>? documento,
    Expression<String>? direccion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (apellido != null) 'apellido': apellido,
      if (documento != null) 'documento': documento,
      if (direccion != null) 'direccion': direccion,
    });
  }

  PersonasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nombre,
      Value<String>? apellido,
      Value<String>? documento,
      Value<String>? direccion}) {
    return PersonasCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      documento: documento ?? this.documento,
      direccion: direccion ?? this.direccion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (apellido.present) {
      map['apellido'] = Variable<String>(apellido.value);
    }
    if (documento.present) {
      map['documento'] = Variable<String>(documento.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonasCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('apellido: $apellido, ')
          ..write('documento: $documento, ')
          ..write('direccion: $direccion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PersonasTable personas = $PersonasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [personas];
}

typedef $$PersonasTableCreateCompanionBuilder = PersonasCompanion Function({
  Value<int> id,
  required String nombre,
  required String apellido,
  required String documento,
  required String direccion,
});
typedef $$PersonasTableUpdateCompanionBuilder = PersonasCompanion Function({
  Value<int> id,
  Value<String> nombre,
  Value<String> apellido,
  Value<String> documento,
  Value<String> direccion,
});

class $$PersonasTableFilterComposer
    extends Composer<_$AppDatabase, $PersonasTable> {
  $$PersonasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get apellido => $composableBuilder(
      column: $table.apellido, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get documento => $composableBuilder(
      column: $table.documento, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get direccion => $composableBuilder(
      column: $table.direccion, builder: (column) => ColumnFilters(column));
}

class $$PersonasTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonasTable> {
  $$PersonasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get apellido => $composableBuilder(
      column: $table.apellido, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get documento => $composableBuilder(
      column: $table.documento, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get direccion => $composableBuilder(
      column: $table.direccion, builder: (column) => ColumnOrderings(column));
}

class $$PersonasTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonasTable> {
  $$PersonasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get apellido =>
      $composableBuilder(column: $table.apellido, builder: (column) => column);

  GeneratedColumn<String> get documento =>
      $composableBuilder(column: $table.documento, builder: (column) => column);

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);
}

class $$PersonasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonasTable,
    Persona,
    $$PersonasTableFilterComposer,
    $$PersonasTableOrderingComposer,
    $$PersonasTableAnnotationComposer,
    $$PersonasTableCreateCompanionBuilder,
    $$PersonasTableUpdateCompanionBuilder,
    (Persona, BaseReferences<_$AppDatabase, $PersonasTable, Persona>),
    Persona,
    PrefetchHooks Function()> {
  $$PersonasTableTableManager(_$AppDatabase db, $PersonasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nombre = const Value.absent(),
            Value<String> apellido = const Value.absent(),
            Value<String> documento = const Value.absent(),
            Value<String> direccion = const Value.absent(),
          }) =>
              PersonasCompanion(
            id: id,
            nombre: nombre,
            apellido: apellido,
            documento: documento,
            direccion: direccion,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nombre,
            required String apellido,
            required String documento,
            required String direccion,
          }) =>
              PersonasCompanion.insert(
            id: id,
            nombre: nombre,
            apellido: apellido,
            documento: documento,
            direccion: direccion,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PersonasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PersonasTable,
    Persona,
    $$PersonasTableFilterComposer,
    $$PersonasTableOrderingComposer,
    $$PersonasTableAnnotationComposer,
    $$PersonasTableCreateCompanionBuilder,
    $$PersonasTableUpdateCompanionBuilder,
    (Persona, BaseReferences<_$AppDatabase, $PersonasTable, Persona>),
    Persona,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PersonasTableTableManager get personas =>
      $$PersonasTableTableManager(_db, _db.personas);
}
