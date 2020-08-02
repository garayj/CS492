import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/app.dart';

const String DB_PATH = "db/schema_1.sql.txt";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final schema = await rootBundle.loadString(DB_PATH);
  runApp(App(schema: schema));
}
