import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/assets_managers.dart';
import '../../../core/routes_managers.dart';

class EmptyViewed extends StatelessWidget {
  const EmptyViewed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(height: 60,),
            Center(child: Image.asset(AssetsManagers.empty_search,height: 250,width: 250,)),
            SizedBox(height: 15,),
            Text("Whoops!",style: TextStyle(color: Colors.red,fontSize: 45,letterSpacing: 2),),
            SizedBox(height: 20,),
            Text("Your Wishlist is empty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),
            Text("Looks like you have not added anything to your cart, Go ahead and explore more catiguories",textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, RoutesNames.root);
            }, child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Shop Now",style: TextStyle(fontSize: 30),),
            ), style: ElevatedButton.styleFrom(),)
          ],
        ),
      ),
    );
  }
}
