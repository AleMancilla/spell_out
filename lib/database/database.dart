import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:spell_out/models/word.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DicctionaryDataBase {
  static final DicctionaryDataBase instance = DicctionaryDataBase._init();

  factory DicctionaryDataBase() {
    return instance;
  }

  DicctionaryDataBase._init();
  static late String dbPath;
  // static late Database db;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    await _chargeDatabase();
    await _fitstCreation();
    _database = await openDatabase(dbPath);
    return _database!;
  }

  static Future _chargeDatabase() async {
    var dbDir = await getDatabasesPath();
    dbPath = join(dbDir, "app.db");
    rng = Random();
  }

  static late Random rng;

  static Future _fitstCreation() async {
    _database = await openDatabase(dbPath);
    var askForTable = await _database!
        .rawQuery("SELECT name FROM sqlite_master WHERE name='words'");
    if (askForTable.isEmpty) {
      // Delete any existing database:
      await deleteDatabase(dbPath);

      // Create the writable database file from the bundled demo database file:
      ByteData data = await rootBundle.load("assets/mi_base_de_datos1.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    _database!.close();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future<List<Map<String, Object?>>> findbyword(String text) async {
    return await _database!
        .rawQuery("select * from words where word = '$text'");
  }

  Future<List<Map<String, Object?>>> findbyid(int id) async {
    return await _database!.rawQuery("select * from words where id = $id");
  }

  Future<Word> randomWord() async {
    int maxID = await getLength();

    int randomId = (rng.nextInt(maxID - 1) + 1);
    List<Map<String, Object?>> result = await findbyid(randomId);
    List<Word> listToResult = result
        .map((e) => Word(
            id: e['id'] as int,
            word: e['word'] as String,
            esp: e['esp'] as String,
            desc: e['desc'] as String))
        .toList();
    return listToResult[0];
  }

  Future<List<Word>> getByWord(String text) async {
    List<Map<String, Object?>> result = await findbyword(text);
    List<Word> listToResult = result
        .map((e) => Word(
            id: e['id'] as int,
            word: e['word'] as String,
            esp: e['esp'] as String,
            desc: e['desc'] as String))
        .toList();

    return listToResult;
  }

  Future<int> getLength() async {
    var data = await _database!.rawQuery("select count(*) as last from words ");
    int count = 1;
    for (var e in data) {
      count = e['last'] as int;
    }
    return count;
  }
}
