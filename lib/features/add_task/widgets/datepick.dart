import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tskaty/core/constants/app_colors.dart';

class datepick extends StatelessWidget {
  const datepick({
    super.key,
    required this.datecontorller,
  });

  final TextEditingController datecontorller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyle(
            color: AppColors.darkcolor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(7),
        TextFormField(
          controller: datecontorller,
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                var selected = await showDatePicker(
                  initialDate: DateTime.now(),
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2026),
                );
                if(selected != null){
                datecontorller.text = DateFormat('yyyy-MM-dd').format(selected);
                }
              },
              icon: Icon(
                Icons.calendar_month_outlined,
                color: AppColors.bluecolor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
