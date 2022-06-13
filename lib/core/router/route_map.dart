import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/pages/apply/apply_do.dart';
import '../../ui/pages/index.dart';
import '../../ui/pages/public/login.dart';
import '../../ui/pages/qr/qrcode_in.dart';
import '../../ui/pages/qr/qrcode_out.dart';
import '../../ui/pages/splash.dart';

class RouteMap {
  static List<GetPage> getPages = [
    GetPage(name: '/', page: () => SplashPage()),
    GetPage(name: '/home', page: () => const MainHomePage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/applydo', page: () => const ApplyDoPage()),
    GetPage(name: '/qrcodeIn', page: () => const QrcodeInPage()),
    GetPage(name: '/qrcodeOut', page: () => const QrcodeOutPage()),
  ];

  /// 页面切换动画
  static Widget getTransitions(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
              //1.0为右进右出，-1.0为左进左出
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }
}
