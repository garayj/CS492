import 'package:flutter/material.dart';
import 'package:journal/components/no_journal_entries.dart';
import 'package:journal/screens/journal_entry_detail.dart';
import 'package:journal/models/journal.dart';

final journal = Journal.getInstance();

Widget journalEntries(Journal journal, {Function(int) action}) {
  if (journal.length > 0) {
    // onTap switch.
    Function onTap = (BuildContext context, int index) => () =>
        action is Function
            ? action(index)
            : Navigator.of(context).pushNamed(JournalEntryDetails.routeName,
                arguments: journal.entries[index]);
    return ListView.builder(
      itemCount: journal.entries.length,
      itemBuilder: (context, index) => ListTile(
        onTap: onTap(context, index),
        title: Text('${journal.entries[index].title}'),
        subtitle: Text('${journal.entries[index].body}'),
      ),
    );
  } else
    return noEntries;
}
