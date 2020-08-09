import 'package:flutter/material.dart';
import '../models/post.dart';

class NewPost extends StatelessWidget {
  static const routeName = "newPost";
  const NewPost({Key key}) : super(key: key);
  final title = "Wasteagram";

  @override
  Widget build(BuildContext context) {
    Function addPost = ModalRoute.of(context).settings.arguments;
    void _onPressed() {
      addPost(
        new Post(
          date: DateTime.now(),
          url: "imageURL",
          quantity: 2,
          lat: 1.0,
          long: -90.0,
        ),
      );
      Navigator.pop(context);
    }

    ;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'new post',
            ),
          ],
        ),
      ),
      bottomNavigationBar: FlatButton(
        color: Colors.blue,
        onPressed: _onPressed,
        child: Text("Submit"),
      ),
    );
  }
}
