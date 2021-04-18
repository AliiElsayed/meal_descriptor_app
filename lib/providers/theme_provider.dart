import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  var thMode = ThemeMode.system;
  String themeName = 'system';
  var primaryAppColor = Colors.pink;
  var accentAppColor = Colors.amber;

  void changeThemeMode(themeVal) async {
    thMode = themeVal;
    _getThemeName(thMode);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString('themeName', themeName);
    notifyListeners();
  }

  void _getThemeName(ThemeMode themeMo) {
    if (themeMo == ThemeMode.system) {
      themeName = 'system';
    } else if (themeMo == ThemeMode.light) {
      themeName = 'light';
    } else if (themeMo == ThemeMode.dark) {
      themeName = 'dark';
    }
  }

  void getTheme() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    themeName = _pref.getString('themeName') ?? 'system';
    _determineMode(themeName);
    primaryAppColor =
        _toMaterialColor(_pref.getInt('primaryColorValue') ?? 0xFFE91E63);
    accentAppColor =
        _toMaterialColor(_pref.getInt('accentColorValue') ?? 0xFFFFC107);
    notifyListeners();
  }
  void getDefaultColors()async{
    primaryAppColor = Colors.pink;
    accentAppColor = Colors.amber;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setInt('primaryColorValue', primaryAppColor.value);
    _pref.setInt('accentColorValue', accentAppColor.value);
    notifyListeners();
  }

  void _determineMode(String name) {
    if (name == 'system') {
      thMode = ThemeMode.system;
    } else if (name == 'light') {
      thMode = ThemeMode.light;
    } else if (name == 'dark') {
      thMode = ThemeMode.dark;
    }
  }

  void changeColor(newColor, String titleWord) async {
    titleWord == 'Primary'
        ? primaryAppColor = _toMaterialColor(newColor.hashCode)
        : accentAppColor = _toMaterialColor(newColor.hashCode);
    notifyListeners();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setInt('primaryColorValue', primaryAppColor.value);
    _pref.setInt('accentColorValue', accentAppColor.value);
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
