import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class InvisavleText extends StatelessWidget {
  const InvisavleText({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Visibility(
        visible: user == null ? true : false,
        child: Center(
            child: Text(
          "Please Login for ultimate access",
          style: GoogleFonts.fahkwang(
              textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          textAlign: TextAlign.center,
        )));
  }
}
