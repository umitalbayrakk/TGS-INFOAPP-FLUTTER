import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/feedback/feedback_page_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({super.key});

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _sectionTitle("Kullanıcı"),
          _tile(icon: FeatherIcons.user, title: "Profil Bilgileri", onTap: () {}),

          const SizedBox(height: 24),
          _sectionTitle("Görünüm"),
          _themeSelectorTile(),

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
        style: const TextStyle(fontSize: 18, color: AppColors.borderColor, fontWeight: FontWeight.w600),
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
          color: AppColors.customCardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.borderColor, size: 20),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 15.5, color: AppColors.borderColor))),
            if (trailing != null) Text(trailing, style: const TextStyle(fontSize: 14, color: AppColors.borderColor)),
            if (onTap != null) const Icon(FeatherIcons.chevronRight, color: AppColors.borderColor, size: 18),
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
        color: AppColors.customCardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.borderColor, size: 20),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 15.5, color: AppColors.borderColor))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.snackBarGreen,
            inactiveTrackColor: AppColors.borderColor.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _themeSelectorTile() {
    return _tile(
      icon: FeatherIcons.moon,
      title: "Tema",
      trailing:
          _themeMode == ThemeMode.light
              ? "Açık"
              : _themeMode == ThemeMode.dark
              ? "Koyu"
              : "Sistem",
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.customCardColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder:
              (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Sistem", style: TextStyle(color: AppColors.borderColor)),
                    onTap: () => _setTheme(ThemeMode.system),
                  ),
                  ListTile(
                    title: const Text("Açık", style: TextStyle(color: AppColors.borderColor)),
                    onTap: () => _setTheme(ThemeMode.light),
                  ),
                  ListTile(
                    title: const Text("Koyu", style: TextStyle(color: AppColors.borderColor)),
                    onTap: () => _setTheme(ThemeMode.dark),
                  ),
                ],
              ),
        );
      },
    );
  }

  void _setTheme(ThemeMode mode) {
    setState(() => _themeMode = mode);
    Navigator.pop(context);
  }
}
