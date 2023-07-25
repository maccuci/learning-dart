import 'dart:io';
import 'dart:math';

import 'package:learning_dart/space/crew_member.dart';
import 'package:learning_dart/space/planet/planet.dart';
import 'package:learning_dart/space/utils/random.dart';

import './space/spacecraft_model.dart';
import './space/spacecraft.dart';

void main() {
  bool exit = false;
  Spacecraft? spacecraft;

  while (!exit) {
    print("--[Spacecraft Panel]---");
    print("1 - Create Spacecraft.");
    print("2 - Add Crew member to Spacecraft.");
    print("3 - Display your spacecraft stats.");
    print("4 - Travel to the planet.");
    print("-----------------------");

    String? input = stdin.readLineSync();
    int choice = int.parse(input!);

    switch (choice) {
      case 1:
        spacecraft = createSpacecraft();
        break;
      case 2:
        addCrewMember(spacecraft);
        break;
      case 3:
        displayStats(spacecraft);
        break;
      case 4:
        travelToPlanet(spacecraft);
        break;
      case 0:
        exit = true;
        break;
      default:
        print("Invalid option. Please try again.");
    }
  }
}

Spacecraft createSpacecraft() {
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
      spacecraft = createSpacecraftWithName(sm);
      break;
    }
  }

  if (!found) {
    print("The spacecraft model was not found. Try again later.");
  }

  return spacecraft!;
}

Spacecraft createSpacecraftWithName(SpacecraftModel model) {
  print("Insert a name for your Spacecraft: ");
  String? name = stdin.readLineSync();
  if (name != null) {
    Spacecraft spacecraft = Spacecraft(m: model, n: name);
    print(
        "The ${spacecraft.name} (${spacecraft.model.name}) spacecraft was created!\n");
    spacecraft.describe();
    return spacecraft;
  }
  throw ArgumentError("Spacecraft name cannot be null.");
}

void addCrewMember(Spacecraft? spacecraft) {
  if (spacecraft == null) {
    print("Please create a spacecraft first.");
    return;
  }

  print("Insert a new crew member name: ");
  String? crewMemberName = stdin.readLineSync();
  if (crewMemberName != null) {
    spacecraft.addCrewMember(CrewMember(
      name: crewMemberName,
      country: randomCountry(),
      age: Random().nextInt((50 - 15) + 1),
    ));
    print("A new crew member was added to your Spacecraft!");
    spacecraft.describe();
  }
}

void displayStats(Spacecraft? spacecraft) {
  if (spacecraft == null) {
    print("Please create a spacecraft first.");
    return;
  }

  spacecraft.describe();
}

void travelToPlanet(Spacecraft? spacecraft) {
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
    (planet) => planet.toString().split('.').last.toLowerCase() == planetString,
    orElse: () => Planet.base,
  );

  if (selectedPlanet != Planet.base) {
    spacecraft.travelTo(planet: selectedPlanet);
    print("The spacecraft is traveling to the planet ${selectedPlanet.name}.");
  } else {
    print("Invalid planet name. Please enter a valid planet name.");
  }
}
