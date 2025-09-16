import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tskaty/core/constants/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:tskaty/core/constants/taskcolors.dart';
import 'package:tskaty/core/functions/navigation.dart';
import 'package:tskaty/core/models/task_model.dart';
import 'package:tskaty/core/services/localhelper.dart';
import 'package:tskaty/core/widgets/mainbutton.dart';
import 'package:tskaty/features/add_task/widgets/datepicker.dart';
import 'package:tskaty/features/home/pages/homescreen.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();
  var datecontorller = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  var ftcontroller = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  var ltcontroller = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );

  var formkey = GlobalKey<FormState>();

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pop(context, Homescreen());
          },
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.bluecolor),
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
        padding: const EdgeInsets.fromLTRB(18, 3, 18, 0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
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
                  controller: titlecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hint: Text(
                      'Enter title',
                      style: TextStyle(
                        color: AppColors.darkcolor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Gap(10),
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
                  controller: desccontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter describtion';
                    }
                    return null;
                  },
                  maxLines: 4,
                  textInputAction: TextInputAction.done,

                  decoration: InputDecoration(
                    hint: Text(
                      'Enter describtion',
                      style: TextStyle(
                        color: AppColors.darkcolor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                datepick(datecontorller: datecontorller),

                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: timeedit(context, 'Start Time', ftcontroller),
                    ),
                    Gap(10),
                    Expanded(
                      child: timeedit(context, 'End Time', ltcontroller),
                    ),
                  ],
                ),
                Gap(10),
                coloredit(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column coloredit(BuildContext context) {
    return Column(
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
          spacing: 7,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = index;
                });
              },
              child: CircleAvatar(
                backgroundColor: colorl[index],
                child: currentindex == index
                    ? Icon(Icons.check_outlined, color: AppColors.whitecolor)
                    : null,
              ),
            );
          }),
        ),
        Gap(11),
        MainButton(
          h: 55,
          title: 'Create task',
          ontap: () async {
            if (formkey.currentState!.validate()) {
              String id =
                  DateTime.now().millisecondsSinceEpoch.toString() +
                  titlecontroller.text;
              //save data
              await Localhelper.puttask(
                id,
                TaskModel(
                  id: id,
                  title: titlecontroller.text,
                  description: desccontroller.text,
                  date: datecontorller.text,
                  starttime: ftcontroller.text,
                  endtime: ltcontroller.text,
                  color: currentindex,
                  iscompleted: false,
                ),
              );
              pushandrm(context, Homescreen());
            }
          },
        ),
      ],
    );
  }

  Column timeedit(
    BuildContext context,
    String title,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.darkcolor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(7),
        TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                var selected = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selected != null) {
                  controller.text = selected.format(context);
                }
              },
              icon: Icon(
                Icons.watch_later_outlined,
                color: AppColors.bluecolor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
