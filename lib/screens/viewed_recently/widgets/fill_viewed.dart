import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/models/view_pro_model.dart';

import '../../../app/appWidgets/custom_text.dart';
import '../../../providers/product_provider.dart';
import '../../../providers/view_pro_provider.dart';
import '../../search/widgets/product_single.dart';

class FillViewed extends StatelessWidget {
  const FillViewed({super.key});

  @override
  Widget build(BuildContext context) {

    var viewProProvider = Provider.of<ViewProProvider>(context);
    return Scaffold(
      appBar: AppBar(

        title: CustomText(fontSize: 30, text: "Recently Viewed",),
        actions: [IconButton(onPressed: (){
          viewProProvider.removeHistoy();
        }, icon: Icon(IconlyBold.delete))],
      ),
      body: DynamicHeightGridView(builder: (context,index){
        return Center(child: ChangeNotifierProvider<ViewProModel>.value(value: viewProProvider.myViewPro.values.toList()[index],
        child: ProductSingle(productId: viewProProvider.myViewPro.values.toList()[index].productId,)));
      }, itemCount: viewProProvider.myViewPro.length, crossAxisCount: 2),
    );
  }
}
