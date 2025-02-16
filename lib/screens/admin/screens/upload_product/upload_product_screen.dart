import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/controllers/upload_product_controller.dart';
import 'package:shophoria/models/product_model.dart';
import 'package:shophoria/models/valdators_models.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/screens/admin/screens/upload_product/widgets/pick_image_widget.dart';

import '../../../../app/appWidgets/custom_sub_text.dart';
import '../../../../app/appWidgets/my_app_methods.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  UploadProductController controller = UploadProductController();

  @override
  void initState() {
    super.initState();

    if (widget.productModel != null) {
      controller.productNetworkImage = widget.productModel!.productImage ?? '';
      controller.isEditing = true;
      controller.catigoryValue = widget.productModel!.productCatigory ;
      controller.titleController.text = widget.productModel!.productName ?? '';
      controller.priceController.text = widget.productModel!.productPrice ?? '';
      controller.descriptionController.text = widget.productModel!.productDescription ?? '';
      controller.quantityController.text = widget.productModel!.productQuantatiy ?? '';
    }
  }

  @override
  void dispose() {
    controller.disposeControllers();
    super.dispose();
  }

  Future<void> localImagePicker(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    await MyAppMethods.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        controller.pickedImage =
            await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        controller.pickedImage =
            await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          controller.pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title:  CustomText(
            text: controller.isEditing ? "Edit Product" : "Upload a new product",
            fontSize: 20,
          )),
      bottomSheet: SizedBox(
        height: kBottomNavigationBarHeight + 10,
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.clear),
                label: const Text(
                  "Clear",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.upload),
                label:  Text(
                  controller.isEditing ? "Edit Product" : "Upload Product",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  if(controller.isEditing){
                    controller.editProduct(context: context);
                  }
                  else{
                    controller.uploadProduct(context: context);
                  }

                },
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                if(controller.isEditing && controller.productNetworkImage !=null)...[
                  SizedBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            controller.productNetworkImage!,
                              alignment: Alignment.center,
                              height: size.width * .5,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    controller.removePickedImage();
                                  });
                                },
                                child: Text(
                                  "Remove image",
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit Image",
                                  style: TextStyle(color: Colors.green),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ]
                else if (controller.pickedImage == null) ...[
                  PickImageWidget(onPressed: () {
                    localImagePicker(context);
                  }),
                ] else ...[
                  SizedBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                              alignment: Alignment.center,
                              height: size.width * .5,
                              File(controller.pickedImage!.path)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    controller.removePickedImage();
                                  });
                                },
                                child: Text(
                                  "Remove image",
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit Image",
                                  style: TextStyle(color: Colors.green),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  width: size.width * .4,
                  height: size.height * .05,
                  child: Center(
                    child: DropdownButton(
                        hint: Text(
                          "Select Catigory",
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        value: controller.catigoryValue,
                        items: controller.categories,
                        onChanged: (String? val) {
                          setState(() {
                            controller.catigoryValue = val;
                          });
                        }),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Form(
                    key: controller.myKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          key: const ValueKey('Title'),
                          maxLength: 80,
                          minLines: 1,
                          maxLines: 2,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            hintText: 'Product Title',
                            hintStyle: TextStyle(color:  Colors.deepPurple),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            return ValidatorsModels.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "Please enter a valid title",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                controller: controller.priceController,
                                key: const ValueKey('Price \$'),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color:  Colors.deepPurple),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  hintText: 'Price',
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12, right: 8),
                                    child: CustomSubText(
                                      text: "\$ ",
                                      fontSize: 16,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  return ValidatorsModels.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "Price is missing",
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^(\\d+)?\.?\d{0,2}'),
                                  ),
                                ],
                                controller: controller.quantityController,
                                keyboardType: TextInputType.number,
                                key: const ValueKey('Quantity'),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color:  Colors.deepPurple),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  hintText: 'Qty',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  return ValidatorsModels.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "Quantity is missed",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          key: const ValueKey('Description'),
                          controller: controller.descriptionController,
                          minLines: 3,
                          maxLines: 8,
                          maxLength: 1000,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color:  Colors.deepPurple),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            hintText: 'Product description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            return ValidatorsModels.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "Description is missed",
                            );
                          },
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                      ? 10
                      : kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
