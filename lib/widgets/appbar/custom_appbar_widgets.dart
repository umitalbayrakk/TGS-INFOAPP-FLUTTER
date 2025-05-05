import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/core/themes/theme_provider.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidgets({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).appBarTheme.iconTheme!.color,
        size: Theme.of(context).appBarTheme.iconTheme!.size ?? 24,
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 10),
            child: Image.asset("assets/tgs.png", height: 150, width: 150),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            themeProvider.themeMode == ThemeMode.dark ? FeatherIcons.moon : FeatherIcons.sun,
            color: themeProvider.themeMode == ThemeMode.dark ? AppColors.whiteSpot : AppColors.borderColor,
          ),
          onPressed: () {
            themeProvider.setTheme(themeProvider.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
          },
          tooltip: 'Temayı Değiştir',
        ),
      ],
    );
  }
}
