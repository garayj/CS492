import 'dart:convert';
import 'dart:io';

import 'planet.dart';

class Decoder {
  final String path;
  String name;
  List<Planet> planets;

  Decoder(this.path);

  void init() async {
    final inputFile = File(path);
    final inputFilesExists = await inputFile.exists();
    if (!inputFilesExists) return;
    final stringifiedFile = await inputFile.readAsString();
    final planetarySystem = jsonDecode(stringifiedFile);
    name = planetarySystem['name'];
    planets = formatPlanetNamesAndDescriptions(planetarySystem['planets']);
  }

  List<Planet> formatPlanetNamesAndDescriptions(List<dynamic> planetData) {
    return planetData
        .map((entry) =>
            Planet(name: entry['name'], description: entry['description']))
        .toList();
  }
}
