import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/core/themes/theme_provider.dart';
import 'package:tgs_info_app_flutter/presentation/views/feedback/feedback_page_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/profile/profile_view.dart';

class SettingsPageView extends StatefulWidget {
  final Map<String, String> user;
  const SettingsPageView({super.key, required this.user});
  
 

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _sectionTitle("Kullanıcı"),
          _tile(
            icon: FeatherIcons.user,
            title: "Profil Bilgileri",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView(user: widget.user)));
            },
          ),
          const SizedBox(height: 24),
          _sectionTitle("Görünüm"),
          themeSelectorTile(themeProvider),
          const SizedBox(height: 24),
          _sectionTitle("Dil"),
          _tile(icon: FeatherIcons.globe, title: "Dil Seçimi", trailing: "Türkçe", onTap: () {}),

          const SizedBox(height: 24),
          _sectionTitle("Destek"),
          _tile(
            icon: FeatherIcons.mail,
            title: "Bize Ulaşın",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
            },
          ),

          const SizedBox(height: 24),
          _tile(icon: FeatherIcons.info, title: "Sürüm", trailing: "v1.0.0"),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _tile({required IconData icon, required String title, String? trailing, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).iconTheme.color, size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: 15.5, color: Theme.of(context).textTheme.bodySmall?.color)),
            ),
            if (trailing != null)
              Text(
                trailing,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyLarge!.color, // Tema ile dinamik metin rengi
                ),
              ),
            if (onTap != null)
              Icon(
                FeatherIcons.chevronRight,
                color: Theme.of(context).iconTheme.color,
                size: 18,
              ), // Tema ile dinamik ikon
          ],
        ),
      ),
    );
  }

  Widget _switchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).iconTheme.color, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: TextStyle(fontSize: 15.5, color: Theme.of(context).textTheme.bodyLarge!.color)),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.snackBarGreen,
            inactiveTrackColor: Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }

  Widget themeSelectorTile(ThemeProvider themeProvider) {
    return _tile(
      icon: FeatherIcons.moon,
      title: "Tema",
      trailing:
          themeProvider.themeMode == ThemeMode.light
              ? "Açık"
              : themeProvider.themeMode == ThemeMode.dark
              ? "Koyu"
              : "Sistem",
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder:
              (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      "Sistem",
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color), // Tema ile dinamik metin
                    ),
                    onTap: () {
                      themeProvider.setTheme(ThemeMode.system);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Açık",
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color), // Tema ile dinamik metin
                    ),
                    onTap: () {
                      themeProvider.setTheme(ThemeMode.light);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Koyu",
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color), // Tema ile dinamik metin
                    ),
                    onTap: () {
                      themeProvider.setTheme(ThemeMode.dark);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
        );
      },
    );
  }
}
