import 'package:flutter/material.dart';
import 'package:journal/components/text.dart';
import 'package:journal/styles.dart';
import 'package:journal/components/settings_button.dart';

class NewEntry extends StatefulWidget {
  static final routeName = "new entry";

  static const String title = 'New Journal Entry';

  @override
  _NewEntry createState() => _NewEntry();
}

class _NewEntry extends State<NewEntry> {
  final styles = Styles();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NewEntry.title),
        actions: [settingsButton],
      ),
      body: styles.centerColumn([
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                text("Title"),
                text('Body', 5),
              ],
            )),
      ]),
    );
  }
}
