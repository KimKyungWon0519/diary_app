import 'package:diary/pages/add_page/add_page.dart';
import 'package:diary/pages/main_page/main_page.dart';
import 'package:diary/pages/view_page/view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          backwardsCompatibility: false,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/view', page: () => ViewPage()),
        GetPage(name: '/add', page: () => AddPage()),
      ],
      home: MainPage(),
    );
  }
}
