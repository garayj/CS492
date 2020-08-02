import 'package:flutter/material.dart';
import 'package:journal/components/settings_button.dart';

Widget appBar(title) => AppBar(
      actions: settingsButton,
      title: Text(title),
    );
