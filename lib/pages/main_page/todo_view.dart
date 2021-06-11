import 'package:diary/controller/date_controller.dart';
import 'package:diary/database/db_helper.dart';
import 'package:diary/pages/main_page/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    final DateController controller = Get.put(DateController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${controller.date}')),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              DBHelper().deleteAll(controller.date);

              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Get.toNamed('/add', arguments: controller.date);
              setState(() {});
            },
          ),
        ],
      ),
      body: Obx(
        () => FutureBuilder(
          future: DBHelper().getTodoList(controller.date),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TodoListWidget(snapshot.data);
            } else {
              return Center(
                child: Text('데이터가 없습니다.'),
              );
            }
          },
        ),
      ),
    );
  }
}
