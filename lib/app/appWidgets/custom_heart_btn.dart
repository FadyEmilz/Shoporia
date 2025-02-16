import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/providers/wishlist_provider.dart';

class CustomHeartBtn extends StatelessWidget {
  const CustomHeartBtn({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    var wishListProdvider = Provider.of<WishListProvider>(context);
    return IconButton(
      onPressed: (){
        wishListProdvider.addOrRemovetoWishList(productId: productId);
      },
      icon: Icon(
       wishListProdvider.isProductInWishList(productid: productId)? IconlyBold.heart : IconlyLight.heart,
      ),
    );
  }
}
