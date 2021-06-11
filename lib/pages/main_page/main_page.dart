import 'package:diary/pages/main_page/calendar_view.dart';
import 'package:diary/pages/main_page/todo_view.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              CalendarView(),
              Expanded(
                child: TodoView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
