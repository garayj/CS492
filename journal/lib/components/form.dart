import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/styles.dart';
import 'package:journal/components/text.dart';

final styles = Styles();

Widget raisedButton(_formKey, journalEntry, context) {
  Function addEntry = ModalRoute.of(context).settings.arguments;
  return RaisedButton(
    onPressed: () {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        journalEntry.setDate = new DateTime.now();
        addEntry(journalEntry);
        Navigator.of(context).pop();
      }
    },
    child: Text('Submit'),
  );
}

Widget Function(GlobalKey<FormState>, JournalEntry) form = (formKey,
        journalEntry) =>
    SingleChildScrollView(
      child: styles.centerColumn([
        Form(
          key: formKey,
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
                builder: (context) =>
                    raisedButton(formKey, journalEntry, context),
              ),
            ],
          ),
        ),
      ]),
    );
