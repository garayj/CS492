import 'package:flutter/material.dart';
import 'package:journal/components/settings_button.dart';
import 'package:journal/styles.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/journal_entry_detail.dart';

class JournalEntries extends StatefulWidget {
  final void Function(bool) handleDarkModeToggle;
  static const String routeName = "/";
  static const String title = 'Journal';
  JournalEntries(this.handleDarkModeToggle);

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

    final drawer = SettingsDrawer(handleToggle: widget.handleDarkModeToggle);

    Widget journalEntries = ListView.builder(
      itemCount: journal.entries.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.of(context).pushNamed(
            JournalEntryDetails.routeName,
            arguments: journal.entries[index]),
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
        actions: settingsButton,
        title: title,
      ),
      endDrawer: drawer,
      body: journalPreview,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NewJournalEntry.routeName, arguments: setNewEntry);
        },
        tooltip: 'Add new journal entry',
        child: Icon(Icons.add),
      ),
    );
  }
}
