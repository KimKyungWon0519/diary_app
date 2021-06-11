import 'package:diary/controller/icon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IconController controller = Get.put(IconController());

    return PopupMenuButton(
      onSelected: (index) {
        controller.selectIcon = index;
      },
      itemBuilder: (context) {
        return List.generate(
          controller.iconList.length,
          (index) => PopupMenuItem(
            value: index,
            child: Icon(controller.icon(index)),
          ),
        );
      },
      child: Obx(() => Icon(controller.icon(controller.selectIcon))),
    );
  }
}
