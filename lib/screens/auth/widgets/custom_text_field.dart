import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shophoria/core/colors_managers.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(

        decoration: InputDecoration(
          hintText: "Your email@gmail.com",
          hintStyle: TextStyle(color: ColorsManagers.grey),
          prefixIcon:Icon(IconlyLight.message),
          filled: true,
          fillColor: ColorsManagers.lightGrey,

        ),
      ),
    );
  }
}
