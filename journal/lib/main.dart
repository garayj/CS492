import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/app.dart';
import 'package:journal/models/databaseManager.dart';

const String DB_PATH = "db/schema_1.sql.txt";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final schema = await rootBundle.loadString(DB_PATH);
  await DatabaseManager.initialize(schema);
  runApp(App());
}
