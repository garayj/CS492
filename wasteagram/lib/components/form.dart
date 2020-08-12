import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasteagram/models/translations.dart';

Widget form(GlobalKey formKey, Locale locale, Function onSaved) => Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Semantics(
          textField: true,
          hint: Translations(locale: locale).textFormFieldHint,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: Translations(locale: locale).labelText,
            ),
            textAlign: TextAlign.center,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            onSaved: onSaved,
            validator: (value) => value.isEmpty
                ? Translations(locale: locale).formValidatorHint
                : null,
          ),
        ),
      ),
    );
