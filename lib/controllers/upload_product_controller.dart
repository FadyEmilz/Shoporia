import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shophoria/app/appWidgets/my_app_methods.dart';

import '../core/assets_managers.dart';
import '../models/category_model.dart';

class UploadProductController {
  TextEditingController titleController = TextEditingController(text: "");
  TextEditingController priceController = TextEditingController(text: "");
  TextEditingController descriptionController = TextEditingController(text: "");
  TextEditingController quantityController = TextEditingController(text: "");
  XFile? pickedImage;
  bool isEditing = false;
  String? productNetworkImage;
  GlobalKey<FormState> myKey = GlobalKey();
  String? catigoryValue;
  List<DropdownMenuItem<String>> categories = [
    DropdownMenuItem(value: "Phones", child: Text("Phones")),
    DropdownMenuItem(value: "Electronics", child: Text("Electronics")),
    DropdownMenuItem(
        value: "Shoes",
        child: Text(
          "Shoes",
        )),
    DropdownMenuItem(
        value: "Laptops",
        child: Text(
          "Laptops",
        )),
    DropdownMenuItem(
        value: "Clothes",
        child: Text(
          "Clothes",
        )),
    DropdownMenuItem(
        value: "Watches",
        child: Text(
          "Watches",
        )),
    DropdownMenuItem(value: "Books", child: Text("Books")),
    DropdownMenuItem(
        value: "Cosmetics",
        child: Text(
          "Cosmetics",
        )),
  ];

  void disposeControllers() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
  }

  void removePickedImage() {
    pickedImage = null;
    productNetworkImage = null;
  }

  void clearForm() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    quantityController.clear();
    removePickedImage();
  }

  Future<void> uploadProduct({required BuildContext context}) async {
    final isValid = myKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (catigoryValue == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "Enter the Category", fct: () {});
      return;
    }
    if (pickedImage == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "Please pick up image", fct: () {});
      return;
    }
    if (isValid) {}
  }

  Future<void> editProduct({required BuildContext context}) async {
    final isValid = myKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (pickedImage == null && productNetworkImage == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "Please pick up image", fct: () {});
      return;
    }

    if (isValid) {}
  }

  void set setCatigory(String? value) {
    catigoryValue = value;
  }

  String? get getCatigory {
    return catigoryValue;
  }
}
