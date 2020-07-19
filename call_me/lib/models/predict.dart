import 'dart:math';

class Predict {
  Predict(this.predictions);
  final random = Random();
  final List<String> predictions;
  String _prediction = '';
  // State functions
  void newPrediction() {
    _prediction = predictions[random.nextInt(predictions.length)];
  }

  String get prediction => _prediction;
}
