import 'package:flutter/material.dart';

class Styles {
  Styles({this.context});
  final BuildContext context;

  Widget symPad(Widget child, {double v = 12.0, double h = 0.0}) {
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return Padding(
          child: child,
          padding: EdgeInsets.symmetric(vertical: v, horizontal: h));
    return Padding(
        child: child,
        padding: EdgeInsets.symmetric(vertical: v, horizontal: h));
  }

  Widget businessCardContainer(Widget child) {
    return Container(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 20.0,
              maxHeight: 100.0,
              maxWidth: avatarRadius() * 2,
            ),
            child: symPad(child, v: fillHeight() * 0.01)));
  }

  double fillHeight() {
    return MediaQuery.of(context).size.height;
  }

  double avatarRadius() {
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return MediaQuery.of(context).size.height * 0.12;
    else
      return MediaQuery.of(context).size.width * 0.2;
  }

  TextStyle get caption => Theme.of(context).textTheme.caption;
  TextStyle get bodyText1 => Theme.of(context).textTheme.bodyText1;
  TextStyle get bodyText2 => Theme.of(context).textTheme.bodyText2;
  TextStyle get headline5 => Theme.of(context).textTheme.headline5;
  TextStyle get headline6 => Theme.of(context).textTheme.headline6;
}
