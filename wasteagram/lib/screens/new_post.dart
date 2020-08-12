import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wasteagram/components/form.dart';
import 'package:wasteagram/models/firebase.dart';
import 'package:wasteagram/models/translations.dart';
import 'package:wasteagram/styles.dart';
import '../components/appbar.dart';

class NewPost extends StatefulWidget {
  static const routeName = "newPost";
  const NewPost({Key key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final firebase = FireBase();
  int quantity;
  static Styles styles = Styles();
  LocationData locationData;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    final locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {});
  }

  void _onSaved(value) => setState(() => quantity = int.parse(value));

  void _onPressed(image) async {
    // Check if the quantity field is valid.
    if (!_formKey.currentState.validate()) return;

    // Save quantity value.
    _formKey.currentState.save();

    // Add the image to cloud storage, get the url, and add the post to firestore.
    firebase
        .addImageToCloudStorage(image)
        .then((storage) => storage.getDownloadURL())
        .then((url) => firebase.addPostToFirestore(
            url, quantity, locationData.latitude, locationData.longitude));

    // Pop back to the previous screen.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    File image = ModalRoute.of(context).settings.arguments;
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: appbar(context),
      body: image == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : styles.newPostContainer(
              <Widget>[
                styles.imageContainer(
                  context,
                  Semantics(
                    image: true,
                    hint: Translations(locale: locale).selectedImage,
                    child: Image.file(image),
                  ),
                ),
                form(_formKey, locale, _onSaved)
              ],
            ),
      bottomNavigationBar: FlatButton(
        color: Colors.blue,
        onPressed: () => _onPressed(image),
        child: Text(Translations(locale: locale).submitButton),
      ),
    );
  }
}
