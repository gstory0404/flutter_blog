import 'package:blog/config/color.dart';
import 'package:blog/config/router.dart';
import 'package:blog/config/string.dart';
import 'package:blog/util/launch_util.dart';
import 'package:blog/widget/snowflake_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/10 6:10 下午
/// @Description: 头部标题栏

class TitleBar {
  static SliverAppBar titleAppBar(
      {bool isShowBack = true, Widget? titleContent}) {
    return SliverAppBar(
      automaticallyImplyLeading: isShowBack,
      title: Text(
        MyString.title,
        style: TextStyle(fontSize: 30),
      ),
      backgroundColor: MyColor.mianColor,
      floating: false,
      pinned: true,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            titleContent!,
            SnowflakePage(),
          ],
        ),
      ),
      actions: Get.context!.isPhone ? phoneActions() : webActions(),
    );
  }

  static List<Widget> webActions() {
    return [
      TextButton(
        onPressed: () {
          Get.toNamed(MyRouter.index);
        },
        child: Text(
          MyString.home,
          style: TextStyle(
            color: MyColor.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          MyString.classify,
          style: TextStyle(
            color: MyColor.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          MyString.about,
          style: TextStyle(
            color: MyColor.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        },
        child: Text(
          Get.isDarkMode ? MyString.dark : MyString.light,
          style: TextStyle(
            color: MyColor.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          LaunchUtil.launchUrl(MyString.gitUrl);
        },
        child: Text(
          MyString.git,
          style: TextStyle(
            color: MyColor.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
    ];
  }

  static List<Widget> phoneActions() {
    return [
      PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            child: Text(
              MyString.home,
              style: TextStyle(
                color: MyColor.blackColor,
                fontSize: 16,
              ),
            ),
            value: 'home',
          ),
          PopupMenuItem<String>(
            child: Text(
              MyString.classify,
              style: TextStyle(
                color: MyColor.blackColor,
                fontSize: 16,
              ),
            ),
            value: 'classify',
          ),
          PopupMenuItem<String>(
            child: Text(
              MyString.about,
              style: TextStyle(
                color: MyColor.blackColor,
                fontSize: 16,
              ),
            ),
            value: 'about',
          ),
          PopupMenuItem<String>(
            child: Text(
              Get.isDarkMode ? MyString.dark : MyString.light,
              style: TextStyle(
                color: MyColor.blackColor,
                fontSize: 16,
              ),
            ),
            value: 'theme',
          ),
          PopupMenuItem<String>(
            child: Text(
              MyString.git,
              style: TextStyle(
                color: MyColor.blackColor,
                fontSize: 16,
              ),
            ),
            value: 'git',
          ),
        ],
        onSelected: (String action) {
          switch (action) {
            case "home":
              Get.toNamed(MyRouter.index);
              break;
            case "classify":
              print("添加朋友");
              break;
            case "about":
              print("扫一扫");
              break;
            case "theme":
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              break;
            case "git":
              LaunchUtil.launchUrl(MyString.gitUrl);
              break;
          }
        },
      ),
    ];
  }
}
