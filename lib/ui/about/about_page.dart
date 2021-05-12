import 'package:blog/config/color.dart';
import 'package:blog/config/string.dart';
import 'package:blog/ui/classify/classify_controller.dart';
import 'package:blog/ui/classify/widget/classify_list.dart';
import 'package:blog/widget/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/12 7:27 下午
/// @Description: 关于我界面

class AboutPage extends GetView<ClassifyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          TitleBar.titleAppBar(
            titleContent: Container(
              color: MyColor.mianColor,
              alignment: Alignment.center,
              child: Text(
                MyString.about,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
