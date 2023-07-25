enum Planet {
  base(name: "Base", type: PlanetType.terrestrial, moons: 1, atmosphere: [Atmosphere.oxygen]),
  oceana(name: "Oceana", type: PlanetType.oceanic, moons: 3, atmosphere: [Atmosphere.hydrogen, Atmosphere.methane]),
  nimbus(name: "Nimbus", type: PlanetType.ice, moons: 10, atmosphere: [Atmosphere.methane, Atmosphere.oxygen]),
  lyton(name: "Lyton", type: PlanetType.gas, moons: 4, atmosphere: [Atmosphere.carbon, Atmosphere.methane]);

  const Planet({ required this.name, required this.type, required this.moons, required this.atmosphere });

  final String name;
  final PlanetType type;
  final int moons;
  final List<Atmosphere> atmosphere;

  String information() {
    return "Name: $name\nType: ${type.name}\nMoons: $moons\nAtmosphere: ${atmosphere.map((a) => a.name).join(", ")}";
  }

  bool canLand() {
    return atmosphere.contains(Atmosphere.oxygen) && type == PlanetType.terrestrial;
  }
}

enum PlanetType {terrestrial, gas, ice, moist, oceanic}

enum Atmosphere { hydrogen, nitrogen, oxygen, carbon, methane }