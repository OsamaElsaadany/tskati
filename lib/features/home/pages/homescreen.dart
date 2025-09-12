import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_images.dart';
import 'package:tskaty/core/functions/navigation.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/core/widgets/btn.dart';
import 'package:tskaty/features/add_task/pages/add_task.dart';

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
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Hello, ' + Localhelper.getdata(Localhelper.KName),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bluecolor,
                        ),
                      ),
                      Text(
                        'Have a Nice day',
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
              Gap(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('yMMMMd').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkcolor,
                        ),
                      ),
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkcolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                    child: btn(
                      h: 45,
                      title: '+ Add Task',
                      ontap: () {
                        pushto(context, AddTask());
                      },
                    ),
                  ),
                ],
              ),
              Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    height: 90,
                    width: 68,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.bluecolor,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      // setState(() {
                      //   _selectedValue = date;
                      // });
                    },
                  ),
                ],
              ),
              Gap(30),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.bluecolor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'data',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whitecolor,
                                  ),
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColors.whitecolor,
                                    ),
                                    Gap(5),
                                    Text(
                                      DateFormat(
                                        'hh:mm a',
                                      ).format(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whitecolor,
                                      ),
                                    ),
                                    Gap(10),
                                    Text(
                                      DateFormat(
                                        'hh:mm a',
                                      ).format(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whitecolor,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  'data',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whitecolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: AppColors.whitecolor,
                              thickness: 1,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'To Do',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whitecolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(7);
                  },
                  itemCount: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
