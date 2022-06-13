import 'package:flutter/material.dart';

/// 列表项
class GridItem extends StatelessWidget {
  // 文字
  final String title;
  // 颜色
  final Icon icon;
  //是否可点击
  final bool enabled;
  //点击事件
  final GestureTapCallback onTap;

  // 构造函数
  const GridItem(
      {Key? key,
      required this.title,
      required this.icon,
      this.enabled = true,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Card(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              icon,
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(title),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionItem {
  final String title;
  final Icon icon;
  final String router;
  const ActionItem(this.title, this.icon, this.router);
}
