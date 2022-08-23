import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflite;
import './note_model.dart';

class DBHelper {
  //* Init database here
  static final DBHelper instance = DBHelper._init();
  static sqflite.Database? _database;

  DBHelper._init();

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('note_database.db');
    return _database!;
  }

  Future<sqflite.Database> _initDB(String databaseName) async {
    final dbPath = await sqflite.getDatabasesPath();
    final path = pathPackage.join(dbPath, databaseName);

    return await sqflite.openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(sqflite.Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const textTypeNull = 'TEXT';
    const intType = 'INTEGER NOT NULL';
    const intTypeNull = 'INTEGER';
    const boolType = 'BOOLEAN NOT NULL';
    const boolTypeNull = 'BOOLEAN';

    db.execute('''
      CREATE TABLE $tableNotes(
        ${NoteFields.id} $idType,
        ${NoteFields.isImportant} $boolType,
        ${NoteFields.number} $intType,
        ${NoteFields.title} $textType,
        ${NoteFields.description} $textType,
        ${NoteFields.createdTime} $textType
      )
    ''');

    db.execute('''
      //! Create your second table as you know
    ''');
  }

  Future<NoteModel> create(NoteModel noteModel) async {
    final db = await instance.database;

    final id = await db.insert(tableNotes, noteModel.toJson());
    return noteModel.copy(id: id);

    //* or you can have this syntax
    // ignore: dead_code
    final json = noteModel.toJson();
    final columns =
        '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.createdTime}';
    final values =
        '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.createdTime]}}';
    final idNo2 = await db
        .rawInsert('INSERT INTO $tableNotes ($columns) VALUES ($values)');
  }

  Future<NoteModel> readNote(int id) async {
    final db = await instance.database;

    final myNote = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (myNote.isNotEmpty) {
      return NoteModel.fromJson(myNote.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<NoteModel>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.createdTime} ASC';
    final allData = await db.query(tableNotes, orderBy: orderBy);
    return allData.map((e) => NoteModel.fromJson(e)).toList();

    //* or you can have this syntax
    // ignore: dead_code
    final allData2 =
        await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
  }

  Future<int> update(NoteModel noteModel) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      noteModel.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [noteModel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
