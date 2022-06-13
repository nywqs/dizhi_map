import 'package:flutter/cupertino.dart';

class ThreeImage extends StatelessWidget {
  final List<String> images;
  const ThreeImage({Key? key,required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        child: Row(
          children: [
            Expanded(child: Image.network(images[0],fit: BoxFit.fill,)),
            SizedBox(width: 5,),
            Expanded(child: Image.network(images[1],fit: BoxFit.fill,)),
            SizedBox(width: 5,),
            Expanded(child: Image.network(images[2],fit: BoxFit.fill,)),
          ],
        ),
      ),
    );
  }
}
