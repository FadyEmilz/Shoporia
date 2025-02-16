import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.fontSize,this.textColor});
  final String text;
  final double fontSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.baloo2(
          textStyle:
              TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
    );
  }
}
