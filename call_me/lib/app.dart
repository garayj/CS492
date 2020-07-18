import 'package:flutter/material.dart';
import 'package:call_me/components/route_manager.dart';

class App extends StatelessWidget {
  // App({Key key, this.userData, this.userResume}) : super(key: key);
  // final Map<String, String> userData;
  // final Map<String, dynamic>
  //     userResume; // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Call Me Maybe',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.grey.shade200,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: RouteManager(userData: userData, userResume: userResume));
        home: RouteManager());
  }
}
