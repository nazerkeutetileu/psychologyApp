import 'package:flutter/material.dart';

class TestInitiationProvider extends ChangeNotifier {
  bool _isReady = false;
  bool _isChecked = false;

  bool get isReady => _isReady;
  bool get isChecked => _isChecked;

  void setReady(bool value) {
    _isReady = value;
    notifyListeners();
  }

  void setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
