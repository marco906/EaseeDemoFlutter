import 'package:flutter/cupertino.dart';

// Model for single charge robot
class ChargeRobot extends ChangeNotifier {
  final String name;
  final String color;

  bool isCharging = false;
  bool isCableLocked = true;
  bool isAccessLocked = false;

  ChargeRobot({
    required this.name,
    required this.color
  });

  // Methods to notify listeners
  void setCharging(bool value) {
    isCharging = value;
    notifyListeners();
  }

  void setCableLocked(bool value) {
    isCableLocked = value;
    notifyListeners();
  }

  void setAccessLocked(bool value) {
    isAccessLocked = value;
    notifyListeners();
  }
}

// Charge site that can contain multiple charge robots
class ChargeSite {
  final String name;
  final int consumption;
  List<ChargeRobot> chargers;

  ChargeSite({
    required this.name,
    required this.consumption,
    required this.chargers,
  });

  // Preview objects
  static ChargeSite get preview =>
      ChargeSite(name: "Home",
          consumption: 2049,
          chargers: [
            ChargeRobot(name: "GARAGE 1", color: 'blue'),
            ChargeRobot(name: "GARAGE 2", color: 'white'),
          ]);
  static ChargeSite get preview2 =>
      ChargeSite(name: "Cabin",
          consumption: 712,
          chargers: [
            ChargeRobot(name: "CARPORT", color: 'red'),
          ]);
}

// Global model that holds the users charge sites
class Model extends ChangeNotifier {
  Model({ required this.sites });
  List<ChargeSite> sites;
  ChargeSite? currentSite;

  void setCurrentChargeSite(ChargeSite? site) {
    currentSite = site;
    notifyListeners();
  }

  // Preview object
  static Model get preview =>
      Model(sites: [ChargeSite.preview, ChargeSite.preview2]);
}

enum PeriodType {
  month,
  year,
  total
}

extension PeriodTypeUtils on PeriodType {
  int get rawValue {
    switch (this) {
      case PeriodType.month: return 0;
      case PeriodType.year: return 1;
      case PeriodType.total: return 2;
    }
  }

  static PeriodType? from(int? value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 0: return PeriodType.month;
      case 1: return PeriodType.year;
      case 2: return PeriodType.total;
      default:
      break;
    }
    return null;
  }
}
