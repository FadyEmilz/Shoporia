import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shophoria/app/appWidgets/my_app_methods.dart';

class RegisterController {
  Future<void> submitRegister(
      {required GlobalKey<FormState> mykey,
        required XFile? pickedImaeg,
        required BuildContext context}) async {

    // Validate the form
    bool isValid = mykey.currentState!.validate();

    // If the form is not valid, return early and don't proceed
    if (!isValid) {
      MyAppMethods.showErrorORWarningDialog(
          context: context,
          subtitle: "Please fix the errors in the form.",
          fct: () {});
      return; // Prevent further code execution
    }

    // Save form data if valid
    mykey.currentState!.save();

    // Check if the image is null and show an error if it is
    if (pickedImaeg == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "Please enter photo", fct: () {});
      return; // Prevent further code execution if no image is selected
    }

    // Proceed with the user account creation process
    try {
      // Add your account creation logic here
      // Example:
      // await auth.createUserWithEmailAndPassword(...);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Account created successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (error) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "$error", fct: () {});
    }
  }
}
