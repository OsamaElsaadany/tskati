import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_fonts.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/features/splash/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Localhelper.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whitecolor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.whitecolor,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
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
      ),
      home: Splash(),
    );
  }
}
