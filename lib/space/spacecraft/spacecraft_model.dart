enum SpacecraftModel {
  corvette(name: "Corvette", crewMaxSize: 5, fuel: 100, maxFuel: 100),
  chandra(name: "Chandra", crewMaxSize: 10, fuel: 100, maxFuel: 200),
  juno(name: "Juno", crewMaxSize: 7, fuel: 100, maxFuel: 130),
  voyager(name: "Voyager", crewMaxSize: 15, fuel: 100, maxFuel: 250);

  const SpacecraftModel({required this.name, required this.crewMaxSize, required this.fuel, required this.maxFuel});

  final String name;
  final int crewMaxSize;
  final int fuel, maxFuel;
}
