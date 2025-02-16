import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/assets_managers.dart';

class ImagePickDialog{
  Future<void> showWoring({required BuildContext context,required VoidCallback cameraPressed,required VoidCallback galeeryPressed,required VoidCallback removePressed,required String text}) async{

    await showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: SizedBox(
          width: 250,height: 250,
          child: Container(


            child: Column(


              children: [
                SizedBox(height: 20,),
                Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 35,),
                InkWell(
                  onTap: cameraPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera,size: 40,),SizedBox(width: 10,),Text("Camera",style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: galeeryPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image,size: 40,),SizedBox(width: 10,),Text("Gallery",style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: removePressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove,size: 40,color: Colors.red,),SizedBox(width: 10,),Text("Remove",style: TextStyle(fontSize: 17),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),);
    });
  }
}