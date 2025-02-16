import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  CartModel(this.productId,
      {required this.cartId,
      required this.Quantanty});

  final String cartId,productId; int Quantanty;

}