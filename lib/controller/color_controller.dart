import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ColorController extends GetxController {
  List _colorList = [
    Colors.white,
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];
  RxInt _selectColor = 0.obs;

  color(index) => _colorList[index];

  get colorList => _colorList;

  get selectColor => _selectColor.value;
  set selectColor(index) => _selectColor(index);
}
