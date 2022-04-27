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

  // Preview objects
  static ChargeSite get preview =>
      ChargeSite(name: "Home",
          chargers: [
            ChargeRobot(name: "GARAGE 1", color: 'blue'),
            ChargeRobot(name: "GARAGE 2", color: 'white'),
          ]);
  static ChargeSite get preview2 =>
      ChargeSite(name: "Cabin",
          chargers: [
            ChargeRobot(name: "CARPORT", color: 'red'),
          ]);
}

// Global model that hold users charge site and settings
class Model {
  Model({ required this.sites });
  List<ChargeSite> sites;

  // Preview object
  static Model get preview =>
      Model(sites: [ChargeSite.preview, ChargeSite.preview2]);
}