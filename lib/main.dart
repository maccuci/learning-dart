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