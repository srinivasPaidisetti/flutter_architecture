import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutterbasictemplate/constant/constants.dart';
import 'package:flutterbasictemplate/model/db/db_model.dart';
import 'package:flutterbasictemplate/utils/catch_error_utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

mixin DatabaseHelper {
  Database? _db;

  Future<Database?> initDb() async {
    return catchError(() async {
      var documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "$APP_NAME.db");
      var theDb = await openDatabase(path, version: 4,
          onCreate: (Database db, int version) async {
        List<DbModel> tables = [];
        tables.addAll([]);
        tables.forEach((table) async {
          await db.execute(table.kCreateTable);
        });
      });
      return theDb;
    } as Database Function());
  }

  final _lock = new Lock();

  Future<Database?> getDb() async {
    return catchError(() async {
      if (_db == null) {
        await _lock.enqueue(() async {
          if (_db == null) {
            _db = await initDb();
          }
        });
      }
      return _db;
    } as Database Function());
  }

  Future<void> insertDoc(String tableName, Map<dynamic, dynamic> doc) async {
    return catchError(() async {
      final Database db = await (getDb() as FutureOr<Database>);
      await db.insert(tableName, doc as Map<String, Object?>,
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future? insertDocs(List<DbModel> docs) {
    return catchError(() async {
      final Database db = await (getDb() as FutureOr<Database>);
      final batch = db.batch();
      docs.forEach((doc) {
        batch.insert(doc.kTableName, doc.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
      await batch.commit(noResult: true);
    });
  }

  Future<T?> getDoc<T extends DbModel>(T table, dynamic id) async {
    return await _getDoc(table, id: id);
  }

  Future<T?> getFirstDoc<T extends DbModel>(T table) async {
    return await _getDoc(table);
  }

  Future<T?> _getDoc<T extends DbModel>(T table, {dynamic id}) async {
    return catchError(() async {
      final Database? db = await getDb();
      T? doc;
      if (id != null) {
        final List<Map<String, dynamic>> maps =
            await db!.query(table.kTableName, where: 'id = ?', whereArgs: [id]);
        if (maps.isNotEmpty) {
          doc = await table.fromJson(maps.first);
        } else {
          doc = table;
        }
        return doc;
      } else {
        final List<Map<String, dynamic>> maps =
            await db!.query(table.kTableName);
        if (maps.isNotEmpty) {
          doc = await table.fromJson(maps.first);
        } else {
          doc = table;
        }
        return doc;
      }
    } as T Function());
  }

  Future<List<T>?> getDocs<T extends DbModel>(T table,
      {String? where, List? whereArgs}) async {
    return await _getDocs(table, where: where, whereArgs: whereArgs);
  }

  Future<List<T>?> _getDocs<T extends DbModel>(T table,
      {String? where, List? whereArgs}) async {
    return catchError(() async {
      final db = await (getDb() as FutureOr<Database>);
      final List<Map<String, dynamic>> docs =
          await db.query(table.kTableName, where: where, whereArgs: whereArgs);
      final mappedDocs =
          docs?.map((doc) => table.fromJson(doc))?.toList()?.cast<T>();
      return mappedDocs ?? <T>[];
    } as List<T> Function());
  }

  Future deleteDoc(String tableName, int id) async {
    return catchError(() async {
      final Database db = await (getDb() as FutureOr<Database>);
      await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    });
  }

  Future deleteDocs(String tableName) async {
    return catchError(() async {
      final Database db = await (getDb() as FutureOr<Database>);
      await db.delete(tableName);
    });
  }
}
