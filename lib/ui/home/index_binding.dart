import 'package:blog/ui/home/index_controller.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/7 3:37 下午
/// @Description: dart类作用描述 

class IndexBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => IndexController());
  }
}