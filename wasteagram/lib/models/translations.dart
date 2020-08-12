import 'package:flutter/cupertino.dart';

class Translations {
  Locale locale;
  Translations({this.locale});
  static const staticTranslations = {
    'en': {
      'fabHintText': "Press to open the camera app to take a photo",
      'formValidatorHint': "Please enter a value.",
      'labelText': "Number of Items",
      'selectedImage': "The image you selected",
      'submitButton': 'Submit',
      'title': "Wasteagram",
      'textFormFieldHint': "Input field for the number of items"
    }
  };

  final dynamicTranslations = {
    'en': {
      'listOnTapHint': (String date, int quantity) =>
          "Tap to access the post on $date with a quantity of $quantity",
    }
  };

  String get selectedImage =>
      staticTranslations[locale.languageCode]["selectedImage"];
  String get textFormFieldHint =>
      staticTranslations[locale.languageCode]["textFormFieldHint"];
  String get title => staticTranslations[locale.languageCode]['title'];
  String get submitButton =>
      staticTranslations[locale.languageCode]["submitButton"];
  String get formValidatorHint =>
      staticTranslations[locale.languageCode]["formValidatorHint"];
  String get labelText => staticTranslations[locale.languageCode]["labelText"];
  String get fabHintText =>
      staticTranslations[locale.languageCode]["fabHintText"];

  Function get listOnTapHint =>
      dynamicTranslations[locale.languageCode]["listOnTapHint"];
}
