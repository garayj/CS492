import 'package:flutter/material.dart';
import 'package:journal/app.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = context.findAncestorStateOfType<AppState>();
    final handleChange = (bool input) {
      appState.handleDarkModeToggle(input);
    };

    List<Widget> children = [
      DrawerHeader(
        child: Text('Settings'),
        decoration: BoxDecoration(color: Colors.blue),
      ),
      SwitchListTile(
        title: Text('Dark Mode'),
        value: appState.isDarkMode,
        onChanged: handleChange,
      ),
    ];

    return Drawer(
      child: ListView(
        children: children,
      ),
    );
  }
}
