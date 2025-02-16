import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shophoria/core/assets_managers.dart';

class CustomRowTile extends StatelessWidget {
  const CustomRowTile({super.key, required this.imgURL, required this.text,required this.onClick});
  final String imgURL;
  final String text;
  final GestureTapCallback? onClick;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: onClick ,
        leading: Container(width: 35,height: 35,child: Image.asset(imgURL,fit: BoxFit.fill,)),
        title: Text(text),
        trailing: Icon(IconlyLight.arrowRight2),

      ),
    );
  }
}
