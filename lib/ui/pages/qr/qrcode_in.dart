import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:dzmap/core/utils/iconfont.dart';

import '../../widget/list/material_item.dart';

class QrcodeInPage extends StatefulWidget {
  final arguments;
  const QrcodeInPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<QrcodeInPage> createState() => _QrcodeInPageState();
}

class _QrcodeInPageState extends State<QrcodeInPage> {
  final TextEditingController placeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    placeController.text = Get.arguments['qrcode'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("扫码入库"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: placeController,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: Icon(IconFontIcons.iconSaomiao),
                hintText: "请输入库位编号",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  /*边角*/
                  borderRadius: BorderRadius.all(
                    Radius.circular(5), //边角为5
                  ),
                  borderSide: BorderSide(
                    color: Colors.white, //边线颜色为白色
                    width: 1, //边线宽度为2
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, //边框颜色为白色
                    width: 1, //宽度为5
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5), //边角为30
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: EasyRefresh.custom(slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // 这里为iOS UITableViewCell （android的adapter）,样式大家自定义即可
                    return InkWell(
                      child: const MaterialItem(),
                      onTap: () {
                        Get.toNamed("/applydo");
                      },
                    );
                  },
                  // 设置返回数据个数
                  childCount: 10,
                ),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                color: Colors.blue,
                child: const Text(
                  "扫码入库",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
