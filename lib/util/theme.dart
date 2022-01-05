import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.dark,
    primaryColor: const Color(0xFFFFFFFF),
    accentColor: Colors.red[700],
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
        color: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color(0xFF151515)
        ),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000))),
    cardTheme: const CardTheme(
      color: Color(0xFFF3F3F3),
    ),
    bottomAppBarColor: const Color(0xFFE5E5E5),
    accentTextTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.red[700],
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.deepPurple),
      selectedLabelStyle: TextStyle(color: Colors.deepPurple),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFE5E5E5),
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: Color(0xFFd95b52),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFE5E5E5),
        indicatorColor: Colors.red[700],
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFF050505),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFFFFFFFF)));

ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    primaryColor: const Color(0xFF202124),
    accentColor: const Color(0xFFd95b52),
    scaffoldBackgroundColor: const Color(0xFF202124),
    appBarTheme: const AppBarTheme(
        color: Color(0xFF202124),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color(0xFFF5F5F5)
        ),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF))),
    cardTheme: const CardTheme(
      color: Color(0xFF303134),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFFd96252),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xFFA590D5)),
      selectedLabelStyle: TextStyle(color: Color(0xFFA590D5)),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF141518),
    ),
    bottomAppBarColor: const Color(0xFF141518),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFF0F0F0),
      actionTextColor: Colors.red[700],
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF141518),
        indicatorColor: const Color(0xFFd95b52),
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFFEAEAEA),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFF202124)));

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