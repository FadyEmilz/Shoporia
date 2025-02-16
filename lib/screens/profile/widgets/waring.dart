import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/assets_managers.dart';

class Waring{
  Future<void> showWoring({required BuildContext context,required VoidCallback okPressed,required VoidCallback noPressed,required String text}) async{

    await showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 100,child: Image.asset(AssetsManagers.warning,width: 60,height: 60,)),
            Text(text),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: noPressed, child: Text("No")),
                TextButton(onPressed: okPressed, child: Text("Yes")),
              ],
            )
          ],
        ),);
    });
  }
}