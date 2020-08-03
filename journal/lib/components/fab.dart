import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';

Widget fab(Function setNewEntry) => Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(NewJournalEntry.routeName, arguments: setNewEntry),
        tooltip: 'Add new journal entry',
        child: Icon(Icons.add),
      ),
    );
