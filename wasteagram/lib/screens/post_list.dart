import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/components/appbar.dart';
import 'package:wasteagram/models/firebase.dart';
import 'package:wasteagram/models/translations.dart';
import 'package:wasteagram/screens/new_post.dart';
import '../models/post.dart';
import '../models/post_dao.dart';
import 'package:image_picker/image_picker.dart';

class PostList extends StatefulWidget {
  static const routeName = "/";
  const PostList({Key key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  File image;

  Future<void> _getImage() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img == null) return;
    image = File(img.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    void _onTap(post) =>
        Navigator.of(context).pushNamed("details", arguments: post);

    void _onPressed() async {
      await _getImage();
      if (image != null)
        Navigator.pushNamed(context, NewPost.routeName, arguments: image);
    }

    Widget _builder(content, snapshot) {
      if (snapshot.hasData && snapshot.data.documents.length > 0) {
        List<Post> posts = PostDAO().convertToPosts(snapshot.data.documents);
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => Semantics(
            onTapHint: Translations(locale: locale).listOnTapHint(
                PostDAO().longDate(posts[index].date), posts[index].quantity),
            child: ListTile(
              onTap: () => _onTap(posts[index]),
              title: Text("${PostDAO().longDate(posts[index].date)}"),
              trailing: Text("${posts[index].quantity}"),
            ),
          ),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }

    return Scaffold(
      appBar: appbar(context),
      body: StreamBuilder(
        stream: FireBase().streamPosts,
        builder: _builder,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Semantics(
        onTapHint: Translations(locale: locale).fabHintText,
        enabled: true,
        button: true,
        child: FloatingActionButton(
          onPressed: _onPressed,
          child: Icon(Icons.photo_camera),
        ),
      ),
    );
  }
}
