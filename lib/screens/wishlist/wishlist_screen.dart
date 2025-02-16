import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/screens/wishlist/widgets/empty_wishlist.dart';
import 'package:shophoria/screens/wishlist/widgets/fill_wishlist.dart';

import '../../providers/wishlist_provider.dart';
import '../search/widgets/product_single.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isEmptyWishList= true;
  @override
  Widget build(BuildContext context) {
    var wishListProdvider = Provider.of<WishListProvider>(context);
    return wishListProdvider.myWishList.isEmpty ? EmptyWishlist() : FillWishlist();
  }
}
