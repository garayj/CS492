import 'package:flutter/material.dart';
import 'package:call_me/models/predict.dart';
import 'package:call_me/styles.dart';

class Predictor extends StatefulWidget {
  const Predictor({Key key, this.predictorProps, this.predictor})
      : super(key: key);
  final Map<String, dynamic> predictorProps;
  final Predict predictor;
  @override
  State createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  // Main content of the Predictor screen.
  List<Widget> _generatePredictorContent(BuildContext context) {
    final styles = Styles(context: context);
    return [
      styles.symPad(
          Text(widget.predictorProps["title"], style: styles.headline5)),
      GestureDetector(
          onTap: () => setState(() => widget.predictor.newPrediction()),
          child: styles.symPad(Text(widget.predictorProps["clickMessage"],
              style: styles.bodyText2))),
      styles.symPad(
        Text('${widget.predictor.prediction}', style: styles.headline5),
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
