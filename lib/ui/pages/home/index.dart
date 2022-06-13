import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dzmap/ui/pages/public/scan.dart';
import 'package:scan/scan.dart';

import '../../../core/utils/iconfont.dart';
import '../../widget/grid/grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'Unknown';
  String qrcode = 'Unknown';
  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GridItem(
            title: actions[index].title,
            icon: actions[index].icon,
            onTap: () {
              if (index == 0) {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return ScanPage(scanCode: (qrCode) {
                    Get.toNamed('/qrcodeIn', arguments: {"qrcode": '$qrCode'});
                  });
                }));
              } else {
                Get.toNamed(actions[index].router);
              }
            },
          );
        },
        itemCount: 3,
      ),
    );
  }

  List<ActionItem> actions = [
    const ActionItem(
      "扫码入库",
      Icon(
        IconFontIcons.iconSaomiao,
        size: 50,
        color: Colors.blue,
      ),
      "/qrcodeIn",
    ),
    const ActionItem(
      "单品溯源",
      Icon(
        IconFontIcons.iconDingdansuyuan,
        size: 50,
        color: Colors.blue,
      ),
      "/qrcodeIn",
    ),
    const ActionItem(
      "使用登记",
      Icon(
        IconFontIcons.iconCangpeitubiao_churukumingxi,
        size: 50,
        color: Colors.blue,
      ),
      "/qrcodeIn",
    )
  ];
}
