import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_images.dart';
import 'package:tskaty/core/functions/navigation.dart';
import 'package:tskaty/core/functions/snackbar.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/core/widgets/mainbutton.dart';
import 'package:tskaty/features/home/pages/homescreen.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String path = '';
  var name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path.isNotEmpty && name.text.isNotEmpty) {
                Localhelper.putuserdate(path, name.text);
                pushandrm(context, Homescreen());
              } else if (path.isEmpty && name.text.isNotEmpty) {
                messegeusr(context, 'Please , upload an image');
              } else if (path.isNotEmpty && name.text.isEmpty) {
                messegeusr(context, 'Please, Enter your name');
              } else {
                messegeusr(
                  context,
                  'Please, Upload an image and Enter your name',
                );
              }
            },
            child: Text(
              'Done',
              style: TextStyle(
                color: AppColors.bluecolor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.bluecolor,
                  backgroundImage: path.isNotEmpty
                      ? FileImage(File(path))
                      : AssetImage(AppImages.emusr),
                ),
                Gap(15),
                SizedBox(
                  width: 280,
                  child: Column(
                    children: [
                      MainButton(
                        h: 57,
                        title: 'Upload From Camera',
                        ontap: () async {
                          await upload(Iiscamera: true);
                        },
                      ),
                      Gap(10),
                      MainButton(
                        h: 57,
                        title: 'Upload From Gallery',
                        ontap: () async {
                          await upload(Iiscamera: false);
                        },
                      ),
                    ],
                  ),
                ),
                Gap(15),
                Divider(indent: 30, endIndent: 30),
                Gap(15),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hint: Text(
                      'Enter Your Name',
                      style: TextStyle(color: AppColors.darkcolor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> upload({required bool Iiscamera}) async {
    XFile? file = await ImagePicker().pickImage(
      source: Iiscamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (file != null) {
      setState(() {
        path = file.path;
      });
    }
  }
}
