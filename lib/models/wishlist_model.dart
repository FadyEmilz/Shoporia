import 'package:flutter/cupertino.dart';

class WishlistModel with ChangeNotifier {
  WishlistModel({required this.wishlistId, required this.productId});
  final String wishlistId, productId;

}