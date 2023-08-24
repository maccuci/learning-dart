class CrewMember {
  final String name;
  final String country;
  final int age;

  CrewMember({required this.name, required this.country, required this.age});

  String information() {
    return "Crew Member \nName: $name\nCountry: $country\nAge: $age";
  }
}
