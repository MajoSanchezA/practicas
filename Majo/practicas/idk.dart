void main() {
  Gato cat = Gato(patas: 4);
  cat.name = 'Mauricio';
  cat.edad = 2;
  cat.color = 'Blanco y Negro';

  print(cat);
}

class Gato {
  String? name;
  int? edad;
  String? color;
  int? patas;

  Gato({required this.patas}) {
    this.name = name;
    this.edad = edad;
    this.color = color;
  }
  @override
  String toString() {
    return 'Gato: $name, $edad años, $color, $patas patas';
  }
}
