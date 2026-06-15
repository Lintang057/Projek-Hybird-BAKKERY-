import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bakery.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // ==========================
        // PRODUCTS
        // ==========================
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            price TEXT NOT NULL,
            image TEXT NOT NULL
          )
        ''');

        // ==========================
        // CART
        // ==========================
        await db.execute('''
          CREATE TABLE cart(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT NOT NULL,
            price TEXT NOT NULL,
            image TEXT NOT NULL
          )
        ''');

        // ==========================
        // HISTORY
        // ==========================
        await db.execute('''
          CREATE TABLE history(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT NOT NULL,
            price TEXT NOT NULL,
            image TEXT NOT NULL,
            orderDate TEXT NOT NULL
          )
        ''');

        // ==========================
        // USERS
        // ==========================
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // ==================================================
  // PRODUCTS
  // ==================================================

  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.insert('products', product);
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('products');
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;

    return await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ==================================================
  // CART
  // ==================================================

  Future<int> insertCart(Map<String, dynamic> item) async {
    final db = await database;
    return await db.insert('cart', item);
  }

  Future<List<Map<String, dynamic>>> getCart() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<int> deleteCart(int id) async {
    final db = await database;

    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }

  // ==================================================
  // HISTORY
  // ==================================================

  Future<int> insertHistory(Map<String, dynamic> item) async {
    final db = await database;
    return await db.insert('history', item);
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    final db = await database;

    return await db.query(
      'history',
      orderBy: 'id DESC',
    );
  }

  // ==================================================
  // USERS
  // ==================================================

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> loginUser(
    String email,
    String password,
  ) async {
    final db = await database;

    return await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
  }

  Future<Map<String, dynamic>?> getUserByEmail(
    String email,
  ) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  Future<int> updatePassword(
    String email,
    String newPassword,
  ) async {
    final db = await database;

    return await db.update(
      'users',
      {'password': newPassword},
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }

  Future<void> printDatabase() async {
    final db = await database;

    print('\n===== USERS =====');
    print(await db.query('users'));

    print('\n===== PRODUCTS =====');
    print(await db.query('products'));

    print('\n===== CART =====');
    print(await db.query('cart'));

    print('\n===== HISTORY =====');
    print(await db.query('history'));
  }

  Future<int> deleteUser(int id) async {
    final db = await database;

    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}