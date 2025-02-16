import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/screens/admin/screens/upload_product/upload_product_screen.dart';

import '../../../../app/appWidgets/custom_heart_btn.dart';
import '../../../../core/colors_managers.dart';
import '../../../../core/routes_managers.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../providers/product_provider.dart';
import '../../../../providers/view_pro_provider.dart';

class AdminProductWidget extends StatelessWidget {
  const AdminProductWidget({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewProProvider = Provider.of<ViewProProvider>(context);
    var productProvider = Provider.of<ProductProvider>(context);
    var cartProvider = Provider.of<CartProvider>(context);
    var getCurrPro = productProvider.findByProId(productId);
    return GestureDetector(
      onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => UploadProductScreen(productModel: getCurrPro,))  );
      },
      child: getCurrPro == null
          ? SizedBox.shrink()
          : Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              getCurrPro.productImage,
              width: double.infinity,
              height: size.height * .22,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 5,
                    child: Text(
                      getCurrPro.productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.baloo2(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )),
                Flexible(
                    child: CustomHeartBtn(productId: getCurrPro.productID,

                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "${getCurrPro.productPrice}\$",
                      style: GoogleFonts.baloo2(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                    )),
                Flexible(
                    child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorsManagers.lightBlue,
                        child: IconButton(
                            onPressed: () {
                              if(cartProvider.isProductInCart(productid: getCurrPro.productID)){
                                return;
                              }
                              cartProvider.addProductToCart(productId: getCurrPro.productID);
                            },
                            icon: Icon(cartProvider.isProductInCart(productid: getCurrPro.productID) ?Icons.check : Icons.add_shopping_cart))))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
