import 'package:flutter/material.dart';
import 'package:journal/components/journal_entry_details.dart';
import 'package:journal/components/settings_button.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/components/journal_entries.dart';
import 'package:journal/components/no_journal_entries.dart';

class MainScreen extends StatefulWidget {
  final void Function(bool) handleDarkModeToggle;
  static const String routeName = "/";
  static const String title = 'Journal';
  MainScreen(this.handleDarkModeToggle);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final journal = Journal.getInstance();

  @override
  Widget build(BuildContext context) {
    // State handler
    void setNewEntry(entry) {
      setState(() => journal.addJournalEntry(entry));
    }

    // Widgets
    Widget title = Text(MainScreen.title);
    Widget endDrawer =
        SettingsDrawer(handleToggle: widget.handleDarkModeToggle);

    Widget fab = FloatingActionButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed(NewJournalEntry.routeName, arguments: setNewEntry);
      },
      tooltip: 'Add new journal entry',
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        actions: settingsButton,
        title: title,
      ),
      endDrawer: endDrawer,
      body: Container(child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600)
            return HorizontalLayout();
          else
            return journalEntries(journal);
        },
      )),
      floatingActionButton: fab,
    );
  }
}

class HorizontalLayout extends StatefulWidget {
  @override
  _HorizontalLayoutState createState() => _HorizontalLayoutState();
}

class _HorizontalLayoutState extends State<HorizontalLayout> {
  final journal = Journal.getInstance();
  int index = 0;

  void setJournalEntry(idx) {
    setState(() => index = idx);
  }

  @override
  Widget build(BuildContext context) {
    return journal.length == 0
        ? journalEntries(journal)
        : Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: journalEntries(journal, action: setJournalEntry),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: journalEntryDetails(journal.entries[index]),
                  ),
                )
              ],
            ),
          );
  }
}
