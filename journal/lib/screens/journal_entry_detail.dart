import 'package:flutter/material.dart';
import 'package:journal/components/journal_entry_details.dart';
import 'package:journal/components/settings_button.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:intl/intl.dart';

class JournalEntryDetails extends StatelessWidget {
  JournalEntryDetails(this.handleDarkModeToggle);

  static final routeName = "details";
  final void Function(bool) handleDarkModeToggle;

  @override
  Widget build(BuildContext context) {
    JournalEntry journalEntry = ModalRoute.of(context).settings.arguments;
    String formattedDate = DateFormat.yMMMMd('en_US').format(journalEntry.date);

    Widget appBar = AppBar(
      actions: settingsButton,
      title: Text(formattedDate),
    );
    Widget body = journalEntryDetails(journalEntry);

    Widget endDrawer = SettingsDrawer(handleToggle: handleDarkModeToggle);

    return Scaffold(
      appBar: appBar,
      endDrawer: endDrawer,
      body: body,
    );
  }
}
