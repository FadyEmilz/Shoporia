import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key, required this.fontSize,required this.onTap, required this.text});
  final double fontSize;
  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,child: Text(text, style: GoogleFonts.baloo2(textStyle: TextStyle(fontSize: fontSize,decoration: TextDecoration.underline)),));
  }
}
