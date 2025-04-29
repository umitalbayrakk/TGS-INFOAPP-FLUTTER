import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidgets({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black), // Status bar'ı göster
      iconTheme: IconThemeData(color: AppColors.borderColor, size: 35),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 2,
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
