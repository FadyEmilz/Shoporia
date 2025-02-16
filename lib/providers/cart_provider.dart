import 'package:flutter/cupertino.dart';
import 'package:shophoria/models/cart_model.dart';
import 'package:shophoria/models/product_model.dart';
import 'package:shophoria/providers/product_provider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> cartItems = {};

  Map get getCartItems {
    return cartItems;
  }

  void addProductToCart({required String productId}) {
    cartItems.putIfAbsent(productId,
        () => CartModel(productId, cartId: Uuid().v4(), Quantanty: 1));
    notifyListeners();
  }

  bool isProductInCart({required String productid}) {
    return cartItems.containsKey(productid);
  }

  void updatedQuantity({required String productId, required int quantity}) {
    cartItems.update(
        productId,
        (item) => CartModel(item.productId,
            cartId: item.cartId, Quantanty: quantity));
    notifyListeners();
  }
  double getTotal({required ProductProvider productProvider}){
    double total =0.0;
    for(var index in cartItems.values){
      final ProductModel? getcurrent = productProvider.findByProId(index.productId);
      if(getcurrent == null){
        total += 0;
      }
      else{
        total += double.parse(getcurrent.productPrice) * index.Quantanty;
      }
    }

    return total;
  }
  void removeOneItem({required String productId}){
    cartItems.remove(productId);
    notifyListeners();
  }
  void removeAllItems(){
    cartItems.clear();
    notifyListeners();
  }
  int getQuantitiy(){
    int total = 0;
    for(var index in cartItems.values){
      total += index.Quantanty;
    }
    return total;
  }
}
