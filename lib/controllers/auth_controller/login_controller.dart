import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shophoria/app/appWidgets/my_app_methods.dart';
import 'package:shophoria/core/routes_managers.dart';

class LoginController {
  Future<void> submetLogin(
      GlobalKey<FormState> mykey, BuildContext context) async {
    bool isValied = mykey.currentState!.validate();
    if (isValied) {}
  }

  Future<void> signUpWithGoogle({required BuildContext context}) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResults = await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesNames.splash, (Route<dynamic> route) => false);
          });
        } on FirebaseException catch (error) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await MyAppMethods.showErrorORWarningDialog(
                context: context,
                subtitle: "An error has happened ${error.message}",
                fct: () {});
          });
        } catch (error) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await MyAppMethods.showErrorORWarningDialog(
                context: context,
                subtitle: "An error has happened ${error}",
                fct: () {});
          });
        }
      }
    }
  }
}
