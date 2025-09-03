import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tskaty/core/constants/app_colors.dart';

class timeedit extends StatelessWidget {
  const timeedit({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
          DateTimeFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.access_time),
            ),
            mode: DateTimeFieldPickerMode.time,
            initialValue: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
