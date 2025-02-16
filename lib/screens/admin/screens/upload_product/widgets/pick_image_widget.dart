import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/theme_provider.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var themeProvidr = Provider.of<ThemeProvivder>(context);
    return SizedBox(
      height:size.height *.2 ,width:size.width *.4 + 10 ,
      child: DottedBorder(color: themeProvidr.isDark ?Colors.white : Colors.black ,child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined,size: 80,color: Colors.blue,),
            TextButton(onPressed: onPressed, child: Text("Pick Product Image",style: TextStyle(color: Colors.blue),))
          ],
        ),
      )),
    );
  }
}
