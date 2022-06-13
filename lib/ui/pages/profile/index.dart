import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htwms/core/utils/sputils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "1231312",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "河南航天精工制造有限公司",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                            Text("全部")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                            Text("审批中")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                            Text("已完成")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                            Text("已取消")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              SPUtils.logout();
              if (!SPUtils.isLogined()) {
                Get.offNamed("/login");
              }
            },
            child: Text("退出登陆"),
          )
        ],
      ),
    );
  }
}
