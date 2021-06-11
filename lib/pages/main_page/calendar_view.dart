import 'package:diary/controller/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int count = 0;

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateController controller = Get.put(DateController());

    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2900),
      onDateChanged: (value) {
        controller.date = value.toString().split(' ')[0];
      },
      currentDate: DateTime.now(),
    );
  }
}
