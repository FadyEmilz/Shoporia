import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shophoria/core/theme_managers.dart';
import 'package:shophoria/providers/theme_provider.dart';

class ShimmerAppName extends StatelessWidget {
  const ShimmerAppName({super.key, required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvivder>(context);
    return Shimmer.fromColors(
      period: Duration(seconds: 10),
        child: Text("Shophoria",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold)),),
        baseColor: provider.isDark ? Colors.white : Colors.black,
        highlightColor: Colors.red);
  }
}
