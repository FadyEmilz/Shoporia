import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/screens/admin/screens/admin_product/admin_product_widget.dart';

import '../../../../app/appWidgets/custom_text.dart';
import '../../../../core/assets_managers.dart';
import '../../../../core/colors_managers.dart';
import '../../../../models/product_model.dart';
import '../../../../providers/product_provider.dart';
import '../../../home/widgets/shimmer_app_name.dart';
import '../../../search/widgets/product_single.dart';

class AdminSearchScreen extends StatefulWidget {
  const AdminSearchScreen({super.key});

  @override
  State<AdminSearchScreen> createState() => _AdminSearchScreenState();
}

class _AdminSearchScreenState extends State<AdminSearchScreen> {

  late TextEditingController searchCTRL;

  @override
  void initState() {
    searchCTRL = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    searchCTRL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    final passedCatigoty = ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel>  listProCaT = passedCatigoty == null ? productProvider.getProducts : productProvider.findProviderByCTG(passedCatigoty);
    List<ProductModel> listSearch = [];
    return Material(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              title: ShimmerAppName(
                fontSize: 20,
              ),
              leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(AssetsManagers.shopping_cart)),
            ),
            body:listProCaT.isEmpty? Center(child: CustomText(text: "No ${passedCatigoty} Product Found", fontSize: 30),) : Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: TextField(

                    onSubmitted: (val){
                      print("Search text: $val");
                      setState(() {
                        listSearch = productProvider.searchQuery(searchCTRL.text);
                      });

                    },
                    controller: searchCTRL,
                    decoration: InputDecoration(
                        prefix: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(IconlyLight.search)),
                        suffix: InkWell(
                            onTap: () {
                              searchCTRL.text = "";
                            }, child: Icon(IconlyLight.delete)),
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorsManagers.primaryBlue),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsManagers.error),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(height: 20,),
                if(searchCTRL.text.isNotEmpty && listSearch.isEmpty) ...[
                  Center(child: CustomText(text: "No Results Found", fontSize: 35),)
                ] else ...[
                  Expanded(
                    child: DynamicHeightGridView(builder: (context,index){
                      return Center(child: ChangeNotifierProvider.value(value:searchCTRL.text.isEmpty? listProCaT[index] : listSearch[index],
                          child: AdminProductWidget(productId:searchCTRL.text.isEmpty? listProCaT[index].productID : listSearch[index].productID,)));
                    }, itemCount:searchCTRL.text.isEmpty ? listProCaT.length : listSearch.length, crossAxisCount: 2),
                  )
                ]

              ],
            )),
      ),
    );
  }
}
