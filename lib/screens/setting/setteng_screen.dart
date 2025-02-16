import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/providers/theme_provider.dart';

class SettengScreen extends StatelessWidget {
  const SettengScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var probider = Provider.of<ThemeProvivder>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(value: probider.isDark, onChanged: (val){
         probider.setTheme(currentTheme: val);
        }),
      ),
    );
  }
}
