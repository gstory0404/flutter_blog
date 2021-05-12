import 'package:blog/config/color.dart';
import 'package:blog/config/string.dart';
import 'package:blog/ui/home/index_controller.dart';
import 'package:blog/ui/home/widget/index_list_item.dart';
import 'package:blog/widget/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/7 3:14 下午
/// @Description: 首页

class IndexPage extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          TitleBar.titleAppBar(
            isShowBack: false,
            titleContent: Container(
              color: MyColor.mianColor,
              alignment: Alignment.center,
              child: Text(
                MyString.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: IndexListItem(controller.lists[index]),
                  );
                },
                childCount: controller.lists.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
