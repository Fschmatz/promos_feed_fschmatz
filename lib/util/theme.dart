import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: ColorScheme.light(
        background: const Color(0xFFF0F2F2),
        primary: Colors.red.shade600,
        secondary: Colors.red.shade600,
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color(0xFF000000)
        ),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000))),
    cardTheme: const CardTheme(
      color: Color(0xFFF4F3F3),
    ),
    bottomAppBarColor: const Color(0xFFE5E5E5),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFE5E5E5),
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: Color(0xFFD86A62),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFE5E5E5),
        indicatorColor: Colors.red.shade600,
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFF050505),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFFFFFFFF)));

ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF212024),
    scaffoldBackgroundColor: const Color(0xFF212024),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF212024),
        primary:  Color(0xFFD86A62),
        secondary: Color(0xFFD86A62)
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFF212024),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color(0xFFFFFFFF)
        ),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF))),
    cardTheme: const CardTheme(
      color: Color(0xFF313034),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF161519),
    ),
    bottomAppBarColor: const Color(0xFF161519),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFF0F0F0),
      actionTextColor: Colors.red[700],
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF161519),
        indicatorColor: const Color(0xFFD86A62),
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFFEAEAEA),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFF212024)));
