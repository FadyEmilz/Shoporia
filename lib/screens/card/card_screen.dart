import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/screens/card/widgets/cart_list.dart';
import 'package:shophoria/screens/card/widgets/empty_cart.dart';

import '../../providers/cart_provider.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});
  final bool isCartEmpty =true;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty ? EmptyCart() : CartList();
  }
}
