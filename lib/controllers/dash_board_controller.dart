import 'package:flutter/cupertino.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/core/strings_managers.dart';

class DashBoardController{
  Map<String,String> myDashlist = {
    StringsManagers.uploadProducts : AssetsManagers.dash_cloud,
    StringsManagers.inspectProducts : AssetsManagers.shopping_cart,
    StringsManagers.viewOrders : AssetsManagers.dash_order,
  };

  void setNavigators({required String text, required BuildContext context}){
    if(text == StringsManagers.uploadProducts){
      Navigator.pushNamed(context, RoutesNames.uploadProduct);
    }
    else if(text == StringsManagers.inspectProducts){
      Navigator.pushNamed(context, RoutesNames.adminSearch);
    }
    else if(text == StringsManagers.viewOrders){
      Navigator.pushNamed(context, RoutesNames.adminViewAllOrders);
    }
    else{
      print("Nothing");
    }
  }
}