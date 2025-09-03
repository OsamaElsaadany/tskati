import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:tskaty/core/widgets/btn.dart';
import 'package:tskaty/features/add_task/widgets/timeedit.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          'Add Task',
          style: TextStyle(
            color: AppColors.bluecolor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  color: AppColors.darkcolor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(7),
              TextFormField(
                decoration: InputDecoration(
                  hint: Text(
                    'Enter title',
                    style: TextStyle(color: AppColors.darkcolor, fontSize: 15),
                  ),
                ),
              ),
              Gap(15),
              Text(
                'Describtion',
                style: TextStyle(
                  color: AppColors.darkcolor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(7),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hint: Text(
                    'Enter describtion',
                    style: TextStyle(color: AppColors.darkcolor, fontSize: 15),
                  ),
                ),
              ),
              Gap(15),
              Text(
                'Date',
                style: TextStyle(
                  color: AppColors.darkcolor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(7),
              DateTimeFormField(
                mode: DateTimeFieldPickerMode.date,
          
                initialValue: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 300)),
          
                dateFormat: DateFormat('dd-MM-yyyy'),
                onChanged: (DateTime? value) {},
              ),
              Gap(15),
              Row(
                children: [
                  timeedit(title: 'Start Time'),
                  Gap(13),
                  timeedit(title: 'End Time'),
                ],
              ),
              Gap(15),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Color',
                    style: TextStyle(
                      color: AppColors.darkcolor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(7),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bluecolor,
                      ),
                      Gap(10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.oracolor,
                      ),
                      Gap(10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.redcolor,
                      ),
                    ],
                  ),
              Gap(17),
                  btn(h: 57, title: 'Create task', ontap: (){})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
