import 'package:flutter/material.dart';
import 'package:journal/components/appBar.dart';
import 'package:journal/components/journal_entry_details.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal_entry.dart';

class JournalEntryDetails extends StatelessWidget {
  JournalEntryDetails(this.handleDarkModeToggle);

  static final routeName = "details";
  final void Function(bool) handleDarkModeToggle;

  @override
  Widget build(BuildContext context) {
    JournalEntry journalEntry = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: appBar(journalEntry.headerFormat),
      endDrawer: SettingsDrawer(handleToggle: handleDarkModeToggle),
      body: journalEntryDetails(journalEntry),
    );
  }
}
