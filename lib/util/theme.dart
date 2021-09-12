import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFFFFFFFF),
    accentColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    cardTheme: CardTheme(
      color: Color(0xFFF1F1F1),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFFF9F9F9),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.blue),
      headline2: TextStyle(color: Color(0xFF000000)),
    ),
    bottomAppBarColor: Color(0xFFE6E6E6),
    bottomSheetTheme:
    BottomSheetThemeData(modalBackgroundColor: Color(0xFFF5F5F5)));

//ESCURO
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF1E1E20),
    accentColor: Color(0xFF7592CC),
    scaffoldBackgroundColor: Color(0xFF1E1E20),
    cardTheme: CardTheme(
      color: Color(0xFF272729),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFF2D2D2F),
    ),
    bottomAppBarColor: Color(0xFF151517),
    accentTextTheme: TextTheme(
      headline1: TextStyle(color: Color(0xFF95b3ed)),
      headline2: TextStyle(color: Color(0xFF000000)),
    ),
    bottomSheetTheme:
    BottomSheetThemeData(modalBackgroundColor: Color(0xFF151517)));

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
      prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}
