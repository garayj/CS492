import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetails extends StatelessWidget {
  static const routeName = "details";
  const PostDetails({Key key}) : super(key: key);
  static const title = "Wasteagram";
  final number = 1;
  final lat = 10.0;
  final long = -3.2;

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 10),
              child:
                  Text(post.date.toString(), style: TextStyle(fontSize: 30))),
          Padding(
            padding: EdgeInsets.all(20),
            child: Placeholder(
              fallbackHeight: 250,
            ),
          ),
          Text(
            'Items: ${post.quantity}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            "(${post.lat}, ${post.long})",
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
