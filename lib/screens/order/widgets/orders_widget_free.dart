import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shophoria/app/appWidgets/custom_sub_text.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/core/const_val_managers.dart';


class OrdersWidgetFree extends StatefulWidget {
  const OrdersWidgetFree({super.key});

  @override
  State<OrdersWidgetFree> createState() => _OrdersWidgetFreeState();
}

class _OrdersWidgetFreeState extends State<OrdersWidgetFree> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width * 0.25,
              imageUrl: ConstValManagers.netPhoto,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(style: TextStyle(fontSize: 15),
                          'productTitle',
                          maxLines: 2,

                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 22,
                          )),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(style: TextStyle(fontSize: 15),
                        'Price:  ',

                      ),
                      Flexible(
                        child: Text(
                          "11.99 \$",
                          style: TextStyle(color: Colors.blue,fontSize: 15),

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomSubText(
                    text: "Qty: 10",
                    fontSize: 15,
                  ),
                  // const Row(
                  //   children: [
                  //     Flexible(
                  //       child: TitlesTextWidget(
                  //         label: 'Qty:  ',
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //     Flexible(
                  //       child: SubtitleTextWidget(
                  //         label: "10",
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
