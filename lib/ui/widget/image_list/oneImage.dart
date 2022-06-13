import 'package:flutter/cupertino.dart';

class OneImage extends StatelessWidget {
  final String imageUrl;
  const OneImage({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        child: Image.network(imageUrl,fit: BoxFit.fill,),
      ),
    );
  }
}
