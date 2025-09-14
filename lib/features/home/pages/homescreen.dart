import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:tskaty/core/constants/app_images.dart';
import 'package:tskaty/core/constants/taskcolors.dart';
import 'package:tskaty/core/functions/navigation.dart';
import 'package:tskaty/core/models/task_model.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/core/widgets/btn.dart';
import 'package:tskaty/features/add_task/pages/add_task.dart';
import 'package:tskaty/features/editprofile/pages/edit.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String selecteddate = DateFormat('yyyy-MM-dd').format(DateTime.now());
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
                  GestureDetector(
                    onTap: () async {
                      final updated = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Edit()),
                      );

                      if (updated == true) {
                        setState(() {});
                      }
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          Localhelper.getdata(Localhelper.KImage) != null
                          ? FileImage(
                              File(Localhelper.getdata(Localhelper.KImage)),
                            )
                          : AssetImage(AppImages.emusr) as ImageProvider,
                    ),
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
                      setState(() {
                        selecteddate = DateFormat('yyyy-MM-dd').format(date);
                      });
                    },
                  ),
                ],
              ),
              Gap(30),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Localhelper.taskbox.listenable(),
                  builder: (context, box, child) {
                    List<TaskModel> filteredTasks = [];
                    for (var element in box.values) {
                      if (element.date == selecteddate)
                        filteredTasks.add(element);
                    }

                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return itembuilder(model: filteredTasks[index]);
                      },
                      separatorBuilder: (context, index) => Gap(7),
                      itemCount: filteredTasks.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class itembuilder extends StatelessWidget {
  const itembuilder({super.key, required this.model});
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorl[model.color ?? 0],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.title ?? '',
                  style: TextStyle(
                    fontSize: 20,
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
                      model.starttime ??
                          DateFormat('hh:mm a').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whitecolor,
                      ),
                    ),
                    Gap(7),
                    Text(
                      model.endtime ??
                          DateFormat('hh:mm a').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whitecolor,
                      ),
                    ),
                  ],
                ),
                Gap(5),
                Text(
                  maxLines: 2,
                  (model.description?.isEmpty == true)
                      ? '----'
                      : model.description ?? '',
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
            child: VerticalDivider(color: AppColors.whitecolor, thickness: 1),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              model.iscompleted == true ? 'COMPLETED' : 'TODO',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.whitecolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
