import 'package:blog/ui/article/article_controller.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/7 3:37 下午
/// @Description: dart类作用描述 

class ArticleBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController(),tag: Get.parameters["id"]);
  }
}