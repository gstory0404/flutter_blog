import 'package:blog/config/color.dart';
import 'package:blog/entity/classify_entity.dart';
import 'package:blog/ui/classify/widget/classify_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/12 7:31 下午
/// @Description: dart类作用描述

class ClassifyList extends GetView {
  ClassifyData _classifyData;

  ClassifyList(this._classifyData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthTransformer(reducedBy: 30),
      constraints: BoxConstraints(
        minWidth: 500,
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
            child: Text(
              _classifyData.date!,
              style: TextStyle(
                fontSize: 24,
                color: MyColor.blackColor,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _classifyData.xList!.length,
              itemBuilder: (context, index) {
                return ClassifyListItem(_classifyData.xList![index]);
              })
        ],
      ),
    );
  }
}
