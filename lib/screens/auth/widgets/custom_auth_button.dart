import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/core/colors_managers.dart';
import 'package:shophoria/providers/theme_provider.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon, this.width,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    var providers = Provider.of<ThemeProvivder>(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor: ColorsManagers.lightGrey,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) // Conditionally display the icon
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(icon, size: 20,color:  ColorsManagers.darkPrimary ),
              ),
            Text(
              text,
              style: TextStyle(fontSize: 16,color:  ColorsManagers.darkPrimary  ),
            ),
          ],
        ),
      ),
    );
  }
}
