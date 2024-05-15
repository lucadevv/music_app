import 'package:flutter/material.dart';
import 'package:music_app/shared/const/app_color.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'opensans',
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    background: AppColors.black,
  ),
  textTheme: TextTheme(
    displaySmall: const TextStyle().copyWith(
      fontSize: 10,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.greyTown,
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: 16,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
  ),
);
