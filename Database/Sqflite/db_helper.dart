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
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
