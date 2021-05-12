import 'package:blog/config/router.dart';
import 'package:blog/config/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyString.title,
      //路由
      defaultTransition: Transition.zoom,
      getPages: MyRouter.routes,
      initialRoute: MyRouter.index,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}