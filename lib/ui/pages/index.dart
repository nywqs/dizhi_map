import 'package:dzmap/ui/pages/apply/index.dart';
import 'package:flutter/material.dart';
import 'package:dzmap/ui/pages/home/index.dart';
import 'package:dzmap/ui/pages/profile/index.dart';
import 'package:provider/provider.dart';

import '../../core/utils/click.dart';
import '../../core/utils/provider.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        const BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
        const BottomNavigationBarItem(label: "申领", icon: Icon(Icons.list)),
        const BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
      ];

  List<Widget> getTabWidget(BuildContext context) => [
        const HomePage(),
        const ApplyPage(),
        const ProfilePage(),
      ];
  @override
  Widget build(BuildContext context) {
    var tabs = getTabs(context);
    return Consumer(
        builder: (BuildContext context, AppStatus status, Widget? child) {
      return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.lightBlue,
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              tabs[status.tabIndex].label.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            elevation: 0,
          ),
          body: IndexedStack(
            index: status.tabIndex,
            children: getTabWidget(context),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: tabs,
            //高亮  被点击高亮
            currentIndex: status.tabIndex,
            //修改 页面
            onTap: (index) {
              status.tabIndex = index;
            },
            type: BottomNavigationBarType.fixed,
            fixedColor: Theme.of(context).primaryColor,
          ),
        ),

        //监听导航栏返回,类似onKeyEvent
        onWillPop: () =>
            ClickUtils.exitBy2Click(status: _scaffoldKey.currentState),
      );
    });
  }
}
