import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AuthService {
  static Database? _db;

  // Initialize the database
  static Future<void> initDb() async {
    if (_db == null) {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'user_database.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)",
          );
        },
        version: 1,
      );
    }
  }

  // Signup user and store in database
  static Future<bool> signup(
      String username, String email, String password) async {
    await initDb();
    try {
      await _db!.insert(
        'users',
        {
          'username': username,
          'email': email,
          'password': password,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      print('Error during signup: $e');
      return false;
    }
  }

  // Login user (simple email/password check)
  static Future<bool> login(String email, String password) async {
    await initDb();
    var result = await _db!.query(
      'users',
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  // Get username by email
  static Future<String> getUsernameByEmail(String email) async {
    await initDb();
    var result = await _db!.query(
      'users',
      where: "email = ?",
      whereArgs: [email],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result[0]['username'] as String;
    } else {
      throw Exception('User not found');
    }
  }
}
