import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'item.dart';

class DbHelperMenu {
  static DbHelperMenu _dbHelperMenu;
  static Database _database;
  DbHelperMenu._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yang dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 5, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE item (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kode TEXT,
      menu TEXT,
      kategori TEXT,
      harga INTEGER
    )
    ''');
  }

  //select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'menu');
    return mapList;
  }

  //create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  //update databases
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db.update('item', object.toMap(),
    where: 'id=?',
    whereArgs: [object.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item',
    where: 'id=?',
    whereArgs: [id]);
    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
      for (int i=0; i<count; i++) {
        itemList.add(Item.fromMap(itemMapList[i]));
      }
    return itemList;
  }

  factory DbHelperMenu() {
    if (_dbHelperMenu == null) {
      _dbHelperMenu = DbHelperMenu._createObject();
    }
    return _dbHelperMenu;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}