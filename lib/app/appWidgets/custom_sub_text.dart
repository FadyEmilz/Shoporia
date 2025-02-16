import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubText extends StatelessWidget {
  const CustomSubText({super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.baloo2(
          textStyle:
              TextStyle(fontSize: fontSize, )),
    );
  }
}
