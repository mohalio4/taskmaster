import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.purple1,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 14),
  ),
);
