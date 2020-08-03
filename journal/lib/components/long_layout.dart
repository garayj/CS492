import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:journal/components/journal_entries.dart';
import 'package:journal/components/journal_entry_details.dart';

Widget longLayout(int index, Function setJournalEntry) => Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: journalEntries(journal, action: setJournalEntry),
            ),
          ),
          Expanded(
            child: Container(
              child: journalEntryDetails(journal.entries[index]),
            ),
          )
        ],
      ),
    );
