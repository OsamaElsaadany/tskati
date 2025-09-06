import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_images.dart';
import 'package:tskaty/core/services/localhelper.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(Localhelper.getdata(Localhelper.KName) ?? 'User'),
                      Text(
                        'have a nice day',
                        style: TextStyle(
                          color: AppColors.darkcolor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        Localhelper.getdata(Localhelper.KImage) != null
                        ? FileImage(
                            File(Localhelper.getdata(Localhelper.KImage)),
                          )
                        : AssetImage(AppImages.emusr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
