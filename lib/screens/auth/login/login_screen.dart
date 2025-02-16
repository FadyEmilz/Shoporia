import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/controllers/auth_controller/login_controller.dart';
import 'package:shophoria/core/routes_managers.dart';
import 'package:shophoria/models/valdators_models.dart';
import 'package:shophoria/screens/auth/widgets/custom_auth_button.dart';
import 'package:shophoria/screens/auth/widgets/custom_or_text.dart';
import 'package:shophoria/screens/auth/widgets/custom_text_field.dart';
import 'package:shophoria/screens/auth/widgets/forgot_password_widget.dart';
import 'package:shophoria/screens/auth/widgets/welcome_text.dart';
import 'package:shophoria/screens/home/widgets/shimmer_app_name.dart';

import '../../../app/appWidgets/my_app_methods.dart';
import '../../../core/colors_managers.dart';
import '../../../providers/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  GlobalKey<FormState> formKey = GlobalKey();
  late LoginController controller;
  bool isObsecure = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    controller = LoginController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var providers = Provider.of<ThemeProvivder>(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
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
              height: 35,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
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
                    prefixIconColor: providers.isDark ? ColorsManagers.darkPrimary : ColorsManagers.darkGrey,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: ColorsManagers.lightGrey, width: 1),
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
                    fillColor:providers.isDark? ColorsManagers.darkCardColor : ColorsManagers.veryLightGrayBlue,
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(

                  obscureText: isObsecure,
                  onFieldSubmitted: (val) {
                    FocusScope.of(context).unfocus();
                    controller.submetLogin(formKey,context);
                  },
                  controller: passwordController,
                  validator: (val) {
                    return ValidatorsModels.passwordValidator(val);
                  },
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIconColor: providers.isDark ? ColorsManagers.darkPrimary : ColorsManagers.darkGrey,
                    suffixIconColor: providers.isDark ? ColorsManagers.darkPrimary : ColorsManagers.darkGrey,

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
                        icon: isObsecure ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: ColorsManagers.lightGrey, width: 1),
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
                    fillColor: providers.isDark? ColorsManagers.darkCardColor : ColorsManagers.veryLightGrayBlue,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(right: 35, top: 20),
                alignment: Alignment.bottomRight,
                child: ForgotPasswordWidget(
                  fontSize: 18,
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.forgotPassword);
                  },
                  text: 'Forgot Password ??',
                )),
            SizedBox(
              height: 40,
            ),
            CustomAuthButton(
              onPressed: () async {
                controller.submetLogin(formKey,context);
                if (formKey.currentState!.validate() == false ) {
                  return; // Exit if the form is not valid or the image is missing
                }
                try{
                  await auth.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login succssful"),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.fixed, // Optional: Keeps the snackbar in the same place
                    ),
                  );
                  Navigator.pushReplacementNamed(context, RoutesNames.splash);
                }
                catch(error){
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
              text: "Sign In",
              width: 330,
            ),
            SizedBox(
              height: 20,
            ),
            CustomOrText(fontSize: 20),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAuthButton(
                  onPressed: () async {
                    await controller.signUpWithGoogle(context: context);
                  },
                  text: "Sign In With google",
                  icon: Ionicons.logo_google,
                ),
                SizedBox(
                  width: 20,
                ),
                CustomAuthButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutesNames.root);
                  },
                  text: "Guest ??",
                  width: 100,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Dont Have Account ?? ", fontSize: 20),
                SizedBox(
                  width: 10,
                ),
                ForgotPasswordWidget(
                  fontSize: 20,
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.register);
                  },
                  text: 'Sign Up',
                )
              ],
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Login As Admin ?? ", fontSize: 20),
                SizedBox(
                  width: 10,
                ),
                ForgotPasswordWidget(
                  fontSize: 20,
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.adminLoginScreen);
                  },
                  text: 'Login',
                )
              ],
            ),
          ],
        ),
      ),
    ))));
  }
}
