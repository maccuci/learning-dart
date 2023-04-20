enum Planet {
  oceana(name: "Oceana", type: PlanetType.oceanic, moons: 3, atmosphere: [Atmosphere.hydrogen, Atmosphere.methane]);

  const Planet({ required this.name, required this.type, required this.moons, required this.atmosphere });

  final String name;
  final PlanetType type;
  final int moons;
  final List<Atmosphere> atmosphere;

  String information() {
    return "Name: $name\nType: ${type.name}\nMoons: $moons\nAtmosphere: ${atmosphere.map((a) => a.name).join(", ")}";
  }
}

enum PlanetType {terrestrial, gas, ice, moist, oceanic}

enum Atmosphere { hydrogen, nitrogen, oxygen, carbon, methane }