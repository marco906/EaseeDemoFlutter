import 'package:flutter/cupertino.dart';

// Model for single charge robot
class ChargeRobot extends ChangeNotifier {
  final String name;
  final String color;

  bool isCharging = false;

  ChargeRobot({
    required this.name,
    required this.color
  });

  void setCharging(bool value) {
    isCharging = value;
    notifyListeners();
  }
}

// Charge site that can contain multiple charge robots
class ChargeSite {
  final String name;
  List<ChargeRobot> chargers;

  ChargeSite({
    required this.name,
    required this.chargers,
  });

  // Preview object
  static ChargeSite get preview =>
      ChargeSite(name: "Home",
          chargers: [
            ChargeRobot(name: "GARAGE 1", color: 'blue'),
            ChargeRobot(name: "GARAGE 2", color: 'white'),
          ]);
}