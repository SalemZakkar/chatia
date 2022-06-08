import 'package:chatia/module_theme/bloc/theme_cubit.dart';
import 'package:chatia/module_theme/model/theme_manager.dart';
import 'package:flutter/material.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({Key? key}) : super(key: key);

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  bool isDark = ThemeManager.getTheme() == 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Container(
      width: size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: themeData.cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Dark Mode",
            style: TextStyle(
                color: themeData.textTheme.subtitle1?.color, fontSize: 20),
          ),
          Switch(
            value: isDark,
            onChanged: (value) {
              int? i;
              if (isDark) {
                i = 0;
              } else {
                i = 1;
              }
              themeCubit.changedTheme(i);
              setState(() {
                isDark = value;
              });
            },
          )
        ],
      ),
    );
  }
}
