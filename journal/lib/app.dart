import 'package:flutter/material.dart';
import 'package:journal/screens/new_entry.dart';
import 'package:journal/screens/new_journal_entries.dart';

class App extends StatelessWidget {
  static final routes = {
    NewJournalEntries.routeName: (context) => NewJournalEntries(),
    NewEntry.routeName: (context) => NewEntry()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes

        // home: NewJournalEntries(title: 'Flutter Demo Home Page'),
        );
  }
}
