import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'offices.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE offices (id INTEGER PRIMARY KEY, name TEXT, address TEXT, phone TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertOffices(List<Map<String, dynamic>> offices) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var office in offices) {
        await txn.insert(
          'offices',
          office,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<Map<String, dynamic>>> getOffices() async {
    final db = await database;
    return await db.query('offices');
  }

  Future<void> clearOffices() async {
    final db = await database;
    await db.delete('offices');
  }
}
