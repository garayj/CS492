import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/screens/journal_entries.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/journal_entry_detail.dart';

class App extends StatefulWidget {
  static Map<String, Widget Function(BuildContext)> routes(
      handleDarkModeToggle) {
    return {
      JournalEntryDetails.routeName: (context) =>
          JournalEntryDetails(handleDarkModeToggle),
      JournalEntries.routeName: (context) =>
          JournalEntries(handleDarkModeToggle),
      NewJournalEntry.routeName: (context) =>
          NewJournalEntry(handleDarkModeToggle)
    };
  }

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
