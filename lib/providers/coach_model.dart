import 'package:flutter/material.dart';

class CoachModel extends ChangeNotifier {
  String? _name;

  String? getName() => _name;

  void changeName(String newName) {
    if (newName.isEmpty) {
      return;
    }

    _name = newName;
    notifyListeners();
  }
}
