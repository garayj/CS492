import 'package:flutter/material.dart';
import 'package:call_me/styles.dart';
import 'package:call_me/models/business_card.dart';

class BusinessCardView extends StatelessWidget {
  final Map<String, String> userData;
  BusinessCardView({Key key, this.userData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final businessCard = BusinessCard(userData, Styles(context: context));
    if (MediaQuery.of(context).size.height < 600.0)
      return businessCard.paddedBusinessCard(20.0, 10.0);

    return FractionallySizedBox(
        heightFactor: 0.85,
        widthFactor: 0.9,
        child: businessCard.paddedBusinessCard(30.0, 10.0),
        alignment: Alignment.center);
  }
}
