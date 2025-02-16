import 'package:flutter/cupertino.dart';
import 'package:shophoria/models/view_pro_model.dart';
import 'package:uuid/uuid.dart';

class ViewProProvider with ChangeNotifier {
  Map<String, ViewProModel> myViewPro = {};

  void addviewedProduct({required String productId}) {
    myViewPro.putIfAbsent(productId,
        () => ViewProModel(viewproId: Uuid().v4(), productId: productId));
    notifyListeners();
  }
  void removeHistoy(){
    myViewPro.clear();
    notifyListeners();
  }
}
