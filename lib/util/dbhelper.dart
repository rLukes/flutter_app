import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/model/book.dart';

class DbHelper{
  String tblBook = "book";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";
  static Database _db;

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper(){
    return _dbHelper;
  }

  Future<Database> get db async{
    if(_db == null){
      _db = await initalizeDb();
    }
    return _db;
  }

  Future<Database> initalizeDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "book.db";
    var dbBook = await openDatabase(path,version: 1, onCreate: _createDb);
    return dbBook;
  }

  void _createDb(Database db, int version) async{
    await db.execute(
      "CREATE TABLE $tblBook($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)"
    );
  }

  Future<int> insertBook(Book book) async{
    Database db = await this.db;
    var result = await db.insert(tblBook, book.toMap());
    return result;
  }

  Future<List> getBooks() async{
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblBook order by $colPriority ASC");
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("SELECT count(*) from $tblBook")
    );
    return result;
  }

  Future<int> updateBook(Book book) async{
    Database db = await this.db;
    var result = await db.update(tblBook, book.toMap(),
      where: "$colId = ?", whereArgs: [book.id]
    );
    return result;
  }

  Future<int> deleteBook(int id) async{
    Database db = await this.db;
    var result = await db.rawDelete('DELETE FROM $tblBook WHERE $colId = $id');
    return result;
  }
}