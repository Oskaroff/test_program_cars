import 'dart:math';

abstract class Cars {
  bool currentEngine = false;

  bool get isEngine => currentEngine;
  set setEngineState(bool value) => currentEngine = value;

  void enginState() => currentEngine
      ? print("$runtimeType is starting the engin")
      : print("$runtimeType is stopping the engin");

  void carType() {
    print(
        "Car or type $runtimeType and price: ${Random().nextInt(100)} created");
  }
}

class SUVCar extends Cars {
  int clearance = 0;

  int get isclearance => clearance;
  set setclearance(int value) => clearance = value;
}

class SedanCar extends Cars {}

class ElectricCar extends Cars {
  bool currentBattery = true;

  bool get isBattery => currentBattery;
  set setBatteryState(bool value) => currentBattery = value;

  @override
  void enginState() {
    if (!currentBattery && currentEngine) {
      print("ElectricCar is worming the battery");
      print("ElectricCar is starting the engin");
    } else {
      print("ElectricCar is stopping the engin. Is not worming the battery !");
    }
  }
}

void main(List<String> arguments) {
  var suvCarOne = SUVCar();
  var suvCarTwo = SUVCar();
  var elCar = ElectricCar();
  var sedanCarOne = SedanCar();
  var sedanCarTwo = SedanCar();

  suvCarOne.carType();
  suvCarTwo.carType();
  elCar.carType();
  sedanCarOne.carType();
  sedanCarTwo.carType();

  print("**");
  print("");

  Future.delayed(Duration(seconds: 1)).then((value) {
    suvCarOne.currentEngine = true;
    suvCarOne.enginState();
    suvCarTwo.currentEngine = true;
    suvCarTwo.enginState();
    elCar.currentBattery = false;
    elCar.currentEngine = true;
    elCar.enginState();
    sedanCarOne.currentEngine = true;
    sedanCarOne.enginState();
    sedanCarTwo.currentEngine = true;
    sedanCarTwo.enginState();

    print("**");
    print("");
  });

  Future.delayed(Duration(seconds: 5)).then((value) {
    suvCarOne.currentEngine = false;
    suvCarOne.enginState();
    suvCarTwo.currentEngine = false;
    suvCarTwo.enginState();
    elCar.currentBattery = true;
    elCar.currentEngine = false;
    elCar.enginState();
    sedanCarOne.currentEngine = false;
    sedanCarOne.enginState();
    sedanCarTwo.currentEngine = false;
    sedanCarTwo.enginState();
  });
}
