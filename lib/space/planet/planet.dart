enum Planet {
  base(
      name: "Base",
      type: PlanetType.terrestrial,
      moons: 1,
      fuelNeed: 1,
      atmosphere: [Atmosphere.oxygen]),
  oceana(
      name: "Oceana",
      type: PlanetType.oceanic,
      moons: 3,
      fuelNeed: 35,
      atmosphere: [Atmosphere.hydrogen, Atmosphere.methane]),
  nimbus(
      name: "Nimbus",
      type: PlanetType.ice,
      moons: 10,
      fuelNeed: 100,
      atmosphere: [Atmosphere.methane, Atmosphere.oxygen]),
  haterius(
      name: "Haterius",
      type: PlanetType.moist,
      moons: 2,
      fuelNeed: 70,
      atmosphere: [Atmosphere.oxygen, Atmosphere.nitrogen]),
  lyton(
      name: "Lyton",
      type: PlanetType.gas,
      moons: 4,
      fuelNeed: 50,
      atmosphere: [Atmosphere.carbon, Atmosphere.methane]);

  const Planet(
      {required this.name,
      required this.type,
      required this.moons,
      required this.fuelNeed,
      required this.atmosphere});

  final String name;
  final PlanetType type;
  final int moons;
  final List<Atmosphere> atmosphere;
  final int fuelNeed;

  String information() {
    return "   Name: $name\n   Type: ${type.name}\n   Moons: $moons\n   Fuel Need: $fuelNeed\n   Atmosphere: ${atmosphere.map((a) => a.name).join(", ")}";
  }

  bool canLand() {
    return atmosphere.contains(Atmosphere.oxygen) &&
        type == PlanetType.terrestrial;
  }
}

enum PlanetType { terrestrial, gas, ice, moist, oceanic }

enum Atmosphere { hydrogen, nitrogen, oxygen, carbon, methane }
