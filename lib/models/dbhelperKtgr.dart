import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'itemK.dart';

class DbHelperKtgr {
  static DbHelperKtgr _dbHelperKtgr;
  static Database _database;
  DbHelperKtgr._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yang dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'itemK.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 5, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama itemK
  void _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE itemK (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kode TEXT,
      kategori TEXT
    )
    ''');
  }

  //select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('itemK', orderBy: 'kategori');
    return mapList;
  }

  //create databases
  Future<int> insert(ItemK object) async {
    Database db = await this.initDb();
    int count = await db.insert('itemK', object.toMap());
    return count;
  }

  //update databases
  Future<int> update(ItemK object) async {
    Database db = await this.initDb();
    int count = await db.update('itemK', object.toMap(),
    where: 'id=?',
    whereArgs: [object.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('itemK',
    where: 'id=?',
    whereArgs: [id]);
    return count;
  }

  Future<List<ItemK>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<ItemK> itemList = List<ItemK>();
      for (int i=0; i<count; i++) {
        itemList.add(ItemK.fromMap(itemMapList[i]));
      }
    return itemList;
  }

  factory DbHelperKtgr() {
    if (_dbHelperKtgr== null) {
      _dbHelperKtgr = DbHelperKtgr._createObject();
    }
    return _dbHelperKtgr;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}