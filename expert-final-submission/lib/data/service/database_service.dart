import 'package:flutter_recap/data/model/dog_breed_detail_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Database? _database;

  DatabaseService._internal() {
    _instance = this;
  }

  factory DatabaseService() => _instance ?? DatabaseService._internal();

  final String tableName = 'dogBreed';

  Future<Database?> get database async => _database ??= await _initializeDb();

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/dogBreedApp.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableName (
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

  Future<int> insertDogBreed(DogBreedDetailModel breed) async {
    final db = await database;
    return await db!.insert(tableName, breed.toJson());
  }

  Future<List<DogBreedDetailModel>> getDogBreed() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(tableName);

    return results.map((res) => DogBreedDetailModel.fromJson(res)).toList();
  }

  Future<bool> getDogBreedByDetail(DogBreedDetailModel breed) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      tableName,
      where: 'breed = ? and message = ?',
      whereArgs: [breed.breed, breed.message],
    );

    return results.isNotEmpty;
  }

  Future<int> removeDogBreed(DogBreedDetailModel breed) async {
    final db = await database;

    return await db!.delete(
      tableName,
      where: 'breed = ? and message = ?',
      whereArgs: [breed.breed, breed.message],
    );
  }
}
