import 'package:dart_adventure/dart_adventure.dart';

void main(List<String> args) async {
  if (args.isEmpty) return;
  final planetarySystem = Decoder(args[0]);
  await planetarySystem.init();
  foo(y: 8, x: 4);
  foo(x: 4, y: 8);

  SpaceAdventure(
          planetarySystem: PlanetarySystem(
              name: planetarySystem.name, planets: planetarySystem.planets))
      .start();
}

void foo({int x, int y}) {
  print(x);
  print(y);
}
