import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialItem extends StatelessWidget {
  const MaterialItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  const Text(
                    "磷酸钠",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 10,
                      ),
                      color: Colors.red,
                      child: const Text(
                        "易制爆",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: Row(
                      children: const [
                        Text("库存量："),
                        Text(
                          "20",
                          style: TextStyle(color: Colors.amber),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    child: Container(
                      child: Text("规格：200ml"),
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ClipRRect(
                    child: Container(
                      child: Text("纯度：200ml"),
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              child: Container(
                child: const Text("仓库：200ml"),
                color: Colors.grey.shade300,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    child: Container(
                      child: const Text("货架：200ml"),
                      color: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ClipRRect(
                    child: Container(
                      child: const Text("仓储位：200ml"),
                      color: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: Text(
                "去申领",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
