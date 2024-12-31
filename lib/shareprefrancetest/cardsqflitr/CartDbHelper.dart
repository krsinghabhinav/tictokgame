import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:tictokgame/shareprefrancetest/cardsqflitr/Cartmodel.dart';

class CartDbHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'cart.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, name TEXT, price REAL)',
      );
    });
  }

  // Insert a cart item into the database
  Future<void> insertCartItem(CartItem item) async {
    final db = await database;
    await db.insert('cart', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get all cart items
  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart');

    return List.generate(maps.length, (i) {
      return CartItem.fromMap(maps[i]);
    });
  }

  // Delete a cart item by ID
  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  // Clear the cart
  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }
}
