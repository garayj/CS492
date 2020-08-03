import 'package:flutter/material.dart';
import 'package:journal/models/databaseManager.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/screens/main_screen.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/journal_entry_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:journal/models/journal_entry.dart';

class App extends StatefulWidget {
  // Route handler.
  static Map routes = {
    MainScreen.routeName: (context) => MainScreen(),
    JournalEntryDetails.routeName: (context) => JournalEntryDetails(),
    NewJournalEntry.routeName: (context) => NewJournalEntry(),
  };

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
    DatabaseManager dbManager = DatabaseManager.getInstance();
    List<JournalEntry> journalRecords = await dbManager.getAllJournalEntries();
    setState(() => journal.setJournal = journalRecords);
  }

  // Async function to set the theme.
  void initTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => isDarkMode = prefs.getBool('darkMode') ?? false);
  }

  void handleDarkModeToggle(bool input) async {
    setState(() => isDarkMode = input);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', input);
  }

  @override
  Widget build(BuildContext context) {
    // Dark mode handler.

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
            routes: App.routes,
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
