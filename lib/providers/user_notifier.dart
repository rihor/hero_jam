import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserModel extends ChangeNotifier {
  String? _name;
  Position? position;

  String? getName() => _name;

  void changeName(String newName) {
    if (newName.isEmpty) {
      return;
    }

    _name = newName;
    notifyListeners();
  }

  Future<Position?> updateLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    notifyListeners();

    return position;
  }
}
