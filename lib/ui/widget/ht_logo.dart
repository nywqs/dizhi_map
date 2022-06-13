import 'package:flutter/cupertino.dart';

class Htlogo extends StatelessWidget {
  final double width, height;
  const Htlogo({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      width: width,
      height: height,
    );
  }
}
