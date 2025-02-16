import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/app/appWidgets/my_app_methods.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/models/cart_model.dart';
import 'package:shophoria/providers/cart_provider.dart';
import 'package:shophoria/providers/product_provider.dart';
import 'package:shophoria/screens/card/widgets/cart_bottom_checkout.dart';
import 'package:shophoria/screens/card/widgets/single_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);


    var currCart = cartProvider.getCartItems;
    int itemsLenth = cartProvider.getCartItems.length;
    return Scaffold(
      bottomSheet: CartBottomCheckout(),
      appBar: AppBar(
        leading: Image.asset(
          AssetsManagers.shopping_cart,
          width: 20,
          height: 20,
        ),
        title: CustomText(
          fontSize: 30,
          text: "Cart (${itemsLenth})",
        ),
        actions: [
          IconButton(
              onPressed: () {
                MyAppMethods.showErrorORWarningDialog(
                    isError: false,
                    context: context,
                    subtitle: "Remove all items ?",
                    fct: () {
                      cartProvider.removeAllItems();
                    });
              },
              icon: Icon(IconlyBold.delete))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider<CartModel>.value(
                      value: cartProvider.getCartItems.values
                          .toList()
                          .reversed
                          .toList()[index],
                      child: SingleCartWidget());
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: cartProvider.getCartItems.length),
          ),
          SizedBox(
            height: 100,
          )
        ],
      )),
    );
  }
}
