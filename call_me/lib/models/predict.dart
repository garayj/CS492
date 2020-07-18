import 'dart:math';

class Predict {
  final random = Random();
  final List<String> predictions = [
    'Hard Pass',
    'Looks good',
    'Maybe, seems likely',
    'Possibly, but unlikely',
    'It may or may not happen',
    'Ask someone else',
    'Definitely yes',
    'Try again later'
  ];
  String _prediction = '';
  // State functions
  void newPrediction() {
    _prediction = predictions[random.nextInt(predictions.length)];
  }

  String get prediction => _prediction;
}
