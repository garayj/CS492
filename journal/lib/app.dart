import 'package:flutter/material.dart';
import 'package:journal/screens/new_entry.dart';
import 'package:journal/screens/journal_entries.dart';
import 'package:journal/models/journal.dart';

class App extends StatefulWidget {
  static Map<String, Widget Function(BuildContext)> routes(
      handleDarkModeToggle) {
    return {
      JournalEntries.routeName: (context) =>
          JournalEntries(handleDarkModeToggle),
      NewEntry.routeName: (context) => NewEntry(handleDarkModeToggle)
    };
  }

  // static Map<String, Widget> routes = (Function handleDarkModeToggle) => ({});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final journal = Journal.getInstance();

  bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = false;
  }

  @override
  Widget build(BuildContext context) {
    void Function(bool) handleDarkModeToggle =
        (bool input) => setState(() => isDarkMode = input);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      routes: App.routes(handleDarkModeToggle),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.system,

      // home: NewJournalEntries(title: 'Flutter Demo Home Page'),
    );
  }
}
