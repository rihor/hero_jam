import 'package:flutter/material.dart';

class Utils {
  // prevent from using constructor
  Utils._();

  static GlobalKey<NavigatorState> bottomNav =
      GlobalKey(debugLabel: "BottomNav");
  static GlobalKey<NavigatorState> mainAppNav =
      GlobalKey(debugLabel: "MainAppNav");

  static GlobalKey<FormState> formKey = GlobalKey(debugLabel: "FormLogin");
}
