import 'package:flutter/material.dart';

class JournalEntry {
  JournalEntry(this._id, this._title, this._body, this._rating, this._date);
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
}
