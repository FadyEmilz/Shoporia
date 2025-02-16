import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/app/appWidgets/custom_sub_text.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/core/assets_managers.dart';
import 'package:shophoria/providers/theme_provider.dart';
import 'package:shophoria/screens/auth/forgotPassword/widgets/forgot_pass_text_widget.dart';
import 'package:shophoria/screens/auth/forgotPassword/widgets/forgot_pass_widget.dart';
import 'package:shophoria/screens/auth/widgets/custom_auth_button.dart';
import 'package:shophoria/screens/home/widgets/shimmer_app_name.dart';

import '../../../core/colors_managers.dart';
import '../../../models/valdators_models.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  late TextEditingController emailController;
  late FocusNode emailFocusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var providers = Provider.of<ThemeProvivder>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ShimmerAppName(fontSize: 30),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              ForgotPassImageWidget(),
              ForgotPassTextWidget(),
              SizedBox(height: 60,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    onFieldSubmitted: (val) {
                      FocusScope.of(context).unfocus();
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
              SizedBox(height: 50,),
              CustomAuthButton(onPressed: (){}, text: "Request Link",icon: Icons.send,width: size.width*.8,)
              

            ],
          ),
        )));
  }
}
