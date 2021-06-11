import 'package:diary/controller/color_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorController controller = Get.put(ColorController());

    return Dialog(
      child: Container(
        height: 250,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.selectColor = index;
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: controller.color(index),
                ),
              ),
            );
          },
          itemCount: controller.colorList.length,
        ),
      ),
    );
  }
}
