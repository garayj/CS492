import 'package:flutter/material.dart';
import 'package:journal/screens/new_entry.dart';
import 'package:journal/screens/journal_entries.dart';
import 'package:journal/models/journal.dart';

class App extends StatelessWidget {
  final journal = Journal.getInstance();
  static final routes = {
    JournalEntries.routeName: (context) => JournalEntries(),
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
