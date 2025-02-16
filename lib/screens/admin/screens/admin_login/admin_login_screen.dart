import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/controllers/auth_controller/admin_login_controller.dart';

import '../../../../app/appWidgets/custom_text.dart';
import '../../../../core/colors_managers.dart';
import '../../../../core/routes_managers.dart';
import '../../../../models/valdators_models.dart';
import '../../../../providers/theme_provider.dart';
import '../../../auth/widgets/custom_auth_button.dart';
import '../../../auth/widgets/forgot_password_widget.dart';
import '../../../auth/widgets/welcome_text.dart';
import '../../../home/widgets/shimmer_app_name.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  GlobalKey<FormState> formKey = GlobalKey();
  late AdminLoginController controller;
  bool isObsecure = false;

  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    controller = AdminLoginController();
    super.initState();
  }
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
      appBar: AppBar(),
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
                                text: "Welcome Admin",
                                subText:
                                "lets get you logged in so you can start managing")),
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

                        SizedBox(
                          height: 40,
                        ),
                        CustomAuthButton(
                          onPressed: () {
                            controller.submetLogin(formKey,context);
                          },
                          text: "Sign In",
                          width: 330,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 20,
                            ),
                            CustomAuthButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, RoutesNames.dashboardScreen);
                              },
                              text: "Guest ??",
                              width: 100,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),



                      ],
                    ),
                  ),
                ))));
  }
}
