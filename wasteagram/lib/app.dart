import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post.dart';
import 'package:wasteagram/screens/post_details.dart';
import 'package:wasteagram/screens/post_list.dart';

class App extends StatelessWidget {
  final routes = {
    "/": (context) => PostList(),
    "newPost": (context) => NewPost(),
    "details": (context) => PostDetails(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
