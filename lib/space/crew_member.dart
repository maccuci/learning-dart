class CrewMember {
  String name;
  String country;
  int age;

  CrewMember({ required this.name, required this.country, required this.age });

  String information() {
    return "Crew Member \nName: $name\nCountry: $country\nAge: $age";
  }
}