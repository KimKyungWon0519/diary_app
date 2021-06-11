import 'dart:io';

import 'package:diary/database/todo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = 'todo';

class DBHelper {
  DBHelper._();

  static final DBHelper _db = DBHelper._();

  factory DBHelper() => _db;

  static Database _database;

  get database async {
    if (_database == null) {
      _database = await initDB();
    }

    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'TodoList.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        content TEXT,
        color_code INTEGER,
        icon_code INTEGER,
        date TEXT,
        clear INTEGER
      )
      ''');
      },
    );
  }

  createData(Todo todo) async {
    print(todo.colorCode);
    final Database db = await database;
    var res = db.insert(
      tableName,
      {
        'title': todo.title,
        'content': todo.content,
        'color_code': todo.colorCode,
        'icon_code': todo.iconCode,
        'date': todo.date,
        'clear': 0,
      },
    );
  }

  getTodoList(date) async {
    final Database db = await database;
    var res = await db.query(tableName, where: 'date = ?', whereArgs: [date]);

    return res
        .map(
          (e) => Todo(
            id: e['id'],
            title: e['title'],
            content: e['content'],
            colorCode: e['color_code'],
            iconCode: e['icon_code'],
            date: e['date'],
            clear: e['clear'],
          ),
        )
        ?.toList();
  }

  clearUpdate(id, value) async {
    final Database db = await database;

    await db.update(
      tableName,
      {
        'clear': value,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  deleteTodo(id) async {
    final Database db = await database;

    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  deleteAll(date) async {
    final Database db = await database;

    await db.delete(tableName, where: 'date = ?', whereArgs: [date]);
  }

  delete() async {
    final Database db = await database;

    await db.delete(tableName);
  }
}
