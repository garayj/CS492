import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({Key key}) : super(key: key);

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  // State
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    // On Change handler.
    final handleChange = (bool input) {
      setState(() => _value = _value = input);
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
            value: _value,
            onChanged: handleChange,
          ),
        ],
      ),
    );
  }
}
