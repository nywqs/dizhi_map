import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dzmap/api/user.dart';

import '../../core/utils/sputils.dart';
import '../widget/ht_logo.dart';

//类似广告启动页
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Htlogo(
            width: 150,
            height: 150,
          ),
          Text(
            "航天危化品管控",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }

  //倒计时
  void countDown() {
    var _duration = const Duration(seconds: 5);
    Future.delayed(_duration, goHomePage);
  }

  //页面跳转
  void goHomePage() {
    getUserinfo(context);
    Get.offNamed(SPUtils.isLogined() ? '/home' : '/login');
  }
}
