import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'category.dart';
import 'note.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'notes.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT UNIQUE
      )''');

      db.execute('''CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        category TEXT
      )''');
    });
  }

  // Insert a note
  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert('notes', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Insert a category
  Future<void> insertCategory(Category category) async {
    final db = await database;
    await db.insert('categories', category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get all notes
  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');

    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  // Get notes by category
  Future<List<Note>> getNotesByCategory(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('notes', where: 'category = ?', whereArgs: [category]);

    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  // Get all categories
  Future<List<Category>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('categories');

    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  // Update a note
  Future<void> updateNote(Note note) async {
    final db = await database;
    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete a note
  Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
