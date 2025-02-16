import 'package:flutter/cupertino.dart';
import 'package:shophoria/core/colors_managers.dart';

class CustomOrText extends StatelessWidget {
  const CustomOrText({super.key, required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text("OR CONNECT USING",style: TextStyle(color: ColorsManagers.lightGray4,fontSize:fontSize ,fontWeight: FontWeight.bold),);
  }
}
