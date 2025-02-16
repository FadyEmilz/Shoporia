import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/screens/order/widgets/empty_bag_widget.dart';
import 'package:shophoria/screens/order/widgets/orders_widget_free.dart';



class OrdersScreen extends StatefulWidget {


  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Placed orders', fontSize: 20,
          ),
        ),
        body: isEmptyOrders
            ? EmptyBagWidget(
            imagePath: AssetsManagers.order,
            title: "No orders has been placed yet",
            subtitle: "",
            buttonText: "Shop now")
            : ListView.separated(
          itemCount: 15,
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              child: OrdersWidgetFree(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ));
  }
}
