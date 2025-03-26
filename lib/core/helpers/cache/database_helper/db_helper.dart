import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:ejary/core/di/di.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbHelper {
  DbHelper() {
    initWinDB();
  }

  static Future<Database> initWinDB() async {
    sqfliteFfiInit();
    String? userProfile =
        Platform.isWindows
            ? Platform.environment['USERPROFILE']
            : Platform.isMacOS
            ? Platform.environment['CFFIXED_USER_HOME']
            : '';
    late String documentsPath;
    if (userProfile != null) {
      if (Platform.isWindows) {
        documentsPath = '$userProfile\\Documents';
      } else {
        documentsPath = '$userProfile/Documents';
      }
      log('Documents Directory: $documentsPath');
    } else {
      documentsPath = '';
      log('Could not determine Documents directory.');
    }
    late String dbPath;

    if (Platform.isWindows) {
      dbPath = '$documentsPath\\ejary.db';
    } else {
      dbPath = '$documentsPath/ejary.db';
    }

    final databaseFactory = databaseFactoryFfi;
    return await databaseFactory.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        onConfigure: (db) async => await db.execute("PRAGMA foreign_keys = ON"),
        onCreate: _onCreate,
        // onUpgrade: _onUpgrade,
        version: 6,
      ),
    );
  }

  static Future<void> _onCreate(Database database, int version) async {
    final db = database;
    _createUserTable(db);
  }

  static void _createUserTable(Database db) async {
    await db.execute("""
    CREATE TABLE IF NOT EXISTS ${TableName.userTable} (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_picture_path TEXT
    );
 """);
  }

  static Future<List<Map<String, dynamic>>> getAll(String tableName) async {
    final db = sl<Database>();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps;
  }

  static Future<Map<String, dynamic>> getRecordById(
    int id, {
    required String tableName,
  }) async {
    final db = sl<Database>();
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.first;
  }

  static Future<Map<String, dynamic>?> getRecordByEmail(
    String email, {
    required String tableName,
  }) async {
    final db = sl<Database>();
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    return maps.firstOrNull;
  }

  static Future<Map<String, dynamic>?> getRecordByPhoneNumber(
    String phoneNumber, {
    required String tableName,
  }) async {
    final db = sl<Database>();
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'phone_number = ?',
      whereArgs: [phoneNumber],
    );
    return maps.firstOrNull;
  }

  static Future<bool> deleteUser(String email) async {
    final db = sl<Database>();
    int result = await db.delete(
      TableName.userTable,
      where: 'email = ?',
      whereArgs: [email],
    );

    return result > 0;
  }

  static Future<int> insertData(String table, Map<String, dynamic> data) async {
    try {
      'Inserting data into $table: $data'.logger();
      int insertedId = await sl<Database>().insert(
        table,
        data,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      return insertedId;
    } catch (e) {
      log('Error inserting data: $e');
      return -1;
    }
  }

  static Future<bool> deleteData(
    String table,
    String where,
    List<dynamic> whereArgs,
  ) async {
    try {
      await sl<Database>().delete(
        table,
        where: '$where = ?',
        whereArgs: whereArgs,
      );
      return true;
    } catch (e) {
      log('Error deleting data: $e');
      return false;
    }
  }

  static Future<bool> updateData(
    String table,
    Map<String, dynamic> data,
    String where,
    List<dynamic> whereArgs,
  ) async {
    try {
      final updateResult = await sl<Database>().update(
        table,
        data,
        where: '$where = ?',
        whereArgs: whereArgs,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      log('DbHelper: updateData: updateResult = $updateResult');
      return true;
    } catch (e) {
      log('Error updating data: $e');
      return false;
    }
  }

  static Future updateRawData(
    String tableName,
    List<String> values,
    List<dynamic> parameters,
  ) async {
    sl<Database>().execute(
      'update $tableName set $values where id = ?${parameters.last}',
      parameters,
    );
  }

  static Future<List<T>> getData<T>(
    String tableName,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final List<Map<String, dynamic>> maps = await sl<Database>().query(
        tableName,
      );
      final List<T> dataList = maps.map((map) => fromJson(map)).toList();
      return dataList;
    } catch (e) {
      log('Error retrieving data: $e');
      // return FailureDataResponse('Error retrieving data: $e');
      return [];
    }
  }

  static Future<List<T>> getDataWhere<T>(
    String tableName,
    T Function(Map<String, dynamic>) fromJson, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    try {
      final List<Map<String, dynamic>> maps = await sl<Database>().query(
        tableName,
        where: where,
        whereArgs: whereArgs,
      );
      final List<T> dataList = maps.map((map) => fromJson(map)).toList();
      return dataList;
    } catch (e) {
      log('Error retrieving data: $e');
      // return FailureDataResponse('Error retrieving data: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> searchRecords(
    String tableName, {
    String? nameOrJobSearch,
    String? name,
    String? job,
    String? workingHours,
    String? workingDays,
    String? identityNumber,
  }) async {
    List<String> conditions = [];
    List<dynamic> args = [];
    if (nameOrJobSearch != null && nameOrJobSearch.isNotEmpty) {
      conditions.add("(first_name LIKE ? OR last_name LIKE ? OR job like ?)");
      args.add('%$nameOrJobSearch%');
      args.add('%$nameOrJobSearch%');
      args.add('%$nameOrJobSearch%');
    } else {
      if (name != null && name.isNotEmpty) {
        conditions.add("(first_name LIKE ? OR last_name LIKE ?)");
        args.add('%$name%');
        args.add('%$name%');
      }

      if (job != null && job.isNotEmpty) {
        conditions.add('job LIKE ?');
        args.add('%$job%');
      }

      if (workingHours != null && workingHours.isNotEmpty) {
        conditions.add('working_hours LIKE ?');
        args.add('%$workingHours%');
      }

      if (workingDays != null && workingDays.isNotEmpty) {
        conditions.add('working_days LIKE ?');
        args.add('%$workingDays%');
      }

      if (identityNumber != null && identityNumber.isNotEmpty) {
        conditions.add('identity_number LIKE ?');
        args.add('%$identityNumber%');
      }
    }

    String whereClause = conditions.isNotEmpty ? conditions.join(" AND ") : "";

    return await sl<Database>().query(
      tableName,
      where: whereClause.isNotEmpty ? whereClause : null,
      whereArgs: whereClause.isNotEmpty ? args : null,
    );
  }

  static Future<void> closeDb(Database db) async {
    await db.close();
  }

  static FutureOr<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    await db.execute('''
        ALTER TABLE ${TableName.userTable}
        ADD COLUMN phone_number VARCHAR(255) UNIQUE NOT NULL
      ''');
  }
}
