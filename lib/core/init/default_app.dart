//默认App的启动
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../http/http.dart';
import '../router/route_map.dart';
import '../utils/ToastUtils.dart';
import '../utils/provider.dart';
import '../utils/sputils.dart';

class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    initFirst().then((value) => runApp(Store.init(ToastUtils.init(MyApp()))));
    initApp();
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  /// 必须要优先初始化的内容
  static Future<void> initFirst() async {
    await SPUtils.init();
  }

  /// 程序初始化操作
  static void initApp() {
    XHttp.init();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppTheme, LocaleModel>(
        builder: (context, appTheme, localeModel, _) {
      return GetMaterialApp(
        title: '航天危化品管理',
        theme: ThemeData(
          brightness: appTheme.brightness,
          primarySwatch: appTheme.themeColor,
          buttonColor: appTheme.themeColor,
        ),
        debugShowCheckedModeBanner: false,
        getPages: RouteMap.getPages,
        defaultTransition: Transition.rightToLeft,
        locale: localeModel.getLocale(),
      );
    });
  }
}
