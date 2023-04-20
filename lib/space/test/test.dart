import 'dart:io';

import '../crew_member.dart';
import '../spacecraft_model.dart';
import '../spacecraft.dart';
import '../planet/planet.dart';

void main() {
  // var corvette = Spacecraft(SpacecraftModel.corvette);
  // var member = CrewMember(name: "Abast Lenner", country: "EUA", age: 32);
  //
  // corvette.addCrewMember(member);
  // corvette.travelTo(planet: Planet.oceana);
  // corvette.describe();
  print("--[Spacecraft Panel]---");
  print("1 - Create Spacecraft.");
  print("2 - Add Crew member to Spacecraft.");
  print("3 - Travel to the planet.");
  print("--[Spacecraft Panel]---");

  String? input = stdin.readLineSync();
  int choice = int.parse(input!);

  switch (choice) {
    case 1:
      print("List of all spacecraft models: ");
      dynamic spacecraft, sm;
      bool? find = false;
      for(final sc in SpacecraftModel.values) {
        print(sc.name);
        find = stdin.readLineSync()?.toLowerCase().contains(sc.name.toLowerCase());
        sm = sc;
      }
      if(find!) {
        print("The spacecraft was created!\n");
        spacecraft = Spacecraft(sm);
        print(spacecraft.describe());
        main();
      } else {
        print("The spacecraft not find! Try again later.");
      }
      break;
  }
}