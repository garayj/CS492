import 'package:journal/models/journal_entry.dart';

class Journal {
  static Journal _instance;
  List<JournalEntry> _entries = [];
  Journal._();

  factory Journal.getInstance() {
    if (_instance == null) {
      _instance = Journal._();
    }
    return _instance;
  }

  void addJournalEntry(entry) {
    _entries.add(entry);
  }

  List<JournalEntry> get entries => _entries;
  int get length => _entries.length;
}
