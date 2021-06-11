import 'package:get/get.dart';

class DateController extends GetxController {
  var _date = DateTime.now().toString().split(' ')[0].obs;

  set date(newDate) => _date(newDate);
  get date => _date.value;
}
