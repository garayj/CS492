import 'package:journal/models/journal_entry.dart';

class JournalDAO {
  List<JournalEntry> convertToJournal(List journalRecords) {
    return journalRecords.map((record) {
      return JournalEntry.init(
        record['id'],
        record['title'],
        record['body'],
        record['rating'],
        DateTime.parse(record['date']),
      );
    }).toList();
  }

  List convertToDatabase(JournalEntry journalEntry) => [
        journalEntry.title,
        journalEntry.body,
        journalEntry.rating,
        journalEntry.date.toString()
      ];
}
