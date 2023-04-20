/// Types
/// int -> For integer numbers.
/// double -> For decimal numbers (floating).
/// num -> Superclass of int and double.
/// bool -> For boolean values.
/// String -> For characters.
/// List -> For ordered collections of values, can be a list of primitive types or obj.
/// Map -> For collections of key-value paris.
/// Set -> For unordered collections of unique values.
/// dynamic -> To indicate a type that can be defined at runtime
/// Object -> The base class of all other classes in Dart.

void main() {
  var name = "Test";
  int bornAt = 2004; //var bornAt = 2004 [no using type]
  List<String> namesList = ["Test 2", "Test 3"];

  print("Nome: $name");
  print("Nascimento: $bornAt");
  print("Idade: ${findAge(bornAt)}");
  print("\nLista de nomes para nascidos em 2004:");
  for (final obj in namesList) {
    print(obj);
  }
}

// Functions

int findAge(int bornAt) {
  if(bornAt == 0) return -1;

  return 2023 - bornAt;
}