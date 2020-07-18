import 'package:call_me/components/business_card_view.dart';
import 'package:call_me/components/predictor.dart';
import 'package:call_me/components/resume.dart';
import 'package:call_me/models/tab_info.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class RouteManager extends StatelessWidget {
  // Build method that creates the routes and screens.
  @override
  Widget build(BuildContext context) {
    List _generateTabs(List<TabInfo> data) {
      return data.map((final tab) => tab.getTab).toList();
    }

    // Create the appbar
    Widget appbar(String title, List<TabInfo> tabInfo) {
      return AppBar(
          title: Center(child: Text(title)),
          bottom: TabBar(tabs: _generateTabs(tabInfo)));
    }

    // Generates the tabs.

    //Generates the screens to interact with.
    List<Widget> _generateScreens(List<TabInfo> data) {
      return data.map((final tab) => tab.screen).toList();
    }

    return FutureBuilder(
        future: rootBundle.loadString("assets/userData.json"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final data = json.decode(snapshot.data);
            String title = data["title"];
            Map<String, String> businessCard = Map.from(data["businessCard"]
                .map((key, value) =>
                    MapEntry(key.toString(), value.toString())));

            final resume = data["resume"];
            final tabInfo = [
              TabInfo(Icon(Icons.account_circle),
                  BusinessCardView(userData: businessCard)),
              TabInfo(Icon(Icons.work), Resume(userResume: resume)),
              TabInfo(Icon(Icons.casino), Predictor()),
            ];
            return DefaultTabController(
                length: tabInfo.length,
                initialIndex: 0,
                child: Scaffold(
                    appBar: appbar(title, tabInfo),
                    body: TabBarView(
                      children: _generateScreens(tabInfo),
                    )));
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
