import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/screens/root_screen.dart';
import 'package:shophoria/screens/setting/setteng_screen.dart';

import '../core/theme_managers.dart';
import '../main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvivder>(context);
    return MaterialApp(
      routes: RoutesManagers.myRoutes,
      initialRoute: RoutesNames.splash,
      debugShowCheckedModeBanner: false,

      theme: ThemeManangers.themeData(context: context, isDark: provider.isDark),




    );
  }
}
