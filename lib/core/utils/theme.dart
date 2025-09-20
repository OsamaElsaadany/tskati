import 'package:flutter/material.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_fonts.dart';

class apptheme {
  static get darktheme => ThemeData(
    scaffoldBackgroundColor: AppColors.darkcolor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkcolor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.bluecolor,
      onSurface: AppColors.whitecolor,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.darkcolor,
      headerForegroundColor: AppColors.bluecolor,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.darkcolor,
      dialBackgroundColor: AppColors.darkcolor,
      dayPeriodColor: AppColors.whitecolor,
      dayPeriodTextColor: AppColors.bluecolor
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color.fromARGB(95, 37, 33, 33)
    )
    ,fontFamily: AppFonts.poppinsfamily,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.graycolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.bluecolor),
      ),
    ),
  );
  static get lighttheme => ThemeData(
    scaffoldBackgroundColor: AppColors.whitecolor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whitecolor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.bluecolor,
      onSurface: AppColors.darkcolor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.whitecolor
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.whitecolor,
      headerForegroundColor: AppColors.bluecolor,
    ),
     timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.whitecolor,
    ),
    fontFamily: AppFonts.poppinsfamily,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.graycolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.bluecolor),
      ),
    ),
  );
}
