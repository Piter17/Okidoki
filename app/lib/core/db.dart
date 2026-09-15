import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<String> getDbPath() async =>
    join(await getDatabasesPath(), 'riverpod.db');
