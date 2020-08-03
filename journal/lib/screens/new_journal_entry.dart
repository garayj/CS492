import 'package:flutter/material.dart';
import 'package:journal/components/appBar.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/components/form.dart';

class NewJournalEntry extends StatelessWidget {
  static final routeName = "new entry";
  static const String title = 'New Journal Entry';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(NewJournalEntry.title),
        endDrawer: SettingsDrawer(),
        body: form(
          _formKey,
          JournalEntry(),
        ),
      );
}
