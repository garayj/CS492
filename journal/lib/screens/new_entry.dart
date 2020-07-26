import 'package:flutter/material.dart';
import 'package:journal/components/text.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/components/settings_drawer.dart';
import 'package:journal/styles.dart';

class NewEntry extends StatelessWidget {
  static final routeName = "new entry";

  static const String title = 'New Journal Entry';

  final styles = Styles();
  final journal = Journal.getInstance();
  final journalEntry = JournalEntry();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Function addEntry = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(NewEntry.title),
      ),
      endDrawer: SettingsDrawer(),
      body: styles.centerColumn([
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              text(
                label: "Title",
                onSave: (value) => journalEntry.setTitle = value,
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
              ),
              text(
                label: 'Body',
                onSave: (value) => journalEntry.setBody = value,
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                lines: 5,
              ),
              text(
                  numberField: true,
                  label: 'Rating',
                  onSave: (value) => journalEntry.setRating = int.parse(value),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "cannont be empty";
                    } else if (int.parse(value) > 5 || int.parse(value) < 1) {
                      return 'Rating must be between 1 and 5';
                    }
                    return null;
                  }),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        journalEntry.setDate = new DateTime.now();
                        addEntry(journalEntry);
                        Navigator.of(context).pop();
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
