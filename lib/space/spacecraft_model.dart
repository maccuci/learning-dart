enum SpacecraftModel {
  corvette(name: "Corvette", crewMaxSize: 1);

  const SpacecraftModel({ required this.name, required this.crewMaxSize });

  final String name;
  final int crewMaxSize;
}