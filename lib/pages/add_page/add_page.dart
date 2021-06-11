import 'package:diary/database/todo.dart';
import 'package:diary/pages/add_page/bottom_bar.dart';
import 'package:diary/pages/add_page/input_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  //Todo todo = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.arguments}'),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: InputView(
                //title: todo.title,
                //content: todo.content,
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
