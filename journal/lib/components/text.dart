import 'package:flutter/material.dart';

Padding Function(String, [int]) text = (label, [lines]) => Padding(
      padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: TextFormField(
        minLines: lines ?? 1,
        maxLines: lines ?? 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
