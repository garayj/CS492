import 'package:flutter/material.dart';

class TabInfo {
  final Icon icon;
  final Widget screen;
  TabInfo(this.icon, this.screen);
  Tab get getTab => Tab(
        icon: icon,
      );
}
