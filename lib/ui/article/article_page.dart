import 'package:blog/config/color.dart';
import 'package:blog/ui/article/article_controller.dart';
import 'package:blog/ui/article/widget/article_content.dart';
import 'package:blog/widget/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/10 3:52 下午
/// @Description: 文章详情页

class ArticlePage extends GetView<ArticleController> {
  @override
  final String tag = Get.parameters["id"]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          TitleBar.titleAppBar(
            titleContent: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: MyColor.mianColor,
              alignment: Alignment.center,
              child: Text(
                "字节跳动穿山甲广告 Flutter版本",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ArticleContent(),
          )
        ],
      ),
    );
  }
}
