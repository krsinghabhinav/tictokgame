import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class fitnessDatabaseService {
  static final fitnessDatabaseService _instance = fitnessDatabaseService._();
  static Database? _database;

  fitnessDatabaseService._();

  factory fitnessDatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'fitness_app.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE steps (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        steps INTEGER NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        exercise TEXT NOT NULL,
        duration INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertSteps(String date, int steps) async {
    final db = await database;
    return db.insert('steps', {'date': date, 'steps': steps});
  }

  Future<int> insertExercise(String date, String exercise, int duration) async {
    final db = await database;
    return db.insert('exercises',
        {'date': date, 'exercise': exercise, 'duration': duration});
  }

  Future<List<Map<String, dynamic>>> getSteps() async {
    final db = await database;
    return db.query('steps');
  }

  Future<List<Map<String, dynamic>>> getExercises() async {
    final db = await database;
    return db.query('exercises');
  }
}
