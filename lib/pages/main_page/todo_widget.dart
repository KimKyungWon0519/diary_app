import 'package:diary/database/db_helper.dart';
import 'package:diary/database/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoWidget extends StatefulWidget {
  Todo todo;

  TodoWidget(this.todo);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  Todo todo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todo = widget.todo;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color(todo.colorCode)),
      ),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.clear == 1
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        leading: Icon(
          IconData(
            todo.iconCode,
            fontFamily: 'MaterialIcons',
          ),
        ),
        trailing: Checkbox(
          value: todo.clear == 1 ? true : false,
          onChanged: (value) {
            todo.clear = value ? 1 : 0;

            DBHelper().clearUpdate(todo.id, todo.clear);

            setState(() {});
          },
        ),
        onTap: () {
          Get.toNamed('/view', arguments: todo);
        },
      ),
    );
  }
}
