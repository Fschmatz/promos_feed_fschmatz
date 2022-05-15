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
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000))),
    cardTheme: const CardTheme(
      color: Color(0xFFF6F6F6),
    ),
    bottomAppBarColor: const Color(0xFFE9E8E8),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFE9E8E8),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: Color(0xFFE87169),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFE9E8E8),
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
    primaryColor: const Color(0xFF1E1D1F),
    scaffoldBackgroundColor: const Color(0xFF1E1D1F),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF1E1D1F),
        primary:  Color(0xFFE87169),
        secondary: Color(0xFFDE7973)
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFF1E1D1F),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color(0xFFFFFFFF)
        ),
        titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF))),
    cardTheme: const CardTheme(
      color: Color(0xFF2E2D2F),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF313034),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF282729),
    ),
    bottomAppBarColor: const Color(0xFF282729),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFF0F0F0),
      actionTextColor: Colors.red[700],
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF282729),
        indicatorColor: const Color(0xFF7E2B26),
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFFEEE4E3),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEEE4E3), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFF282729)));
