import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/components/form.dart';
import 'package:journal/components/settings_button.dart';

class NewJournalEntry extends StatelessWidget {
  NewJournalEntry(this.handleDarkModeToggle);

  static final routeName = "new entry";
  static const String title = 'New Journal Entry';
  final void Function(bool) handleDarkModeToggle;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Function addEntry = ModalRoute.of(context).settings.arguments;

    Widget appBar = AppBar(
      title: Text(NewJournalEntry.title),
      actions: settingsButton,
    );

    Widget endDrawer = SettingsDrawer(handleToggle: handleDarkModeToggle);
    Widget body = form(_formKey, JournalEntry());

    return Scaffold(
      appBar: appBar,
      endDrawer: endDrawer,
      body: body,
    );
  }
}
