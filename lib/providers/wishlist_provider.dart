import 'package:flutter/cupertino.dart';
import 'package:shophoria/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  Map<String, WishlistModel> myWishList = {};

  Map<String, WishlistModel> get getWishListProducts {
    return myWishList;
  }

  void addOrRemovetoWishList({required String productId}) {
    if(myWishList.containsKey(productId)){
      myWishList.remove(productId);
      notifyListeners();
    }
    else{
      myWishList.putIfAbsent(productId,
              () => WishlistModel(wishlistId: Uuid().v4(), productId: productId));
      notifyListeners();
    }

  }

  void removeAllProducts(){
    myWishList.clear();
    notifyListeners();
  }
  bool isProductInWishList({required String productid}) {
    return myWishList.containsKey(productid);
  }
}
