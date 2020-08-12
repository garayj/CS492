import 'package:flutter/material.dart';
import 'package:wasteagram/models/translations.dart';

Widget appbar(ctx) => AppBar(
      title: Text(Translations(locale: Localizations.localeOf(ctx)).title),
    );
