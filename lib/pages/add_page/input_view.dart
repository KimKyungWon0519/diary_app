import 'package:diary/pages/add_page/input_widget.dart';
import 'package:flutter/material.dart';

TextEditingController titleController, contentController;

class InputView extends StatelessWidget {
  String title, content;

  InputView({this.title = null, this.content = null});

  @override
  Widget build(BuildContext context) {
    titleController = TextEditingController(text: title);
    contentController = TextEditingController(text: content);

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputWidget(
            '제목',
            controller: titleController,
            maxLength: 20,
          ),
          Expanded(
            child: InputWidget(
              '내용',
              maxLines: 10000,
              controller: contentController,
            ),
          ),
        ],
      ),
    );
  }
}
