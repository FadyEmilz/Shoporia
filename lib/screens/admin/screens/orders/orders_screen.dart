import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/screens/admin/screens/orders/widgets/orders_widget.dart';

import '../../../order/widgets/empty_bag_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  CustomText(
            text: 'Placed orders', fontSize: 20,
          ),
        ),
        body: isEmptyOrders
            ? EmptyBagWidget(
          imagePath: AssetsManagers.order,
          title: "No orders has been placed yet",
          subtitle: "", buttonText: '',
        )
            : ListView.separated(
          itemCount: 15,
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              child: OrdersWidget(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ));
  }
}
