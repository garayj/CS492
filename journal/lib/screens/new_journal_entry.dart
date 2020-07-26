import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/styles.dart';
import 'package:journal/components/form.dart';
import 'package:journal/components/settings_button.dart';

class NewJournalEntry extends StatelessWidget {
  NewJournalEntry(this.handleDarkModeToggle);
  static final routeName = "new entry";

  static const String title = 'New Journal Entry';

  final void Function(bool) handleDarkModeToggle;
  final styles = Styles();
  // final journal = Journal.getInstance();
  final journalEntry = JournalEntry();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Function addEntry = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(NewJournalEntry.title),
        actions: settingsButton,
      ),
      endDrawer: SettingsDrawer(handleToggle: handleDarkModeToggle),
      body: form(_formKey, journalEntry, addEntry),
    );
  }
}
