import 'package:flutter/material.dart';
import 'package:tskaty/core/constants/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.h,
    required this.title,
    required this.ontap,
  });

  final double h;
  final String title;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: h,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whitecolor,
          backgroundColor: AppColors.bluecolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: ontap,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
