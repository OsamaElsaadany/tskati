import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_fonts.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/core/utils/theme.dart';
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
    return ValueListenableBuilder(
      valueListenable: Localhelper.userbox.listenable(),
      builder: (context, Box, child) {
        bool isdark = Box.get(Localhelper.KIsdark) ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isdark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: apptheme.darktheme,
          theme: apptheme.lighttheme,
          home: Splash(),
        );
      },
    );
  }
}
