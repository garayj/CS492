import 'package:flutter/material.dart';
import 'package:journal/styles.dart';
import 'package:journal/screens/new_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal.dart';

class JournalEntries extends StatefulWidget {
  static const String routeName = "/";
  static const String title = 'Journal';

  @override
  _JournalEntries createState() => _JournalEntries();
}

class _JournalEntries extends State<JournalEntries> {
  static final styles = Styles();

  final journal = Journal.getInstance();

  Widget noEntries = styles.centerColumn([
    Icon(Icons.book, size: 100.0),
    Text('Journal'),
  ]);

  @override
  Widget build(BuildContext context) {
    final title = Text(JournalEntries.title);

    final drawer = SettingsDrawer();

    Widget journalEntries = ListView.builder(
      itemCount: journal.entries.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => print('tapped'),
        title: Text('${journal.entries[index].title}'),
        subtitle: Text('${journal.entries[index].body}'),
      ),
    );

    Widget journalPreview =
        journal.entries.length == 0 ? noEntries : journalEntries;

    void setNewEntry(entry) {
      setState(() => journal.addJournalEntry(entry));
    }

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      endDrawer: drawer,
      body: journalPreview,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NewEntry.routeName, arguments: setNewEntry);
        },
        tooltip: 'Add new journal entry',
        child: Icon(Icons.add),
      ),
    );
  }
}
