import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var constController = TextEditingController();
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
