import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class ProfileView extends StatefulWidget {
  final Map<String, String> user;
  const ProfileView({super.key, required this.user});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              "Profil Detayları",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.2), width: 4),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12, spreadRadius: 2)],
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(Icons.person, size: 100, color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildProfileItem(context, icon: Icons.person_outline_rounded, title: "${widget.user["name"]}"),
                  const SizedBox(height: 16),
                  _buildProfileItem(context, icon: Icons.email_outlined, title: "${widget.user["email"]}"),
                  const SizedBox(height: 16),
                  _buildProfileItem(context, icon: Icons.work_outline, title: "${widget.user["bio"]}"),
                  const SizedBox(height: 16),
                  _buildProfileItem(context, icon: Icons.calendar_today_outlined, title: "${widget.user["birthDate"]}"),
                  const SizedBox(height: 16),
                  _buildProfileItem(context, icon: Icons.location_on_outlined, title: "${widget.user["location"]}"),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }



  Widget _buildProfileItem(BuildContext context, {required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cardColor3,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.borderColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: AppColors.borderColor, size: 28),
        ],
      ),
    );
  }
}
