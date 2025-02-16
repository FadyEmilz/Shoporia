import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/controllers/root_controller.dart';
import 'package:shophoria/screens/card/card_screen.dart';
import 'package:shophoria/screens/home/home_screen.dart';
import 'package:shophoria/screens/profile/profile_screen.dart';
import 'package:shophoria/screens/search/search_screen.dart';

import '../providers/cart_provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentScreen = 0;
  late PageController pageCNTR;
  late RootController controller;

  @override
  void initState() {
    controller = RootController();
    pageCNTR = PageController(initialPage: controller.currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: PageView(
        controller: pageCNTR,
        children: controller.screens,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(IconlyLight.home),
            label: "home",
            selectedIcon: Icon(IconlyBold.home),
          ),
          NavigationDestination(
              icon: Icon(IconlyLight.search), label: "search",
            selectedIcon: Icon(IconlyBold.search),),
          NavigationDestination(icon: Badge(label:cartProvider.getCartItems.isNotEmpty ? Text("${cartProvider.getCartItems.length}") : null,child: Icon(IconlyLight.buy)), label: "cart",
            selectedIcon: Icon(IconlyBold.buy),),
          NavigationDestination(
              icon: Icon(IconlyLight.profile), label: "profile",
            selectedIcon: Icon(IconlyBold.profile),),
        ],
        onDestinationSelected: (val) {
          setState(() {
            controller.currentScreen = val;
          });
          pageCNTR.jumpToPage(controller.currentScreen);
        },
        selectedIndex: controller.currentScreen,
      ),
    );
  }
}
