import 'package:flutter/cupertino.dart';
import 'package:shophoria/screens/admin/screens/admin_login/admin_login_screen.dart';
import 'package:shophoria/screens/admin/screens/admin_product/admin_product_widget.dart';
import 'package:shophoria/screens/admin/screens/admin_search/admin_search_screen.dart';
import 'package:shophoria/screens/admin/screens/dashboard/dashboard_screen.dart';
import 'package:shophoria/screens/admin/screens/upload_product/upload_product_screen.dart';
import 'package:shophoria/screens/auth/forgotPassword/forgot_password_screen.dart';
import 'package:shophoria/screens/auth/login/login_screen.dart';
import 'package:shophoria/screens/auth/register/register_screen.dart';
import 'package:shophoria/screens/card/card_screen.dart';
import 'package:shophoria/screens/home/home_screen.dart';
import 'package:shophoria/screens/order/orders_screen.dart';
import 'package:shophoria/screens/product_details/product_details_screen.dart';
import 'package:shophoria/screens/profile/profile_screen.dart';
import 'package:shophoria/screens/root_screen.dart';
import 'package:shophoria/screens/search/search_screen.dart';
import 'package:shophoria/screens/splash/splash_screen.dart';
import 'package:shophoria/screens/viewed_recently/viewed_recently_screen.dart';
import 'package:shophoria/screens/wishlist/wishlist_screen.dart';

class RoutesManagers{
  static  Map<String, WidgetBuilder> myRoutes = {
    RoutesNames.root : (context) => RootScreen(),
    RoutesNames.home : (context) => HomeScreen(),
    RoutesNames.search : (context) => SearchScreen(),
    RoutesNames.cart : (context) => CardScreen(),
    RoutesNames.profile : (context) => ProfileScreen(),
    RoutesNames.productDetails : (context) => ProductDetailsScreen(),
    RoutesNames.recentlyViewd : (context) => ViewedRecentlyScreen(),
    RoutesNames.order : (context) => OrdersScreen(),
    RoutesNames.login : (context) => LoginScreen(),
    RoutesNames.register : (context) => RegisterScreen(),
    RoutesNames.forgotPassword : (context) => ForgotPasswordScreen(),
    RoutesNames.wishlist : (context) => WishlistScreen(),
    RoutesNames.adminLoginScreen : (context) => AdminLoginScreen(),
    RoutesNames.dashboardScreen : (context) => DashboardScreen(),
    RoutesNames.adminViewAllOrders : (context) => OrdersScreen(),
    RoutesNames.uploadProduct : (context) => UploadProductScreen(),
    RoutesNames.adminSearch : (context) => AdminSearchScreen(),
    RoutesNames.splash : (context) => SplashScreen(),


  };
}
class RoutesNames{
  static const String splash = "Splash Screen";
  static const String home = "Home Screen";
  static const String root = "Root Screen";
  static const String search = "Search Screen";
  static const String cart = "Cart Screen";
  static const String profile = "Profile Screen";
  static const String productDetails = "ProductDetails Screen";
  static const String wishlist = "WishList Screen";
  static const String recentlyViewd = "Recently Viewed Screen";
  static const String order = "orders Screen";
  static const String login = "Login Screen";
  static const String register = "Register Screen";
  static const String forgotPassword = "Forgot Password Screen";

  //Admen Pannel
  static const String adminLoginScreen = "Admin Login Screen";
  static const String dashboardScreen = "Dashboard Screen";
  static const String adminViewAllOrders = "View Orders Screen";
  static const String uploadProduct = "Upload Product Screen";
  static const String adminSearch = "Admin Search Screen";

}