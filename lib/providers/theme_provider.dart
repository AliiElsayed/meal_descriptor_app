import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var thMode = ThemeMode.system;
  var primaryAppColor = Colors.pink;
  var accentAppColor = Colors.amber;

  void changeThemeMode(themeVal) async {
    thMode = themeVal;
    notifyListeners();
  }

  void changeColor(newColor, String titleWord) {
    titleWord == 'Primary'
        ? primaryAppColor = _toMaterialColor(newColor.hashCode)
        : accentAppColor = _toMaterialColor(newColor.hashCode);
    notifyListeners();
  }

  MaterialColor _toMaterialColor(colorValue) {
    return MaterialColor(
      colorValue,
      <int, Color>{
        50: Color(0xFFFCE4EC),
        100: Color(0xFFF8BBD0),
        200: Color(0xFFF48FB1),
        300: Color(0xFFF06292),
        400: Color(0xFFEC407A),
        500: Color(colorValue),
        600: Color(0xFFD81B60),
        700: Color(0xFFC2185B),
        800: Color(0xFFAD1457),
        900: Color(0xFF880E4F),
      },
    );
  }
}
