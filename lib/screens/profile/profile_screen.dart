import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/core/colors_managers.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/screens/home/widgets/shimmer_app_name.dart';
import 'package:shophoria/screens/profile/widgets/custom_log_btn.dart';
import 'package:shophoria/screens/profile/widgets/custom_tile.dart';
import 'package:shophoria/screens/profile/widgets/invisavle_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shophoria/screens/profile/widgets/user_information_widget.dart';
import 'package:shophoria/screens/profile/widgets/waring.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    var probider = Provider.of<ThemeProvivder>(context);
    return Scaffold(
        appBar: AppBar(
          title:ShimmerAppName(fontSize: 20,),
          leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(AssetsManagers.shopping_cart)),
        ),
        body: SafeArea(
            child: Column(
              children: [
                InvisavleText(),
                UserInformationWidget(),
                SizedBox(
                  height: 10,
                ),
                Expanded( // Added Expanded here
                  child: SingleChildScrollView( // Wrap this part in SingleChildScrollView
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, bottom: 10),
                            child: Text(
                              "General",
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                        Column(
                          children: [
                            CustomRowTile(
                              imgURL: AssetsManagers.order,
                              text: 'All Orders',
                              onClick: () {
                                Navigator.pushNamed(context,RoutesNames.order );
                              },
                            ),
                            CustomRowTile(
                              imgURL: AssetsManagers.wishlist_svg,
                              text: 'WishList',
                              onClick: () {
                                Navigator.pushNamed(context, RoutesNames.wishlist);
                              },
                            ),
                            CustomRowTile(
                              imgURL: AssetsManagers.recent,
                              text: 'Viewed Recently',
                              onClick: () {
                                Navigator.pushNamed(context, RoutesNames.recentlyViewd);
                              },
                            ),
                            CustomRowTile(
                              imgURL: AssetsManagers.address,
                              text: 'Address',
                              onClick: () {},
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                        SwitchListTile(
                            secondary: Image.asset(
                              AssetsManagers.theme,
                              height: 35,
                            ),
                            title: Text("Dark Mode"),
                            value: probider.isDark,
                            onChanged: (val) {
                              probider.setTheme(currentTheme: val);
                            }),
                        Divider(
                          thickness: 2,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                            child: Text(
                              "Privacy & Policy",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                        CustomRowTile(
                          imgURL: AssetsManagers.privacy,
                          text: "Privacy & Policy",
                          onClick: () {},
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomLogBtn(
                              text:user == null ?  "Login" : "Logout" ,
                              icon: Icons.login,
                              onClick: () async {
                                await Waring().showWoring(context: context, okPressed: (){
                                  if(user != null){FirebaseAuth.instance.signOut();}
                                  Navigator.pushNamedAndRemoveUntil(context, RoutesNames.splash, (Route<dynamic> route) => false);}, noPressed: (){}, text: "Are you Sure ??");
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
