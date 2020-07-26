import 'package:flutter/material.dart';
import 'package:journal/app.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({this.handleToggle});
  final handleToggle;

  @override
  Widget build(BuildContext context) {
    AppState appState = context.findAncestorStateOfType<AppState>();
    final handleChange = (bool input) {
      handleToggle(input);
    };

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Settings'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: appState.isDarkMode,
            onChanged: handleChange,
          ),
        ],
      ),
    );
  }
}
