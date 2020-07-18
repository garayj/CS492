/// Support for doing something awesome.
import 'dart:io';
import 'package:dart_adventure/dart_adventure.dart';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {
  final PlanetarySystem planetarySystem;
  SpaceAdventure({this.planetarySystem});
  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    if (planetarySystem.hasPlanets) {
      print('Let\'s go on an adventure!');
      travel(promptForRandomOrSpecificDestination(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Aw, there are no planets to explore.');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!\n'
        'There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  void printIntroduction(String name) {
    print(
        'Nice to meet you, $name. My name is Jose, I\'m an old friend of Alexa.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  void travelTo(Planet planet) {
    print('Traveling to ${planet.name}...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travel(bool randomDestination) {
    Planet planet;
    randomDestination
        ? planet = planetarySystem.randomPlanet()
        : planet = planetarySystem.planetWithName(
            responseToPrompt('Name the planet you would like to visit'));
    travelTo(planet);
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String randomizePlanet;
    while (randomizePlanet != 'Y' && randomizePlanet != 'N') {
      randomizePlanet = responseToPrompt(prompt);
      if (randomizePlanet == 'Y') {
        return true;
      } else if (randomizePlanet == 'N') {
        return false;
      } else {
        print('Sorry I didn\'t get that');
      }
    }
    return false;
  }
}
