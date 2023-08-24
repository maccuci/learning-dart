import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:learning_dart/space/crew_member.dart';
import 'package:learning_dart/space/planet/planet.dart';
import 'package:learning_dart/space/spacecraft/spacecraft.dart';
import 'package:learning_dart/space/spacecraft/spacecraft_model.dart';
import 'package:learning_dart/space/utils/random.dart';

class SpacecraftManager {
  static Spacecraft createSpacecraft() {
    print("A list of spacecraft models exists, choose one: ");
    for (final sm in SpacecraftModel.values) {
      print(sm.name);
    }

    Spacecraft? spacecraft;
    bool found = false;
    String? userInput = stdin.readLineSync();

    for (final sm in SpacecraftModel.values) {
      if (userInput != null &&
          userInput.split(' ').any(
              (word) => sm.name.toLowerCase().contains(word.toLowerCase()))) {
        found = true;
        spacecraft = _createSpacecraftWithName(sm);
        break;
      }
    }

    if (!found) {
      print("The spacecraft model was not found. Try again later.");
    }

    return spacecraft!;
  }

  static Spacecraft _createSpacecraftWithName(SpacecraftModel model) {
    print("Insert a name for your Spacecraft: ");
    String? name = stdin.readLineSync();
    if (name != null) {
      Spacecraft spacecraft = Spacecraft(m: model, n: name, f: model.fuel);
      print(
          "The ${spacecraft.name} (${spacecraft.model.name}) spacecraft was created!\n");
      spacecraft.describe();
      return spacecraft;
    }
    throw ArgumentError("Spacecraft name cannot be null.");
  }

  static void addCrewMember(Spacecraft? spacecraft) {
    if (spacecraft == null) {
      print("Please create a spacecraft first.");
      return;
    }

    print("Insert a new crew member name: ");
    String? crewMemberName = stdin.readLineSync();
    if (crewMemberName != null) {
      spacecraft.addCrewMember(CrewMember(
        name: crewMemberName,
        country: RandomUtils.randomCountry(),
        age: Random().nextInt((50 - 15) + 1),
      ));
      print("A new crew member was added to your Spacecraft!");
      spacecraft.describe();
    }
  }

  static void displayStats(Spacecraft? spacecraft) {
    if (spacecraft == null) {
      print("Please create a spacecraft first.");
      return;
    }

    spacecraft.describe();
  }

  static Future<void> travelToPlanet(Spacecraft? spacecraft) async {
    if (spacecraft == null) {
      print("Please create a spacecraft first.");
      return;
    }

    print("Insert your destination planet: ");
    for (final planet in Planet.values) {
      print(planet.name);
    }

    String? planetString = stdin.readLineSync()?.toLowerCase();
    Planet selectedPlanet = Planet.values.firstWhere(
      (planet) =>
          planet.toString().split('.').last.toLowerCase() == planetString,
      orElse: () => Planet.base,
    );

    if (selectedPlanet != Planet.base) {
      print("${spacecraft.fuel}");
      print("${selectedPlanet.fuelNeed}");
      print(
          "The spacecraft is traveling to the planet ${selectedPlanet.name}.");

      final completer = Completer<void>();

      await Future.delayed(Duration(seconds: 3), () {
        final random = Random().nextInt(100);
        if (spacecraft.model.fuel >= selectedPlanet.fuelNeed) {
          if (random < 50) {
            reduceFuel(spacecraft, selectedPlanet.fuelNeed, completer);
            print("You have arrived to ${selectedPlanet.name}!");
          } else {
            print(
                "Your travel to ${selectedPlanet.name} has failed. Try again.");
            completer
                .complete();
                return;
          }
        } else {
          print("You don't have enough fuel to travel to this planet.");
          completer
              .complete();
        }
            spacecraft.travelTo(planet: selectedPlanet);
      });

      await completer.future;
    } else {
      print("Invalid planet name. Please enter a valid planet name.");
    }
  }

  static void reduceFuel(Spacecraft spacecraft, int fuelNeed, Completer<void> completer) {
    int spacecraftFuel = spacecraft.model.fuel;
    if (spacecraftFuel >= fuelNeed) {
      spacecraft.updateFuel(spacecraftFuel - fuelNeed, true);
      completer
          .complete();
    }
  }
}
