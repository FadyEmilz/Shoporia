import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/controllers/dash_board_controller.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/screens/admin/screens/dashboard/widgets/single_dash.dart';
import 'package:shophoria/screens/home/widgets/shimmer_app_name.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashBoardController controller = DashBoardController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvivder>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
              if(themeProvider.isDark == false){
                themeProvider.setTheme(currentTheme: true);
              }
              else if(themeProvider.isDark == true){
                themeProvider.setTheme(currentTheme: false);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right:  15.0),
              child: Icon(themeProvider.isDark ? Icons.dark_mode : Icons.light_mode),
            ),
          )
        ],
        title: ShimmerAppName(fontSize: 29),
        leadingWidth: 80,
        leading: Container(padding: EdgeInsets.only(left: 15),height: 50,width: 50,child: Image.asset(AssetsManagers.shopping_cart),),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: DynamicHeightGridView(builder: (context,index){
          return SingleDash(image: controller.myDashlist.values.toList()[index], text: controller.myDashlist.keys.toList()[index],);
        }, itemCount: controller.myDashlist.length, crossAxisCount: 2),
      ),)
    );
  }
}
