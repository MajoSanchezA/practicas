import 'dart:io';

void main() {
  int tipo = int.parse(stdin.readLineSync()!);
  Logistica log;

  if (tipo == 1) {
    log = LogisticaCamion();
  } else if (tipo == 2) {
    log = LogisticaBarco();
  } else if (tipo == 3) {
    log = LogisticaAvion();
  } else {
    print('Opción inválida');
    exit(1);
  }
  log.planDelivery();
}

abstract class Logistica {
  Transporte createTransporte();
  planDelivery() {
    Transporte t = createTransporte();
    t.deliver();
  }
}

class LogisticaCamion extends Logistica {
  @override
  Transporte createTransporte() {
    return Camion();
  }
}

class LogisticaBarco extends Logistica {
  @override
  Transporte createTransporte() {
    return Barco();
  }
}

class LogisticaAvion extends Logistica {
  @override
  Transporte createTransporte() {
    return Avion();
  }
}

abstract class Transporte {
  void deliver();
}

class Camion implements Transporte {
  @override
  void deliver() {
    print('La entrega es por tierra.');
  }
}

class Avion implements Transporte {
  @override
  void deliver() {
    print('La entrega es por aire.');
  }
}

class Barco implements Transporte {
  @override
  void deliver() {
    print('La entrega es por mar.');
  }
}
