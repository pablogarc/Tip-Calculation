import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var constController = TextEditingController();
  String _amount = "0.00";
  String get getAmount => _amount;
  int? _selectedRadio = null;
  int? get getSelectedRadio => _selectedRadio;
  bool isSelected = false;
  var radioGroupValues = {
    20: "Amazing 20%",
    18: "Good 18%",
    15: "ok 15%",
  };

  void tipCalculation(int dato) {
    // TODO: completar
    double calculate = dato + (dato * (_selectedRadio! / 100));

    if (!isSelected) {
      _amount = calculate.toStringAsFixed(2);
    } else {
      _amount = calculate.ceilToDouble().toStringAsFixed(0);
    }
    notifyListeners();
  }

  void setIsSelected(bool switchValue) {
    isSelected = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? radioValue) {
    _selectedRadio = radioValue;
    notifyListeners();
  }
}
