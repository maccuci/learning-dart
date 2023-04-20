import 'crew-member.dart';
import 'planet/planet.dart';
import 'spacecraft-model.dart';

class Spacecraft {
  SpacecraftModel model;
  List<CrewMember> crew = [];
  dynamic destiny;

  Spacecraft(this.model);

  void addCrewMember(CrewMember crewMember) {
    if(crew.length >= model.crewMaxSize) {
      print("The crew is full!");
      return;
    }
    crew.add(crewMember);
  }

  void travelTo({required Planet planet}) {
    destiny = planet;
  }

  void describe() {
    print("Spacecraft: ${model.name}");
    print("Spacecraft Destiny: ${destiny.name}");
    print("> Destiny Information:\n${destiny.information()}\n");
    print("Spacecraft Crew size: ${model.crewMaxSize}");
    print("Spacecraft Crew list:");
    if(crew.isEmpty) return print("-/-");
    for (final cm in crew) {
      print(cm.information());
    }
  }
}
