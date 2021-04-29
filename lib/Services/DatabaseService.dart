import 'dart:io';
import 'package:password_saver/Models/Account.dart';
import 'package:password_saver/Models/Category.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "instadownloady.db";

  static final _databaseVersion = 1;
  //singlton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //sinle wide app refrence to the database;
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onConfigure: _onConfigure);
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE categories (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          color INTEGER NOT NULL
        )
    ''');
    await db.execute('''
        CREATE TABLE accounts (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          auth TEXT NOT NULL,
          icon TEXT NOT NULL,
          color INTEGER NOT NULL,
          password TEXT NOT NULL,
          catId INTEGER NOT NULL,
          FOREIGN KEY (catId) REFERENCES categories (id)
        )
    ''');
  }

  //inserts

  Future<int> insertCategory(Category category) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.insert("categories", category.toJson());
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<int> insertAccount(Account account) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.insert("accounts", account.toJson());
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    Database db = await instance.database;
    return await db.query("categories");
  }

  Future<List<Map<String, dynamic>>> getAllAccounts() async {
    Database db = await instance.database;
    return await db.query("accounts");
  }

  Future<int> deleteUser(Category category) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db
          .delete("categories", where: "id = ?", whereArgs: [category.id]);
    } catch (e) {
      id = -1;
    }
    return id;
  }
}
