import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/controllers/upload_product_controller.dart';
import 'package:shophoria/core/theme_managers.dart';
import 'package:shophoria/providers/cart_provider.dart';
import 'package:shophoria/providers/product_provider.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/providers/user_provider.dart';
import 'package:shophoria/providers/view_pro_provider.dart';
import 'package:shophoria/providers/wishlist_provider.dart';

import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDi1VrZGILNjn1Sq8-f5ZX8ZByithI92QU",
        appId: "1:493409686562:android:0fc34822bb9f5d94fc667b",
        messagingSenderId: "493409686562",
        projectId: "shoporia-b80ca",));

  await Hive.initFlutter(); // Initialize Hive
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeProvivder(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => WishListProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ViewProProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MyApp()));
}
