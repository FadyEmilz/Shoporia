import 'package:flutter/material.dart';
import 'package:shophoria/core/colors_managers.dart';

class ThemeManangers {
  static ThemeData themeData(
      {required BuildContext context, required bool isDark}) {
    return ThemeData(
      iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      cardColor: isDark ? ColorsManagers.darkCardColor : ColorsManagers.lightCardColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDark
            ? ColorsManagers.darkScaffoldColor
            : ColorsManagers.lightScaffoldColor,

      appBarTheme: AppBarTheme(backgroundColor: isDark
          ? ColorsManagers.darkScaffoldColor
          : ColorsManagers.lightScaffoldColor,elevation: 0,
      titleTextStyle: TextStyle(color:isDark
          ? Colors.white
          : Colors.black )
      )
    );
  }
}
