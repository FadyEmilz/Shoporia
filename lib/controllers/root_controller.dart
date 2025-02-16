import 'package:flutter/cupertino.dart';
import 'package:shophoria/screens/card/card_screen.dart';
import 'package:shophoria/screens/home/home_screen.dart';
import 'package:shophoria/screens/profile/profile_screen.dart';
import 'package:shophoria/screens/search/search_screen.dart';

class RootController{
  List<Widget> screens = [
    HomeScreen(),SearchScreen(),CardScreen(),ProfileScreen()
  ];
  int currentScreen = 0;

}