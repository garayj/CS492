import 'package:flutter/material.dart';

class Styles {
  final centerColumn = (List<Widget> child) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: child,
        ),
      );
}
