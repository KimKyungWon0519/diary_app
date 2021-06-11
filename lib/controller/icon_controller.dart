import 'package:get/get.dart';
import 'package:flutter/material.dart';

class IconController extends GetxController {
  List _iconList = [
    Icons.sentiment_very_satisfied,
    Icons.sentiment_satisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_very_dissatisfied,
    Icons.thumb_up,
    Icons.thumb_down,
  ];
  RxInt _selectIcon = 0.obs;

  icon(index) => _iconList[index];

  get iconList => _iconList;

  get selectIcon => _selectIcon.value;
  set selectIcon(index) => _selectIcon(index);
}
