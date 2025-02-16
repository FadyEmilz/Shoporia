import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/screens/viewed_recently/widgets/empty_viewed.dart';
import 'package:shophoria/screens/viewed_recently/widgets/fill_viewed.dart';

import '../../providers/view_pro_provider.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  const ViewedRecentlyScreen({super.key});

  @override
  State<ViewedRecentlyScreen> createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {

  bool isemptyViewed = true;

  @override
  Widget build(BuildContext context) {
    var viewProProvider = Provider.of<ViewProProvider>(context);
    return viewProProvider.myViewPro.isEmpty ? EmptyViewed() : FillViewed();
  }
}
