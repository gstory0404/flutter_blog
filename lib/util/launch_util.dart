import 'package:url_launcher/url_launcher.dart';

/// @Author: gstory
/// @CreateDate: 2021/5/10 5:36 下午
/// @Description: dart类作用描述 

class LaunchUtil{
  static void launchUrl(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
