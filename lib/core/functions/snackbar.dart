import 'package:flutter/material.dart';
import 'package:tskaty/core/constants/app_colors.dart';

void messegeusr(BuildContext context, String messege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          messege,
          style: TextStyle(color: AppColors.redcolor, fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.darkcolor,
        margin: EdgeInsets.all(20.0),
        elevation: 0,
      ),
    );
  }