import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ViewProModel with ChangeNotifier{
  ViewProModel({
    required this.viewproId,
    required this.productId,
  });

  final String viewproId , productId;
}