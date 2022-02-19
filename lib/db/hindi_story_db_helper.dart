import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late Database db;
  List category = [];
  List homeCategory = [];

  Future databaseGet() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "hindi_stories.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "hindi_stories.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    // open the database
    var db = await openDatabase(path);
    category = await db.query('REMEDIES');
    homeCategory =  await db.query('REMEDIE_TYPE');
    if (kDebugMode) {
      print(category.length);
    }
  }
}
