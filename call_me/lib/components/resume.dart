import 'package:flutter/material.dart';
import 'package:call_me/styles.dart';

class Resume extends StatelessWidget {
  Resume({Key key, this.userResume}) : super(key: key);
  final Map<String, dynamic> userResume;

  @override
  Widget build(BuildContext context) {
    final styles = Styles(context: context);
    Widget header() {
      final name = userResume["header"]["name"];
      final email = userResume["header"]["email"];
      final github = userResume["header"]["github"];
      return styles.symPad(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: styles.headline6),
            Text(email),
            Text(github),
          ]),
          v: 20.0,
          h: 10.0);
    }

    List<Widget> body() {
      return userResume['job history']
          .map<Widget>(
            (final job) => styles.symPad(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(job['title'], style: styles.bodyText1),
                      Text('${job['start']} - ${job['end']}',
                          style: styles.bodyText1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(job['company']),
                      Text('${job['city']}, ${job['state']}')
                    ],
                  ),
                  Text(job['description'])
                ]),
                v: 10.0,
                h: 10.0),
          )
          .toList();
    }

    return SingleChildScrollView(
        child: Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [header(), ...body()]),
    ));
  }
}
