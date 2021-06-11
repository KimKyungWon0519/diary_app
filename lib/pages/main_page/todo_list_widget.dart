import 'package:diary/database/db_helper.dart';
import 'package:diary/database/todo.dart';
import 'package:diary/pages/main_page/todo_widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  List todoList;

  TodoListWidget(this.todoList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (value) {
             DBHelper().deleteTodo(todoList[index].id);
          },
          child: TodoWidget(
              todoList[index],
          ),
        );
      },
      itemCount: todoList.length,
    );
  }
}
