import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_images.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/core/widgets/mainbutton.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String path = '';
  var name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.bluecolor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sunny, color: AppColors.bluecolor),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.graycolor.withValues(alpha: 0.5),
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        Localhelper.getdata(Localhelper.KImage) != null
                        ? FileImage(
                            File(Localhelper.getdata(Localhelper.KImage)),
                          )
                        : AssetImage(AppImages.emusr),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MainButton(
                                  h: 57,
                                  title: 'Upload From Camera',
                                  ontap: () async {
                                    await upload(Iiscamera: true);
                                    Navigator.pop(context);
                                  },
                                ),
                                Gap(10),
                                MainButton(
                                  h: 57,
                                  title: 'Upload From Gallery',
                                  ontap: () async {
                                    await upload(Iiscamera: false);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      size: 35,
                      color: AppColors.bluecolor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(color: AppColors.bluecolor, endIndent: 35, indent: 35),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Localhelper.getdata(Localhelper.KName),
                    style: TextStyle(
                      color: AppColors.bluecolor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bluecolor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,

                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: name,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(20),
                                    MainButton(
                                      h: 57,
                                      title: 'Update Your Name',
                                      ontap: () {
                                        if (name.text.isNotEmpty) {
                                          Localhelper.putdata(
                                            Localhelper.KName,
                                            name.text,
                                          );
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit, color: AppColors.bluecolor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> upload({required bool Iiscamera}) async {
    XFile? file = await ImagePicker().pickImage(
      source: Iiscamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (file != null) {
      Localhelper.putdata(Localhelper.KImage, file.path); // حفظ الصورة
      setState(() {
        path = file.path;
      });
    }
  }
}
