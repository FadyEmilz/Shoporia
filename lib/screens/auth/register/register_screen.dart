import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/my_app_methods.dart';
import 'package:shophoria/controllers/auth_controller/register_controller.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/screens/auth/widgets/image_pick_dialog.dart';
import 'package:shophoria/screens/auth/widgets/image_picker_widget.dart';
import 'package:shophoria/screens/profile/widgets/waring.dart';

import '../../../core/colors_managers.dart';
import '../../../models/valdators_models.dart';
import '../../../providers/theme_provider.dart';
import '../../home/widgets/shimmer_app_name.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/welcome_text.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late TextEditingController confiremPasswordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode userNameFocusNode;
  late FocusNode confirmPasswordFocusNode;
  GlobalKey<FormState> formKey = GlobalKey();
  late RegisterController controller;
  bool isObsecure = false;
  XFile? pickedImage;
  final ImagePicker picker = ImagePicker();
  FirebaseAuth auth = FirebaseAuth.instance;
  String imageURL = "";
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    confiremPasswordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    userNameFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    controller = RegisterController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confiremPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }
  Future<String?> uploadImageToCloudinary(XFile image) async {
    final cloudName = "dn52hawdu";  // Replace with your Cloudinary Cloud Name
    final uploadPreset = "ffff11122233";  // Replace with your Upload Preset

    final url = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");

    var request = http.MultipartRequest("POST", url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(await response.stream.bytesToString());

      return jsonResponse['secure_url']; // The uploaded image URL
    } else {
      print("Upload failed: ${response.statusCode}");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var providers = Provider.of<ThemeProvivder>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(child: ShimmerAppName(fontSize: 36)),
                SizedBox(
                  height: 26,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    child: WelcomeText(
                        text: "Welcome Back",
                        subText:
                            "lets get you logged in so you can start exploring")),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 3,
                    height: size.height * .2,
                    child: ImagePickerWidget(
                        pickedImage: pickedImage,
                        function: () {
                          ImagePickDialog().showWoring(
                              context: context,
                              cameraPressed: () async {
                                final XFile? image = await picker.pickImage(
                                    source: ImageSource.camera);
                                if (image != null) {
                                  setState(() {
                                    pickedImage = image;
                                  });
                                }
                              },
                              galeeryPressed: () async {
                                final XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  setState(() {
                                    pickedImage = image;
                                  });
                                }
                              },
                              removePressed: () async {
                                setState(() {
                                  pickedImage = null;
                                });
                                Navigator.canPop(context);
                              },
                              text: "Choose Option");
                        })),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(emailFocusNode);
                      },
                      controller: userNameController,
                      validator: (val) {
                        return ValidatorsModels.displayNamevalidator(val);
                      },
                      focusNode: userNameFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIconColor: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkGrey,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.lightGrey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.primaryBlue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 2),
                        ),
                        hintText: "user123",
                        hintStyle: TextStyle(color: ColorsManagers.grey),
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: providers.isDark
                            ? ColorsManagers.darkCardColor
                            : ColorsManagers.veryLightGrayBlue,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      style: TextStyle(color: ColorsManagers.darkPrimary),
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      controller: emailController,
                      validator: (val) {
                        return ValidatorsModels.emailValidator(val);
                      },
                      focusNode: emailFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIconColor: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkPrimary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.lightGrey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.primaryBlue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 2),
                        ),
                        hintText: "Your email@gmail.com",
                        hintStyle: TextStyle(color: ColorsManagers.grey),
                        prefixIcon: Icon(IconlyLight.message),
                        filled: true,
                        fillColor: providers.isDark
                            ? ColorsManagers.darkCardColor
                            : ColorsManagers.veryLightGrayBlue,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      style: TextStyle(color: ColorsManagers.darkPrimary),
                      obscureText: isObsecure,
                      onFieldSubmitted: (val) {
                        FocusScope.of(context)
                            .requestFocus(confirmPasswordFocusNode);
                      },
                      controller: passwordController,
                      validator: (val) {
                        return ValidatorsModels.passwordValidator(val);
                      },
                      focusNode: passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIconColor: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkPrimary,
                        suffixIconColor: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkPrimary,
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (isObsecure == false) {
                                setState(() {
                                  isObsecure = true;
                                });
                              } else {
                                setState(() {
                                  isObsecure = false;
                                });
                              }
                            },
                            icon: isObsecure
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.lightGrey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.primaryBlue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 2),
                        ),
                        hintText: "****************",
                        hintStyle: TextStyle(color: ColorsManagers.grey),
                        prefixIcon: Icon(
                          IconlyLight.lock,
                        ),
                        filled: true,
                        fillColor: providers.isDark
                            ? ColorsManagers.darkCardColor
                            : ColorsManagers.veryLightGrayBlue,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      style: TextStyle(
                        color: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkGrey,
                      ),
                      obscureText: isObsecure,
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).unfocus();
                        controller.submitRegister(
                            mykey: formKey,
                            pickedImaeg: pickedImage,
                            context: context);
                      },
                      controller: confiremPasswordController,
                      validator: (val) {
                        return ValidatorsModels.repeatPasswordValidator(
                            value: val, password: passwordController.text);
                      },
                      focusNode: confirmPasswordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIconColor: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkGrey,
                        suffixIconColor: providers.isDark
                            ? ColorsManagers.darkPrimary
                            : ColorsManagers.darkGrey,
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (isObsecure == false) {
                                setState(() {
                                  isObsecure = true;
                                });
                              } else {
                                setState(() {
                                  isObsecure = false;
                                });
                              }
                            },
                            icon: isObsecure
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.lightGrey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: ColorsManagers.primaryBlue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: ColorsManagers.error, width: 2),
                        ),
                        hintText: "****************",
                        hintStyle: TextStyle(color: ColorsManagers.grey),
                        prefixIcon: Icon(
                          IconlyLight.lock,
                        ),
                        filled: true,
                        fillColor: providers.isDark
                            ? ColorsManagers.darkCardColor
                            : ColorsManagers.veryLightGrayBlue,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                CustomAuthButton(
                  onPressed: () async {
                    // First, await the register method to ensure validation and image check pass
                    await controller.submitRegister(
                      mykey: formKey,
                      pickedImaeg: pickedImage,
                      context: context,
                    );

                    // If the submitRegister function hasn't returned due to validation/image errors, stop
                    if (formKey.currentState!.validate() == false || pickedImage == null) {
                      return; // Exit if the form is not valid or the image is missing
                    }

                    // If the form is valid and the image is picked, proceed with creating the user
                    try {
                      String? uploadedImageURL = await uploadImageToCloudinary(pickedImage!);

                      if (uploadedImageURL == null) {
                        MyAppMethods.showErrorORWarningDialog(
                          context: context,
                          subtitle: "Image upload failed. Please try again.",
                          fct: () {},
                        );
                        return;
                      }

                      // Update the imageURL with the returned secure_url
                      imageURL = uploadedImageURL;
                      await auth.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      final user = FirebaseAuth.instance.currentUser;
                      final uid = user!.uid;
                      await FirebaseFirestore.instance.collection("users").doc(uid).set(
                          {
                            "userId" : uid,
                            "userEmail": emailController.text,
                            "userName" : userNameController.text,
                            "createdAt" : Timestamp.now(),
                            "userImage" : imageURL,
                            "userCart": [],
                            "userWish" : []
                          });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Account created"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.fixed, // Optional: Keeps the snackbar in the same place
                        ),
                      );
                      Navigator.pushReplacementNamed(context, RoutesNames.splash);
                    } catch (error) {
                      if (error.toString().contains("email-already-in-use")) {
                        MyAppMethods.showErrorORWarningDialog(
                          context: context,
                          subtitle: "This email is already associated with an account.",
                          fct: () {},
                        );
                      } else {
                        MyAppMethods.showErrorORWarningDialog(
                          context: context,
                          subtitle: "$error",
                          fct: () {},
                        );
                      }
                    }
                  },
                  text: "Sign Up",
                  width: 330,
                ),

              ],
            ),
          ),
        ),
      )),
    );
  }
}
