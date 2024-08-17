import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_record/model/datamodel.dart';

class Databaseconnection {
  Future<Database> setDatabases() async {
    var database = await openDatabase(
      'student_db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE studentdata(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, Class INTEGER, mobileNumber INTEGER, email TEXT)');
      },
    );

    return database;
  }
}
