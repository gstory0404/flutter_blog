import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/7 3:39 下午
/// @Description: dart类作用描述

class ArticleController extends GetxController {
  var data = "".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async{
    data.value =  await rootBundle.loadString('assets/test.md');
  }
}
