import 'package:flutter/material.dart';
import 'package:call_me/components/route_manager.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Call Me Maybe',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.grey.shade200,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RouteManager());
  }
}
