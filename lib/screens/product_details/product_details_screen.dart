import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_heart_btn.dart';
import 'package:shophoria/app/appWidgets/custom_sub_text.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/core/colors_managers.dart';
import 'package:shophoria/core/const_val_managers.dart';
import 'package:shophoria/providers/product_provider.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/screens/home/widgets/shimmer_app_name.dart';

import '../../providers/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvivder>(context);
    var productProvider = Provider.of<ProductProvider>(context);

    var cartProvider = Provider.of<CartProvider>(context);
    String productId = ModalRoute.of(context)!.settings.arguments as String;

    var currProduct = productProvider.findByProId(productId);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ShimmerAppName(fontSize: 25),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                alignment: Alignment.topLeft,
                label: Text("2"),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      IconlyLight.bag,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: currProduct == null
                ? SizedBox.shrink()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    currProduct.productImage,
                                    width: size.width * .6,
                                    height: size.height * .3,
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  currProduct.productName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.baloo2(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25)),
                                ),
                              ),
                              Text(
                                "${currProduct.productPrice}\$",
                                style: GoogleFonts.baloo2(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.lightBlue)),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.filled(
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.teal.shade200),
                                onPressed: () {},
                                icon: CustomHeartBtn(productId: currProduct.productID,
                                )),
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: size.width * .6,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (cartProvider.isProductInCart(
                                      productid: currProduct.productID)) {
                                    return;
                                  }
                                  cartProvider.addProductToCart(
                                      productId: currProduct.productID);
                                },
                                icon: Icon(
                                    cartProvider.isProductInCart(
                                            productid: currProduct.productID)
                                        ? Icons.check
                                        : Icons.add_shopping_cart,
                                    color: themeprovider.isDark
                                        ? Colors.white
                                        : Colors.white),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorsManagers.primaryBlue),
                                label: Text(
                                  cartProvider.isProductInCart(
                                          productid: currProduct.productID)
                                      ? "In Cart"
                                      : "Add to the cart",
                                  style: TextStyle(
                                      color: themeprovider.isDark
                                          ? Colors.white
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'About this item',
                                fontSize: 25,
                              ),
                              CustomSubText(
                                text: '${currProduct.productCatigory}',
                                fontSize: 20,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomSubText(
                              text: currProduct.productDescription,
                              fontSize: 20),
                        )
                      ],
                    ),
                  )));
  }
}
