import 'dart:io';

import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  dividerColor: CustomColors.third.color,
  primaryColor: CustomColors.primary.color,
  switchTheme:
      SwitchThemeData(thumbColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return CustomColors.accent.color;
    } else {
      return CustomColors.white.color;
    }
  })),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: CustomColors.primary.color),
    headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: CustomColors.primary.color),
    headlineSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: CustomColors.primary.color),
    bodyMedium: TextStyle(fontSize: 13, color: CustomColors.primary.color),
    bodyLarge: TextStyle(
        fontSize: 15,
        color: CustomColors.primary.color), // default of Text widget
    bodySmall: TextStyle(fontSize: 13, color: CustomColors.secondary.color),
  ),
  tabBarTheme: TabBarTheme(
      labelColor: CustomColors.accent.color,
      unselectedLabelColor: CustomColors.primary.color),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: CustomColors.white.color,
    selectedItemColor: CustomColors.accent.color,
    unselectedItemColor: CustomColors.secondary.color,
  ),
  primaryIconTheme: IconThemeData(color: CustomColors.secondary.color),
  highlightColor: CustomColors.accent.color.withOpacity(0.05),
  splashColor: CustomColors.accent.color.withOpacity(0.1),
  appBarTheme: AppBarTheme(
      elevation: (Platform.isIOS) ? 1 : 3,
      titleTextStyle:
          TextStyle(color: CustomColors.primary.color, fontSize: 20),
      color: CustomColors.white.color,
      iconTheme: IconThemeData(color: CustomColors.secondary.color)),
  indicatorColor: CustomColors.accent.color,
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: CustomColors.accent.color,
      selectionColor: CustomColors.accent.color.withOpacity(0.2),
      selectionHandleColor: CustomColors.accent.color),
  checkboxTheme:
      CheckboxThemeData(fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return CustomColors.accent.color;
    } else if (states.contains(MaterialState.disabled)) {
      return CustomColors.fade.color;
    } else {
      return CustomColors.white.color;
    }
  })),
);

final ButtonStyle errorColorTextButtonTheme = ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return CustomColors.errorEffect.color;
      } else {
        return null;
      }
    }),
    foregroundColor: MaterialStateProperty.resolveWith(
        (states) => CustomColors.error.color));

enum CustomColors {
  primary,
  secondary,
  third,
  accent,
  accentSecondary,
  error,
  errorEffect,
  errorScondary,
  electricity,
  electricitySecondary,
  electricityHighlight,
  heat,
  heatSecondary,
  gas,
  gasSecondary,
  fade,
  white;

  static final _color = {
    CustomColors.primary: const Color(0xFF383229),
    CustomColors.secondary: const Color(0xFF84817F),
    CustomColors.third: const Color(0xFFCDCCCC),
    CustomColors.accent: const Color(0xFF2D67D9),
    CustomColors.accentSecondary: const Color(0xFFE4F3FC),
    CustomColors.error: const Color(0xFFE73131),
    CustomColors.errorEffect: const Color(0x33E73131),
    CustomColors.errorScondary: const Color(0xFFFDEAEA),
    CustomColors.electricity: const Color(0xFFFFE39A),
    CustomColors.electricitySecondary: const Color(0xFFFEF0D6),
    CustomColors.electricityHighlight: const Color(0xFFF2994A),
    CustomColors.heat: const Color(0xFFFAAFAF),
    CustomColors.heatSecondary: const Color(0xFFFACFCF),
    CustomColors.gas: const Color(0xFF82C6FD),
    CustomColors.gasSecondary: const Color(0xFFD6ECFD),
    CustomColors.fade: const Color(0xFFF4F2F0),
    CustomColors.white: const Color(0xFFFFFFFF),
  };

  Color get color => _color[this] ?? const Color(0xFF383229);
}
