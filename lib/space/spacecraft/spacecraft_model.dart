enum SpacecraftModel {
  corvette(name: "Corvette", crewMaxSize: 5),
  chandra(name: "Chandra", crewMaxSize: 10),
  juno(name: "Juno", crewMaxSize: 7),
  voyager(name: "Voyager", crewMaxSize: 15);

  const SpacecraftModel({required this.name, required this.crewMaxSize});

  final String name;
  final int crewMaxSize;
}
