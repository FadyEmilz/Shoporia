import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_heart_btn.dart';
import 'package:shophoria/core/const_val_managers.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/models/product_model.dart';

import '../../../providers/view_pro_provider.dart';

class LatestArrivalWidget extends StatelessWidget {
  const LatestArrivalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var productModel = Provider.of<ProductModel>(context);
    var viewProProvider = Provider.of<ViewProProvider>(context);
    return GestureDetector(
      onTap: () {
        viewProProvider.addviewedProduct(productId:productModel.productID);
        Navigator.pushNamed(context, RoutesNames.productDetails,
            arguments: productModel.productID);
      },
      child: Row(
        children: [
          SizedBox(
              width: size.width * .3,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  productModel.productImage,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.fill,
                ),
              )),
          Container(
            padding: EdgeInsets.only(left: 8),
            width: size.width * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  productModel.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.baloo2(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(IconlyLight.discount),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    CustomHeartBtn(productId: productModel.productID,),
                  ],
                ),
                Text(
                  "${productModel.productPrice}\$",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
