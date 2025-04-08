import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidgets({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.borderColor, size: 35),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 8,
      shadowColor: AppColors.borderColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 10),
            child: Image.asset("assets/tgs.png", height: 150, width: 150),
          ),
        ],
      ),
    );
  }
}
