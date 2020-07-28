import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';

Widget journalEntryDetails(JournalEntry journalEntry) {
  return Padding(
    padding: EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(journalEntry.title, style: TextStyle(fontSize: 30.0)),
        Text(journalEntry.body),
      ],
    ),
  );
}
