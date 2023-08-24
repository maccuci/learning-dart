import 'package:learning_dart/space/crew_member.dart';
import 'package:learning_dart/space/planet/planet.dart';

import 'spacecraft_model.dart';

class Spacecraft {
  late String name;
  late SpacecraftModel model;
  int fuel = 0;
  List<CrewMember> crew = [];
  late Planet destiny = Planet.base;

  Spacecraft({required SpacecraftModel m, required String n, required int f}) {
    model = m;
    name = n;
    fuel = f;
  }

  void addCrewMember(CrewMember crewMember) {
    if (crew.length >= (model.crewMaxSize)) {
      print("The crew is full!");
      return;
    }
    crew.add(crewMember);
  }

  void travelTo({required Planet planet}) {
    if (destiny == planet) return print("Your destiny is the same as the chosen one!");
    destiny = planet;
  }

  void disband() {
    name = "";
    destiny = Planet.base;
    crew.clear();
  }

  void updateFuel(int f, bool reduce) {
    if (reduce) {
      fuel -= f;
    } else {
      if (fuel > model.maxFuel) return print("The fuel is too much for this spacecraft!");
      fuel += f;
    }
  }

  void describe() {
    print("Spacecraft Name: $name");
    print("Spacecraft Type: ${model.name}");
    print("Spacecraft Fuel: $fuel/${model.maxFuel}");
    print("Spacecraft Destiny: ${destiny.name}");
    print("> Destiny Information:\n${destiny.information()}\n");
    print("Spacecraft Crew max. size: ${model.crewMaxSize}");
    print("Spacecraft spaces left: ${model.crewMaxSize - crew.length}");
    print("Spacecraft Crew list:");
    if (crew.isEmpty) return print("-/-");
    for (final cm in crew) {
      print(cm.information());
    }
  }
}
