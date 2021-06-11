import 'package:diary/controller/color_controller.dart';
import 'package:diary/controller/date_controller.dart';
import 'package:diary/controller/icon_controller.dart';
import 'package:diary/database/db_helper.dart';
import 'package:diary/database/todo.dart';
import 'package:diary/pages/add_page/color_picker.dart';
import 'package:diary/pages/add_page/icon_menu.dart';
import 'package:diary/pages/add_page/input_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          ColorPicker(),
          IconMenu(),
          Expanded(
            child: Container(),
          ),
          TextButton(
            onPressed: () => addTodo(),
            child: Text("완료"),
          )
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
          )
        ],
        color: Colors.white,
      ),
    );
  }

  addTodo() {
    ColorController colorController = Get.put(ColorController());
    IconController iconController = Get.put(IconController());
    DateController dateController = Get.put(DateController());

    Color color = colorController.color(colorController.selectColor);
    IconData iconData = iconController.icon(iconController.selectIcon);
    DBHelper().createData(
      Todo(
        title: titleController.text,
        content: contentController.text,
        colorCode: color.value,
        iconCode: iconData.codePoint,
        date: dateController.date,
      ),
    );

    Get.back();
  }
}
