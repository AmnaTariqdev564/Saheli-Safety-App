import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('contacts.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        number TEXT NOT NULL,
        relation TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertContact(
    String name,
    String number,
    String relation,
  ) async {
    final db = await instance.database;

    await db.insert('contacts', {
      'name': name,
      'number': number,
      'relation': relation,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
