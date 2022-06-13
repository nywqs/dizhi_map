import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dzmap/ui/pages/apply/widget/cargo_place_info.dart';

import '../../../core/utils/iconfont.dart';

class ApplyDoPage extends StatefulWidget {
  const ApplyDoPage({Key? key}) : super(key: key);

  @override
  State<ApplyDoPage> createState() => _ApplyDoPageState();
}

class _ApplyDoPageState extends State<ApplyDoPage> {
  final String num = "10";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text(
          "申领",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            const CargoPlaceInfo(),
            Container(
              alignment: Alignment.centerLeft,
              height: 30,
              padding: const EdgeInsets.only(left: 5),
              child: const Text(
                "申领用途",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: "请输入用途",
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
            Expanded(child: Container()),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: const [
                                Icon(
                                  IconFontIcons.iconJingxihuaxuepin,
                                  color: Colors.lightBlue,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: "共计: "),
                                      TextSpan(
                                        text: "10",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      TextSpan(text: "  件 "),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.blue,
                          child: const Text(
                            "立即申领",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
