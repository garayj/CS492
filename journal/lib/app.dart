import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/screens/main_screen.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/journal_entry_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:journal/models/journal_entry.dart';

class App extends StatefulWidget {
  App({this.schema});
  final String schema;
  // Route handler.
  static Map<String, Widget Function(BuildContext)> routes(
      handleDarkModeToggle) {
    return {
      // Main Entries route.
      MainScreen.routeName: (context) => MainScreen(handleDarkModeToggle),

      // Details route
      JournalEntryDetails.routeName: (context) =>
          JournalEntryDetails(handleDarkModeToggle),

      // New journal entry route.
      NewJournalEntry.routeName: (context) =>
          NewJournalEntry(handleDarkModeToggle)
    };
  }

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // State variables
  Journal journal;
  String schema;
  bool isDarkMode;
  bool isLoading;

// Init State.
  @override
  void initState() {
    super.initState();
    isLoading = true;
    initTheme();
    initJournal();
  }

  void initJournal() async {
    journal = Journal.getInstance();
    final Database db = await openDatabase(
      'journal.sqlite3.db',
      version: 1,
      onCreate: (db, version) async => await db.execute(widget.schema),
    );
    List<Map> journalRecords =
        await db.rawQuery('SELECT * FROM journal_entries;');

    final journalEntries = journalRecords.map((record) {
      return JournalEntry.init(
        record['id'],
        record['title'],
        record['body'],
        record['rating'],
        DateTime.parse(record['date']),
      );
    }).toList();
    journal.setJournal = journalEntries;
  }

  // Async function to set the theme.
  void initTheme() async {
    schema = widget.schema;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => isDarkMode = prefs.getBool('darkMode') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    // Dark mode handler.
    void Function(bool) handleDarkModeToggle = (bool input) async {
      setState(() => isDarkMode = input);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('darkMode', input);
    };

    // Get the appropriate theme.
    final getTheme = () =>
        isDarkMode != null && isDarkMode ? ThemeMode.dark : ThemeMode.system;

    // Widget to return. Use future builder to await the data from shared prefs.
    return FutureBuilder(
      future: Future.wait(
          [SharedPreferences.getInstance(), openDatabase('journal.sqlite.db')]),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData.dark(),
            routes: App.routes(handleDarkModeToggle),
            themeMode: getTheme(),
          );
        }
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
