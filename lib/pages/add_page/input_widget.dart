import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  String hintText;
  int maxLines, maxLength;
  TextEditingController controller;

  InputWidget(this.hintText, {this.maxLines, this.controller, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        hintText: this.hintText,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      maxLines: this.maxLines,
      maxLength: this.maxLength,
    );
  }
}
