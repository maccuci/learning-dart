import '../crew-member.dart';
import '../spacecraft-model.dart';
import '../spacecraft.dart';
import '../planet/planet.dart';

void main() {
  var corvette = Spacecraft(SpacecraftModel.corvette);
  var member = CrewMember(name: "Abast Lenner", country: "EUA", age: 32);

  corvette.addCrewMember(member);
  corvette.travelTo(planet: Planet.oceana);
  corvette.describe();
}