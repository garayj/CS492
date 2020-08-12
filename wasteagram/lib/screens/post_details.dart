import 'package:flutter/material.dart';
import 'package:wasteagram/components/appbar.dart';
import 'package:wasteagram/models/post_dao.dart';
import 'package:wasteagram/styles.dart';
import '../models/post.dart';

class PostDetails extends StatelessWidget {
  static const routeName = "details";
  const PostDetails({Key key}) : super(key: key);
  static final styles = Styles();

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            styles.padTop(
                styles.text(PostDAO().shortDate(post.date), size: 30), 10),
            styles.pad(
                Image.network(
                  post.url,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      child: FittedBox(),
                    );
                  },
                ),
                20),
            styles.text('Items: ${post.quantity}', size: 25),
            styles.text("(${post.lat}, ${post.long})", size: 25)
          ],
        ),
      ),
    );
  }
}
