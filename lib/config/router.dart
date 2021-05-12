import 'package:blog/ui/article/article_binding.dart';
import 'package:blog/ui/article/article_page.dart';
import 'package:blog/ui/home/index_binding.dart';
import 'package:blog/ui/home/index_page.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/7 3:35 下午
/// @Description: dart类作用描述 

class MyRouter {
  //主页
  static final index = "/";
  //文章详情
  static final article = "/article";

  static final routes = [
    //主页
    GetPage(
      name: index,
      page: () => IndexPage(),
      binding: IndexBinding(),
    ),
    //文章详情
    GetPage(
      name: article,
      page: () => ArticlePage(),
      binding: ArticleBinding(),
    ),
  ];
}