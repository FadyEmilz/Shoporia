import 'package:flutter/cupertino.dart';
import 'package:shophoria/app/appWidgets/custom_sub_text.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required this.text, required this.subText});
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(alignment: Alignment.topLeft,child: CustomText(text: text, fontSize: 28)),
        Container(alignment: Alignment.topLeft,child: CustomSubText(text: subText, fontSize:15))
      ],
    );
  }
}
