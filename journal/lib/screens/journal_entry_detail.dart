import 'package:flutter/material.dart';
import 'package:journal/components/settings_button.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/styles.dart';
import 'package:intl/intl.dart';

class JournalEntryDetails extends StatelessWidget {
  JournalEntryDetails(this.handleDarkModeToggle);
  static final routeName = "details";

  static const String title = 'Journal Entry details';

  final void Function(bool) handleDarkModeToggle;
  final styles = Styles();

  @override
  Widget build(BuildContext context) {
    JournalEntry journalEntry = ModalRoute.of(context).settings.arguments;
    String formattedDate = DateFormat.yMMMMd('en_US').format(journalEntry.date);

    return Scaffold(
      appBar: AppBar(
        actions: settingsButton,
        title: Text(formattedDate),
      ),
      endDrawer: SettingsDrawer(handleToggle: handleDarkModeToggle),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(journalEntry.title, style: TextStyle(fontSize: 30.0)),
            Text(journalEntry.body),
          ],
        ),
      ),
    );
  }
}
