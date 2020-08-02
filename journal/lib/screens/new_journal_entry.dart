import 'package:flutter/material.dart';
import 'package:journal/components/appBar.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/components/form.dart';

class NewJournalEntry extends StatelessWidget {
  NewJournalEntry(this.handleDarkModeToggle);

  static final routeName = "new entry";
  static const String title = 'New Journal Entry';
  final void Function(bool) handleDarkModeToggle;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget endDrawer = SettingsDrawer(handleToggle: handleDarkModeToggle);
    Widget body = form(_formKey, JournalEntry());

    return Scaffold(
      appBar: appBar(NewJournalEntry.title),
      endDrawer: endDrawer,
      body: body,
    );
  }
}
