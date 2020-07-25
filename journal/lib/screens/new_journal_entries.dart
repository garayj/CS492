import 'package:flutter/material.dart';
import 'package:journal/styles.dart';
import 'package:journal/screens/new_entry.dart';
import 'package:journal/components/settings_button.dart';

class NewJournalEntries extends StatefulWidget {
  static const String routeName = "/";
  static const String title = 'Journal';

  @override
  _NewJournalEntries createState() => _NewJournalEntries();
}

class _NewJournalEntries extends State<NewJournalEntries> {
  final styles = Styles();
  final noEntries = [
    Icon(Icons.book, size: 100.0),
    Text('Journal'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NewJournalEntries.title),
        actions: [settingsButton],
      ),
      body: styles.centerColumn(noEntries),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NewEntry.routeName);
        },
        tooltip: 'Add new journal entry',
        child: Icon(Icons.add),
      ),
    );
  }
}
