import 'package:flutter/material.dart';
import 'package:journal/components/appBar.dart';
import 'package:journal/components/fab.dart';
import 'package:journal/components/long_layout.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/components/journal_entries.dart';

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
    void setNewEntry(entry) => setState(() => journal.addJournalEntry(entry));

    return Scaffold(
      appBar: appBar(MainScreen.title),
      endDrawer: SettingsDrawer(handleToggle: widget.handleDarkModeToggle),
      body: Container(
          child: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth >= 600
            ? HorizontalLayout()
            : journalEntries(journal),
      )),
      floatingActionButton: fab(setNewEntry),
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
  void setJournalEntry(idx) => setState(() => index = idx);

  @override
  Widget build(BuildContext context) => journal.length == 0
      ? journalEntries(journal)
      : longLayout(index, setJournalEntry);
}
