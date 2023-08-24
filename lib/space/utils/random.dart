import 'dart:math';

class RandomUtils {
  static String randomCountry() {
    List<String> countries = ["EUA", "Brazil", "Canada", "Portugal", "Spain"];

    int random = Random().nextInt(countries.length);

    return countries[random];
  }
}
