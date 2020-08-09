import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/post_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostList extends StatefulWidget {
  static const routeName = "/";
  static const title = "Wasteagram";
  const PostList({Key key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = [];
  @override
  void initState() {
    super.initState();
    posts = [];
    // posts = firestoreStuff ?? [];
  }

  void addPost(Post post) {
    setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onTap(post) {
      Navigator.of(context).pushNamed("details", arguments: post);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(PostList.title),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.data.documents;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => _onTap(PostDAO().convertToPost(posts[index])),
                title: Text("${posts[index]['date']}"),
                trailing: Text("${posts[index]['quantity']}"),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: posts.length == 0
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: posts.length,
      //         itemBuilder: (context, index) => ListTile(
      //           onTap: () => _onTap(posts[index]),
      //           title: Text("${posts[index].date}"),
      //           trailing: Text("${posts[index].quantity}"),
      //         ),
      //       ),
      bottomNavigationBar: FlatButton(
        color: Colors.amber,
        onPressed: () =>
            Navigator.pushNamed(context, "newPost", arguments: addPost),
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}
