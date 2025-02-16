import 'package:flutter/cupertino.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/core/routes_managers.dart';

class SingleCategoryWidget extends StatelessWidget {
  const SingleCategoryWidget({super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(image,width: 50,height: 50,),
          ),
          SizedBox(height: 8,),
          Text(text,style: TextStyle(fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
