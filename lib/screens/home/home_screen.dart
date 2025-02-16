import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/controllers/home_controller.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/providers/product_provider.dart';
import 'package:shophoria/screens/home/widgets/banner_widget.dart';
import 'package:shophoria/screens/home/widgets/lable_home_text.dart';
import 'package:shophoria/screens/home/widgets/latest_arrival_widget.dart';
import 'package:shophoria/screens/home/widgets/shimmer_app_name.dart';
import 'package:shophoria/screens/home/widgets/single_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: ShimmerAppName(
          fontSize: 20,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(AssetsManagers.shopping_cart),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(
                banners: controller.banners,
              ),
              LableHomeText(text: "Latest Arrival"),
              Container(
                height: size.height * .2,
                width: size.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: productProvider.getProducts[index],
                        child: LatestArrivalWidget());
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: 10,
                ),
              ),
              LableHomeText(text: "Categories"),
              GridView.count(
                shrinkWrap:
                    true, // Ensures the GridView takes only as much space as needed
                physics:
                    NeverScrollableScrollPhysics(), // Prevents GridView from scrolling independently
                crossAxisCount: 4,
                children: List.generate(controller.categories.length, (index) {
                  return SingleCategoryWidget(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesNames.search,
                          arguments: controller.categories[index].name);
                    },
                    image: controller.categories[index].image,
                    text: controller.categories[index].name,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
