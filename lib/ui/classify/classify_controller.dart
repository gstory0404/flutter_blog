import 'dart:convert';

import 'package:blog/entity/classify_entity.dart';
import 'package:blog/entity/index_entity.dart';
import 'package:blog/generated/json/base/json_convert_content.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

/// @Author: gstory
/// @CreateDate: 2021/5/7 3:39 下午
/// @Description: dart类作用描述

class ClassifyController extends GetxController {
  RxList lists = [].obs;

  @override
  void onInit() {
    super.onInit();
    rootBundle.loadString('json/classify.json').then(
      (value) {
        ClassifyEntity classifyEntity =
            ClassifyEntity().fromJson(convert.jsonDecode(value));
        lists.value = classifyEntity.data!;
      },
    );
  }
}
