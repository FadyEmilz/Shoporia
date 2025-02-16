import 'package:flutter/cupertino.dart';

class LableHomeText extends StatelessWidget {
  const LableHomeText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ));
  }
}
