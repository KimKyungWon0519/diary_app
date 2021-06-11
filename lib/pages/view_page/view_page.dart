import 'package:diary/database/todo.dart';
import 'package:diary/pages/view_page/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Todo todo = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(todo.title),
            SizedBox(
              width: 10,
            ),
            Icon(
              IconData(todo.iconCode, fontFamily: 'MaterialIcons'),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.create),
            onPressed: () {
              Get.toNamed(
                '/add',
                arguments: [todo.date, todo],
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ContentView(
                todo.content,
                todo.colorCode,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              todo.date,
            ),
          ],
        ),
      ),
    );
  }
}
