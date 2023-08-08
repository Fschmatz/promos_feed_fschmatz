import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
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
    dividerTheme: const DividerThemeData(
      color: Color(0xFFF4F0F0),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFFF4F0F0),
      surfaceTintColor: Color(0xFFF4F0F0),
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
        surfaceTintColor: const Color(0xFFECE6E6),
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
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF181313),
    scaffoldBackgroundColor: const Color(0xFF181313),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF181313),
        primary: Color(0xFFFC9FA3),
        secondary: Color(0xFFFC9FA3)),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF181313),
      color: Color(0xFF181313),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFF261F1F),
      color: Color(0xFF261F1F),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF313034),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF322929),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF322626),
    ),
    bottomAppBarColor: const Color(0xFF322626),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFF0F0F0),
      actionTextColor: Colors.red[700],
    ),
    navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: const Color(0xFF322626),
        backgroundColor: const Color(0xFF322626),
        indicatorColor: const Color(0xFF5D3F40),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFEEE7E6),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEEE7E6), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF322626)));
