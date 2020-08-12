import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post.dart';
import 'package:wasteagram/screens/post_details.dart';
import 'package:wasteagram/screens/post_list.dart';

class App extends StatelessWidget {
  final routes = {
    PostList.routeName: (context) => PostList(),
    NewPost.routeName: (context) => NewPost(),
    PostDetails.routeName: (context) => PostDetails(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wasteagram",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}
