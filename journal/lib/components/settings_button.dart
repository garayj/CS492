import 'package:flutter/material.dart';

final settingsButton = <Widget>[
  // https://stackoverflow.com/questions/51957960/how-to-change-the-enddrawer-icon-in-flutter
  Builder(
    builder: (context) => IconButton(
      icon: Icon(Icons.settings),
      onPressed: () => Scaffold.of(context).openEndDrawer(),
    ),
  )
];
