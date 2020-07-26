import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final text =
    ({label, validator, onSave, lines = 1, numberField = false}) => Padding(
          padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
          child: TextFormField(
            keyboardType: numberField ? TextInputType.number : null,
            inputFormatters:
                numberField ? [WhitelistingTextInputFormatter.digitsOnly] : [],
            onSaved: onSave,
            validator: validator,
            minLines: lines,
            maxLines: lines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: label,
            ),
          ),
        );
