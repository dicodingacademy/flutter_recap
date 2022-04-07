import 'package:flutter_recap/model/dog_breed_detail.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Database? _database;

  DatabaseService._internal() {
    _instance = this;
  }

  factory DatabaseService() => _instance ?? DatabaseService._internal();

  static const String _tableName = 'dogBreed';

  Future<Database?> get database async => _database ??= await _initializeDb();

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/dogBreedApp.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableName (
             url TEXT PRIMARY KEY,
             message TEXT,
             breed TEXT,
             status TEXT
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertDogBreed(DogBreedDetail breed) async {
    final db = await database;
    await db!.insert(_tableName, breed.toJson());
  }

  Future<List<DogBreedDetail>> getDogBreed() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tableName);

    return results.map((res) => DogBreedDetail.fromJson(res)).toList();
  }

  Future<bool> getDogBreedByDetail(DogBreedDetail breed) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tableName,
      where: 'breed = ? and message = ?',
      whereArgs: [breed.breed, breed.message],
    );

     return results.isNotEmpty;
  }

  Future<void> removeDogBreed(DogBreedDetail breed) async {
    final db = await database;

    await db!.delete(
      _tableName,
      where: 'breed = ? and message = ?',
      whereArgs: [breed.breed, breed.message],
    );
  }
}
