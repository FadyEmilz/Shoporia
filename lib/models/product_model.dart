import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  final String productID,
      productName,
      productImage,
      productCatigory,
      productPrice,
      productQuantatiy,
      productDescription;
  final bool? isFavourite, isAdded;

  ProductModel({
    required this.productID,
    required this.productName,
    required this.productImage,
    required this.productCatigory,
    required this.productPrice,
    required this.productQuantatiy,
    required this.productDescription,
    this.isFavourite,
    this.isAdded,
  });
}
