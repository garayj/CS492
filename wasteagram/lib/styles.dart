import 'package:flutter/material.dart';

class Styles {
  Widget text(String text, {double size}) =>
      Text(text, style: TextStyle(fontSize: size));
  Widget pad(Widget child, double size) => Padding(
        padding: EdgeInsets.all(size),
        child: child,
      );
  Widget padTop(Widget child, double size) => Padding(
        padding: EdgeInsets.only(top: size),
        child: child,
      );
  Widget imageContainer(BuildContext ctx, Widget child) => pad(
      Container(
        width: MediaQuery.of(ctx).size.width,
        height: MediaQuery.of(ctx).size.height / 2,
        child: child,
      ),
      15);
  Widget newPostContainer(List<Widget> children) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
