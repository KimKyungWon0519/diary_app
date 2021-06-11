import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  int colorCode;
  String content;

  ContentView(this.content, this.colorCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(colorCode),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Text(
          content,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
