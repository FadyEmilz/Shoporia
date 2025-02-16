import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/core/colors_managers.dart';
import 'package:shophoria/models/cart_model.dart';

import '../../../providers/cart_provider.dart';

class QuntatyBottomSheet extends StatelessWidget {
  const QuntatyBottomSheet({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          width: 80,
          height: 6,
          decoration: BoxDecoration(
              color: ColorsManagers.grey,
              borderRadius: BorderRadius.circular(12)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Center(
                      child: InkWell(
                    onTap: () {
                      cartProvider.updatedQuantity(
                          productId: cartModel.productId, quantity: index + 1);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 30,
                  );
                },
                itemCount: 15),
          ),
        ),
      ],
    );
  }
}
