import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:dzmap/ui/widget/list/cargo_place_item.dart';

class ApplyPage extends StatefulWidget {
  const ApplyPage({Key? key}) : super(key: key);

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  EasyRefreshController easyRefreshController = new EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  child: Container(
                    child: const TextField(
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        hintText: "请输入关键词/物料编码",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          /*边角*/
                          borderRadius: BorderRadius.all(
                            Radius.circular(5), //边角为5
                          ),
                          borderSide: BorderSide(
                            color: Colors.white, //边线颜色为白色
                            width: 0, //边线宽度为2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, //边框颜色为白色
                            width: 0, //宽度为5
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5), //边角为30
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                color: Colors.blue,
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: EasyRefresh.custom(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // 这里调用的是查询到的所有拥有该物料的所有货位
                  return InkWell(
                    child: const CargoPlaceItem(),
                    onTap: () {
                      Get.toNamed("/applydo");
                    },
                  );
                },
                // 设置返回数据个数
                childCount: 10,
              ),
            ),
          ],
          controller: easyRefreshController,
          header: ClassicalHeader(),
          footer: ClassicalFooter(),
        ))
      ],
    );
  }
}
