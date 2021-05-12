import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/11 10:41 上午
/// @Description: 雪花飘落动画

class SnowflakePage extends StatefulWidget {
  const SnowflakePage({Key? key}) : super(key: key);

  @override
  _SnowflakePageState createState() => _SnowflakePageState();
}

//全局定义获取颜色的方法
Color getRandomWhiteColor(Random random) {
  //透明度 0 ~ 200  255是不透明
  int a = random.nextInt(200);
  return Color.fromARGB(a, 255, 255, 255);
}

///定义 雪花模型 用来保存雪花的基本属性信息
class BobbleBean {
  //位置
  Offset? postion;

  //初始位置
  Offset? origin;

  //颜色
  Color? color;

  //运动的速度
  double? speed;

  //半径
  double? radius;
}

///创建画布
class SnowCustomMyPainter extends CustomPainter {
  List<BobbleBean>? list = [];
  Random? random;

  SnowCustomMyPainter({this.list, this.random});

  //先来个画笔
  Paint _paint = new Paint()..isAntiAlias = true;

  //具体的绘制功能
  @override
  void paint(Canvas canvas, Size size) {
    // 在绘制前重新计算每个点的位置
    list?.forEach((element) {
      //左右微抖动
      double dx = random!.nextDouble() * 2.0 - 1.0;
      //竖直方向位置偏移
      double? dy = element.speed;
      //位置偏移量计算
      element.postion = element.postion! + Offset(dx, dy!);

      //重置位置
      if (element.postion!.dy > size.height) {
        element.postion = element.origin;
      }
    });
    //
    // //绘制
    list!.forEach((element) {
      //修改画笔的颜色
      _paint.color = element.color!;
      //绘制圆
      canvas.drawCircle(element.postion!, element.radius!, _paint);
    });
  }

  //刷新 控制
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //返回false 不刷新
    return true;
  }
}

class _SnowflakePageState extends State<SnowflakePage> with TickerProviderStateMixin{
  //创建一个集合用来保存气泡
  List<BobbleBean> _list = [];

  //随机数
  Random _random = new Random(DateTime.now().microsecondsSinceEpoch);

  //来个动画控制器
  late AnimationController _animationController;

  //初始化函数中创建气泡
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      initData();
    });

    //创建动画控制器 1秒
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));

    //执行刷新监听
    _animationController.addListener(() {
      setState(() {});
    });
    //开启气泡的运动
    _animationController.repeat();
  }

  void initData() {
    for (int i = 0; i < 100; i++) {
      BobbleBean bean = new BobbleBean();
      //获取随机透明度白色
      bean.color = getRandomWhiteColor(_random);
      //设置位置 先来个默认的 绘制的时候再修改
      double x = _random.nextDouble() * MediaQuery.of(context).size.width;
      double y = _random.nextDouble() * MediaQuery.of(context).size.height;
      double z = _random.nextDouble() + 0.5;
      bean.speed = _random.nextDouble() + 0.01 / z;
      bean.postion = Offset(x, y);
      bean.origin = Offset(x, 0);
      //设置半径
      bean.radius = 2.0 / z;
      _list.add(bean);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        //画布
        painter: SnowCustomMyPainter(list: _list, random: _random),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
