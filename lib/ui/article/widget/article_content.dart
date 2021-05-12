import 'package:blog/ui/article/article_controller.dart';
import 'package:blog/util/launch_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/10 4:28 下午
/// @Description: dart类作用描述

class ArticleContent extends GetView<ArticleController> {
  @override
  final String tag = Get.parameters["id"]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthTransformer(reducedBy: 40),
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minWidth: 600,
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(
        () => MarkdownWidget(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          data: controller.data.value,
          styleConfig: StyleConfig(
            markdownTheme: Get.isDarkMode ? MarkdownTheme.darkTheme : MarkdownTheme.lightTheme,
            imgBuilder: (String url,attributes) {
              return Image.network(url);
            },
            pConfig: PConfig(
                linkGesture: (linkChild, url) {
                  return GestureDetector(
                    child: linkChild,
                    onTap: () {
                      var url1 = url ?? "";
                      LaunchUtil.launchUrl(url1);
                    },
                  );
                },
                selectable: false),
          ),
        ),
      ),
    );
  }
}
