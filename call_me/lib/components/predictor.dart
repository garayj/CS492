import 'package:call_me/models/predict.dart';
import 'package:flutter/material.dart';
import 'package:call_me/styles.dart';

class Predictor extends StatefulWidget {
  @override
  State createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  // Constants
  static const String title = "Call me... Maybe?";
  static const String instructions = "Ask a question... tap for an answer.";
  final predict = Predict();

  // Main content of the Predictor screen.
  List<Widget> _generatePredictorContent(BuildContext context) {
    final styles = Styles(context: context);
    return [
      styles.symPad(Text(title, style: styles.headline5)),
      GestureDetector(
          onTap: () => setState(() => predict.newPrediction()),
          child: styles.symPad(Text(instructions, style: styles.bodyText2))),
      styles.symPad(
        Text('${predict.prediction}', style: styles.headline5),
      )
    ];
  }

  // Build
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 1.0,
        widthFactor: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _generatePredictorContent(context),
        ));
  }
}
