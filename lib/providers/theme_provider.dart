import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

class ThemeProvivder with ChangeNotifier {
  String appTHeme = "CURRENT THEMEE";
  bool isDark = false;

  ThemeProvivder() {
    getTheme(); // Load theme during initialization
  }

  Future<void> setTheme({required bool currentTheme}) async {
    var box = await Hive.openBox('themeBox'); // Open Hive box
    await box.put(appTHeme, currentTheme); // Save theme value
    isDark = currentTheme;
    notifyListeners();
  }

  Future<void> getTheme() async {
    var box = await Hive.openBox('themeBox'); // Open Hive box
    isDark = box.get(appTHeme, defaultValue: false); // Retrieve theme value
    notifyListeners();
  }
}
