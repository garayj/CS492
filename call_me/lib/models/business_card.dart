import 'package:flutter/material.dart';
import 'package:call_me/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCard {
  Map<String, String> _userData;
  Styles _styles;
  final maxFontSize = 60.0;
  BusinessCard(this._userData, this._styles);

  // Builds the phone title and name widgets.
  Widget _buildPhoneTitleNameWidget(String key, double maxFontSize) {
    if (key == 'phone')
      return _styles.businessCardContainer(GestureDetector(
          onTap: () => launch('sms:${_userData[key]}'),
          child: AutoSizeText(_userData[key],
              maxFontSize: maxFontSize,
              maxLines: 1,
              style: TextStyle(fontSize: _styles.fillHeight()))));
    return _styles.businessCardContainer(AutoSizeText(_userData[key],
        maxFontSize: maxFontSize,
        maxLines: 1,
        style: TextStyle(fontSize: _styles.fillHeight())));
  }

  // Builds the email and github widgets
  Widget _buildEmailGithub(String key) {
    final action = key == 'email'
        ? 'mailto:${_userData[key]}?subject=&body='
        : '${_userData[key]}';

    return _styles.symPad(
        GestureDetector(
          onTap: () => launch(action),
          child: Text(_userData[key], style: _styles.caption),
        ),
        v: 3.0,
        h: 5.0);
  }

  // Builds the avatar image widget.
  Widget _buildImage(String image) {
    return CircleAvatar(
        backgroundImage: AssetImage(image), radius: _styles.avatarRadius());
  }

  // Builds the row that email and github links will be in.
  Widget _buildRow() {
    return _styles.symPad(
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['email', 'github']
                .map((element) => _buildEmailGithub(element))
                .toList()),
        v: 5.0);
  }

  Widget paddedBusinessCard(double vertical, double horizontal) {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: Column(
          children: [
            _buildImage(_userData["image"]),
            _buildPhoneTitleNameWidget('name', maxFontSize),
            _buildPhoneTitleNameWidget('title', maxFontSize / 2),
            _buildPhoneTitleNameWidget('phone', maxFontSize / 4),
            _buildRow()
          ],
        ));
  }
}
