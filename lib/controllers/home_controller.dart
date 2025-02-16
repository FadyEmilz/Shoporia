import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/models/category_model.dart';

class HomeController{

  List<dynamic> banners = [AssetsManagers.banner1,AssetsManagers.banner2];
  List<CategoryModel> categories = [CategoryModel("1", "Phones", AssetsManagers.mobiles),
    CategoryModel("2", "Electronics", AssetsManagers.elelcronics),
    CategoryModel("3", "Shoes", AssetsManagers.shoes),
    CategoryModel("4", "Laptops", AssetsManagers.pc),
    CategoryModel("5", "Clothes", AssetsManagers.fashion),
    CategoryModel("6", "Watches", AssetsManagers.watch),
    CategoryModel("7", "Books", AssetsManagers.book_img),
    CategoryModel("8", "Cosmetics", AssetsManagers.cosmetics),
  ];
}