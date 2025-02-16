import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/appWidgets/custom_sub_text.dart';

class ForgotPassTextWidget extends StatelessWidget {
  const ForgotPassTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Forgot Passwoed",
              style: GoogleFonts.baloo2(
                  textStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ),
          CustomSubText(
              text:
                  "Please enter email address you would like password information reset sent to",
              fontSize: 15)
        ],
      ),
    );
  }
}
