import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/favorite_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  /// Create a instance Private oF Class
  DbHelper._();
  static final DbHelper db = DbHelper._();

  /// Create a Variable oF Db
  Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database?> initDB() async {
    /// Create a Path
    String path = join(await getDatabasesPath(), 'CartUser.db');

    /// Initialize Database And Create The Table
    return await openDatabase(path, version: 1,
        onCreate: (Database? database, int version) async {
      await database!.execute('''
      CREATE TABLE $tableCart (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      productId TEXT NOT NULL,
      title TEXT NOT NULL,
      image TEXT NOT NULL,
      quantity INTEGER NOT NULL,
      price TEXT NOT NULL
      )''');
      await database.execute('''
      CREATE TABLE $tableFavorite (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      productId TEXT NOT NULL,
      title TEXT NOT NULL,
      image TEXT NOT NULL,
      price TEXT NOT NULL
      )''');
    });
  }

  /// CRUD => Create , Read , Update , Delete
  /// Carts Db
  Future<int?> insertCartDb(CartModel cartModel) async {
    Database? dbCart = await database;
    return await dbCart!.insert(
      tableCart,
      cartModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartModel>?> getAllCarts() async {
    Database? dbCart = await database;
    List<Map<String, dynamic>> data = await dbCart!.query(tableCart);
    if (data.isNotEmpty) {
      return data.map((item) => CartModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }

  Future<int?> updateCartDb(CartModel cartModel) async {
    Database? dbCart = await database;
    return await dbCart!.update(tableCart, cartModel.toMap(),
        where: 'id = ?', whereArgs: [cartModel.id]);
  }

  Future<int?> deleteCartDb(int id) async {
    Database? dbCart = await database;
    return await dbCart!.delete(tableCart, where: 'id = ?', whereArgs: [id]);
  }

  /// Favorite Db
  Future<int?> insertFavDb(FavoriteModel favoriteModel) async {
    Database? dbClient = await database;
    await dbClient!.insert(tableFavorite, favoriteModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<FavoriteModel>?> getAllFav() async {
    Database? dbClient = await database;
    List<Map<String, dynamic>> data = await dbClient!.query(tableFavorite);
    if (data.isNotEmpty) {
      return data.map((item) => FavoriteModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }

  Future<int?> updateFavDb(FavoriteModel favoriteModel) async {
    Database? dbClient = await database;
    await dbClient!.update(tableFavorite, favoriteModel.toMap(),
        where: 'id = ?', whereArgs: [favoriteModel.id]);
  }

  Future<int?> deleteFavDb(int id) async {
    Database? dbClient = await database;
    await dbClient!.delete(tableFavorite, where: 'id = ?', whereArgs: [id]);
  }
}
