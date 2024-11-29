abstract class Sofa {
  void sitOn();
}

class VictorianSofa implements Sofa {
  @override
  void sitOn() {
    print('El sofa victoriano se sitúa en el suelo');
  }
}

class ModernSofa implements Sofa {
  @override
  void sitOn() {
    print('El sofa moderno se sitúa en el suelo');
  }
}

abstract class CoffeTable {
  void hasLegs();
}

class VictorianCoffeTable implements CoffeTable {
  @override
  void hasLegs() {
    print('La mesa victoriana tiene 4 patas');
  }
}

class ModernCoffeTable implements CoffeTable {
  @override
  void hasLegs() {
    print('La mesa moderna tiene 4 patas');
  }
}

abstract class Chair {
  void hasLegs();
  void sitOn();
}

class VictorianChair implements Chair {
  @override
  void hasLegs() {
    print('La silla victoriana tiene 4 patas');
  }

  @override
  void sitOn() {
    print('La silla victoriana se sitúa en el suelo');
  }
}

class ModernChair implements Chair {
  @override
  void hasLegs() {
    print('La silla moderna tiene 4 patas');
  }

  @override
  void sitOn() {
    print('La silla moderna se sitúa en el suelo');
  }
}
