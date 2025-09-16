import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_images.dart';
import 'package:tskaty/core/functions/navigation.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/features/home/pages/homescreen.dart';
import 'package:tskaty/features/uploadScreen/uploadScreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    bool isuploaded = Localhelper.getdata('isuploaded') ?? false;
    Future.delayed(Duration(seconds: 5), () {
      isuploaded == true
          ? pushrplc(context, Homescreen())
          : pushrplc(context, Upload());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.tasksplash),
            Gap(20),
            Text(
              'Taskati',
              style: TextStyle(color: AppColors.darkcolor, fontSize: 24),
            ),
            Gap(15),
            Text(
              'It\'s Time To Get Organized',
              style: TextStyle(color: AppColors.graycolor, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
