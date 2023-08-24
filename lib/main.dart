import 'dart:io';

import './space/spacecraft/spacecraft.dart';
import './space/manager/spacecraft_manager.dart';

void main() async {
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
        spacecraft = SpacecraftManager.createSpacecraft();
        break;
      case 2:
        SpacecraftManager.addCrewMember(spacecraft);
        break;
      case 3:
        SpacecraftManager.displayStats(spacecraft);
        break;
      case 4:
        await SpacecraftManager.travelToPlanet(spacecraft);
        break;
      case 0:
        exit = true;
        break;
      default:
        print("Invalid option. Please try again.");
    }
  }
}
