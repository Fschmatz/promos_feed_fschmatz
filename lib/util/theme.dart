import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFEFE),
    scaffoldBackgroundColor: const Color(0xFFFFFEFE),
    colorScheme: ColorScheme.light(
      background: const Color(0xFFF0F2F2),
      primary: Colors.red.shade600,
      secondary: Colors.red.shade600,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFFFFEFE),
      color: Color(0xFFFFFFFF),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFFF8EEE9),
    ),
    bottomAppBarColor: const Color(0xFFECE6E6),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFECE6E6),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFEFE),
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: Color(0xFFE87169),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFECE6E6),
        indicatorColor: Colors.red.shade600,
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFFFFFFF)));

ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1B1B1B),
    scaffoldBackgroundColor: const Color(0xFF1B1B1B),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF1B1B1B),
        primary: Color(0xFFE87169),
        secondary: Color(0xFFE7827C)),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1B1B1B),
      color: Color(0xFF1B1B1B),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF2F2D2F),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF313034),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF292729),
    ),
    bottomAppBarColor: const Color(0xFF292729),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFF0F0F0),
      actionTextColor: Colors.red[700],
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF292729),
        indicatorColor: const Color(0xFF833833),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFEEE7E6),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEEE7E6), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF292729)));
