import 'package:flutter/cupertino.dart';
import 'package:shophoria/core/routes_managers.dart';

class AdminLoginController{
  Future<void> submetLogin(GlobalKey<FormState> mykey, BuildContext context) async {
    bool isValied = mykey.currentState!.validate();
    if(isValied){
      Navigator.pushNamed(context, RoutesNames.root);
    }
  }
}