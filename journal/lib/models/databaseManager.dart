import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/models/journal_dao.dart';

class DatabaseManager {
  // Constants
  static const String DB_NAME = 'journal.sqlite3.db';
  static const String INSERT_JOURNAL_ENTRY =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);';
  static const String SELECT_ALL_JOURNAL_ENTRIES =
      'SELECT * FROM journal_entries;';

  // Member variables
  static DatabaseManager _instance;
  final Database db;

  // Constructor
  DatabaseManager._({Database database}) : db = database;

  // Private functions
  static void _createTables(Database db, String sql) async =>
      await db.execute(sql);

  static Future initialize(String schema) async {
    final Database db = await openDatabase(
      DB_NAME,
      version: 1,
      onCreate: (db, version) async => _createTables(db, schema),
    );
    _instance = DatabaseManager._(database: db);
  }

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  void saveJournalEntryToDatabase(JournalEntry journalEntry) async {
    await db.transaction(
      (txn) async => await txn.rawInsert(
        INSERT_JOURNAL_ENTRY,
        JournalDAO().convertToDatabase(journalEntry),
      ),
    );
  }

  Future<List<JournalEntry>> getAllJournalEntries() async {
    final journalRecords = await db.rawQuery(SELECT_ALL_JOURNAL_ENTRIES);
    return JournalDAO().convertToJournal(journalRecords);
  }
}
