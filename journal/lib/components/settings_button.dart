import 'package:flutter/material.dart';

Widget settingsButton = GestureDetector(
  onTap: () => print('Clicked on settings'),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Icon(Icons.settings),
  ),
);
