import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/screens/journal_entries.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/journal_entry_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  // Route handler.
  static Map<String, Widget Function(BuildContext)> routes(
      handleDarkModeToggle) {
    return {
      // Main Entries route.
      JournalEntries.routeName: (context) =>
          JournalEntries(handleDarkModeToggle),

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
  final journal = Journal.getInstance();
  bool isDarkMode;

// Init State.
  @override
  void initState() {
    super.initState();
    initTheme();
  }

  // Async function to set the theme.
  void initTheme() async {
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

    // Widget to return.
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
}
