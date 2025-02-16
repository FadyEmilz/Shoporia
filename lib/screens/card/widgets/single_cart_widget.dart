import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_heart_btn.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/core/colors_managers.dart';
import 'package:shophoria/core/const_val_managers.dart';
import 'package:shophoria/models/cart_model.dart';
import 'package:shophoria/screens/card/widgets/quntaty_bottom_sheet.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/product_provider.dart';

class SingleCartWidget extends StatelessWidget {
  SingleCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cartModelPRovider = Provider.of<CartModel>(context);
    var productProvider = Provider.of<ProductProvider>(context);
    var currPro = productProvider.findByProId(cartModelPRovider.productId);

    Size size = MediaQuery.of(context).size;
    return currPro == null
        ? Center(
      child: Text(
        "Empty",
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    )
        : Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FancyShimmerImage(
                imageUrl: currPro.productImage,
                width: 100,
                height: 100,
                boxFit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currPro.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${currPro.productPrice}\$",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorsManagers.primaryPurple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(
                            width: 2,
                            color: ColorsManagers.primaryPurple,
                          ),
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                            context: context,
                            builder: (context) {
                              return QuntatyBottomSheet(
                                cartModel: cartModelPRovider,
                              );
                            },
                          );
                        },
                        icon: const Icon(IconlyLight.arrowDown2),
                        label: Text("Qty: ${cartModelPRovider.Quantanty}"),
                      ),
                      IconButton(
                        onPressed: () {
                          cartProvider.removeOneItem(productId: currPro.productID);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            CustomHeartBtn(productId: currPro.productID,

            ),
          ],
        ),
      ),
    );
  }
}
