import 'package:blog/config/color.dart';
import 'package:blog/config/router.dart';
import 'package:blog/entity/classify_entity.dart';
import 'package:blog/entity/index_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/10 3:07 下午
/// @Description: 首页列表item

class ClassifyListItem extends GetView {

  ClassifyDataList _classifyDataList;

  ClassifyListItem(this._classifyDataList);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(
            MyRouter.article + "?id=${_classifyDataList.id}",
            preventDuplicates: false);
      },
      child: Container(
        child: Card(
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _classifyDataList.title!,
                  style: TextStyle(color: MyColor.blackColor, fontSize: 24),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        _classifyDataList.image!,
                        width: 100,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10,top: 10),
                          child: Text(
                            _classifyDataList.content!,
                            style:
                            TextStyle(color: MyColor.greyColor, fontSize: 16),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
