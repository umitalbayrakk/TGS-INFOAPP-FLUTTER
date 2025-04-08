import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/home/home_page_screen.dart';
import 'package:tgs_info_app_flutter/presentation/views/phone_number/phone_numbers_views.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class CustomNavbarWidgets extends StatefulWidget {
  const CustomNavbarWidgets({super.key});

  @override
  State<CustomNavbarWidgets> createState() => _CustomNavbarWidgetsState();
}

class _CustomNavbarWidgetsState extends State<CustomNavbarWidgets> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: IndexedStack(index: _selectedIndex, children: const [HomePageScreen(), PhoneNumbersViews()])),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: ClipRRect(
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0 ? AppColors.borderColor.withOpacity(0.2) : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        FeatherIcons.home,
                        size: 32,
                        color: _selectedIndex == 0 ? AppColors.borderColor : AppColors.borderColor,
                      ),
                    ),
                    label: "Anasayfa",
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1 ? AppColors.borderColor.withOpacity(0.2) : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        FeatherIcons.phoneCall,
                        size: 32,
                        color: _selectedIndex == 1 ? AppColors.borderColor : AppColors.borderColor,
                      ),
                    ),
                    label: "Telefon",
                  ),
                ],
                backgroundColor: AppColors.scaffoldBackgroundColor,
                selectedItemColor: AppColors.borderColor,
                unselectedItemColor: AppColors.borderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
