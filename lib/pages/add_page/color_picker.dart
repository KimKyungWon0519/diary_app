import 'package:diary/controller/color_controller.dart';
import 'package:diary/pages/add_page/color_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorController controller = Get.put(ColorController());

    return Obx(
      () => ElevatedButton(
        child: Icon(
          Icons.color_lens_outlined,
          color: controller.color(controller.selectColor),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary:
              controller.selectColor == 0 ? Colors.black : Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ColorDialog(),
          );
        },
      ),
    );
  }
}
