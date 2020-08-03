import 'package:intl/intl.dart';

class JournalEntry {
  // For new journal entries.
  JournalEntry();

  // For incoming journal entries.
  JournalEntry.init(
      this._id, this._title, this._body, this._rating, this._date);

  // Member variables.
  int _id;
  String _title;
  String _body;
  int _rating;
  DateTime _date;

  // Getters
  int get id => _id;
  String get title => _title;
  String get body => _body;
  int get rating => _rating;
  DateTime get date => _date;
  String get listViewFormat => DateFormat.yMMMMEEEEd('en_US').format(_date);
  String get headerFormat => DateFormat.yMMMMEEEEd('en_US').format(_date);

  // Setters.
  set setID(int id) => _id = id;
  set setTitle(title) => _title = title;
  set setBody(body) => _body = body;
  set setRating(rating) => _rating = rating;
  set setDate(date) => _date = date;
}
