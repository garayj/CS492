import 'package:call_me/components/business_card_view.dart';
import 'package:call_me/components/predictor.dart';
import 'package:call_me/components/resume.dart';
import 'package:call_me/models/tab_info.dart';
import 'package:call_me/models/predict.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class RouteManager extends StatelessWidget {
  // Build method that creates the routes and screens.
  @override
  Widget build(BuildContext context) {
    // Generates the tabs.
    List _generateTabs(List<TabInfo> data) {
      return data.map((final tab) => tab.getTab).toList();
    }

    List<TabInfo> _generateTabList(
        Map businessCard, Map resume, Predict predictor, Map data) {
      return [
        TabInfo(Icon(Icons.account_circle),
            BusinessCardView(userData: businessCard)),
        TabInfo(Icon(Icons.work), Resume(userResume: resume)),
        TabInfo(
            Icon(Icons.casino),
            Predictor(
              predictorProps: data["predictor"],
              predictor: predictor,
            ))
      ];
    }

    // Create the appbar
    Widget appbar(String title, List<TabInfo> tabInfo) {
      return AppBar(
          title: Center(child: Text(title)),
          bottom: TabBar(tabs: _generateTabs(tabInfo)));
    }

    Map<String, String> _formatBusinessCardData(Map<String, dynamic> data) {
      return Map.from(data["businessCard"]
          .map((key, value) => MapEntry(key.toString(), value.toString())));
    }

    //Generates the screens to interact with.
    List<Widget> _generateScreens(List<TabInfo> data) {
      return data.map((final tab) => tab.screen).toList();
    }

    Widget _formatDataAndDisplay(Map<String, dynamic> data) {
      String title = data["title"];
      final businessCard = _formatBusinessCardData(data);
      final resume = data["resume"];
      final predictor =
          Predict(List<String>.from(data["predictor"]["options"]));
      final tabInfo = _generateTabList(businessCard, resume, predictor, data);

      return DefaultTabController(
          length: tabInfo.length,
          initialIndex: 0,
          child: Scaffold(
              appBar: appbar(title, tabInfo),
              body: TabBarView(
                children: _generateScreens(tabInfo),
              )));
    }

    return FutureBuilder(
        future: rootBundle.loadString("assets/userData.json"),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return _formatDataAndDisplay(json.decode(snapshot.data));
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
