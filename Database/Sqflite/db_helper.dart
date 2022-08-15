import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflite;

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
  }
}
