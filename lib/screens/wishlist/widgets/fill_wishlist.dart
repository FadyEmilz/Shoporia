import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/models/wishlist_model.dart';

import '../../../app/appWidgets/custom_text.dart';
import '../../../providers/product_provider.dart';
import '../../../providers/wishlist_provider.dart';
import '../../search/widgets/product_single.dart';

class FillWishlist extends StatelessWidget {
  const FillWishlist({super.key});

  @override
  Widget build(BuildContext context) {

    var wishListProdvider = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: AppBar(

        title: CustomText(fontSize: 30, text: "Wishlist (${wishListProdvider.myWishList.length})",),
        actions: [IconButton(onPressed: (){
          wishListProdvider.removeAllProducts();
        }, icon: Icon(IconlyBold.delete))],
      ),
      body: DynamicHeightGridView(builder: (context,index){
        return Center(child: ChangeNotifierProvider<WishlistModel>.value(value: wishListProdvider.getWishListProducts.values
            .toList()
            .reversed
            .toList()[index],
        child: ProductSingle(productId: wishListProdvider.getWishListProducts.values.toList()[index].productId,)));
      }, itemCount: wishListProdvider.myWishList.length, crossAxisCount: 2),
    );
  }
}
