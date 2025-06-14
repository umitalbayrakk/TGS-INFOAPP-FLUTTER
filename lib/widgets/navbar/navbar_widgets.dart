import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_page/flight_page.dart';
import 'package:tgs_info_app_flutter/presentation/views/home/home_page_screen.dart';
import 'package:tgs_info_app_flutter/presentation/views/phone_number/phone_numbers_views.dart';
import 'package:tgs_info_app_flutter/presentation/views/settings/settings_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';

class ModernGoogleNavBar extends StatefulWidget {
  final Map<String, String> user;

  const ModernGoogleNavBar({super.key, required this.user});

  @override
  State<ModernGoogleNavBar> createState() => _ModernGoogleNavBarState();
}

class _ModernGoogleNavBarState extends State<ModernGoogleNavBar> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  /*************  ✨ Windsurf Command ⭐  *************/
  /// Called when the widget is inserted into the tree.
  ///
  /// Checks if user data is empty and prints a warning message if it is.
  /// Then, initializes the list of pages with the home page, phone numbers page
  /// and settings page.
  /*******  38bf92f5-e317-4072-a1bd-85c6b9ae8a47  *******/
  void initState() {
    super.initState();
    if (widget.user.isEmpty) {
      debugPrint('Uyarı: user verisi boş');
    }
    _pages = [
      HomePageScreen(user: widget.user),
      PhoneNumbersViews(),
      FlightPage(),
      SettingsPageView(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      drawer: CustomDrawer(user: widget.user),
      appBar: AppBarWidgets(),
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(24),
            ),
            child: GNav(
              gap: 6,
              backgroundColor: isDark ? const Color(0xff30444E) : const Color(0xFFFFFFFF),
              tabBackgroundColor: AppColors.cardColor2,
              activeColor: isDark ? Colors.white : AppColors.whiteSpot,
              color: isDark ? Colors.white70 : Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              duration: const Duration(milliseconds: 400),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                try {
                  HapticFeedback.selectionClick();
                } catch (e) {
                  debugPrint('HapticFeedback hatası: $e');
                }
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(icon: Icons.home_rounded, text: 'Ana Sayfa'),
                GButton(icon: Icons.call_rounded, text: 'Telefon'),
                GButton(icon: Icons.flight, text: 'Uçuşlar'),
                GButton(icon: Icons.settings, text: 'Ayarlar'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
