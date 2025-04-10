import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/drawer_viewmodel.dart';
import 'package:tgs_info_app_flutter/presentation/views/corporate_agreements/corporate_agreements_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/feedback/feedback_page_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/login/login_page_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/permission_information/permission_information_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/settings/settings_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/useful_document/useful_document_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late final CustomDrawerViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CustomDrawerViewModel();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _viewModel.loadImage();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("CustomDrawer build çağrıldı");
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
      child: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildMenuItems(context)),
            _buildLogoutButton(context),
            const Text(
              "TURKISH GROUNS SERVICES",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.borderColor),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.scaffoldBackgroundColor, AppColors.scaffoldBackgroundColor],
        ),
      ),
      accountName: const Text(
        'Kullanıcı Adı',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.borderColor),
      ),
      accountEmail: const Text('tgs@aero.com', style: TextStyle(color: AppColors.borderColor)),
      currentAccountPicture: GestureDetector(
        onTap: () => _handleImagePick(),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.borderColor,
          backgroundImage: _getProfileImage(),
          child: _viewModel.image == null ? const Icon(Icons.person, size: 35, color: Colors.white70) : null,
        ),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildMenuItem(
          context: context,
          icon: FeatherIcons.settings,
          title: 'Ayarlar',
          onTap: () {
            debugPrint("Ayarlar'a tıklanıldı");
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const SettingsPageView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: FeatherIcons.messageSquare,
          title: 'Fikir Öneri İstek',
          onTap: () {
            debugPrint("Fikir Öneri İstek'e tıklanıldı");
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const FeedbackPage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: FeatherIcons.send,
          title: 'İzin Bilgileri',
          onTap: () {
            debugPrint("Fikir Öneri İstek'e tıklanıldı");
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const PermissionInformationView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        ),

        _buildMenuItem(
          context: context,
          icon: FeatherIcons.list,
          title: 'Kurumsal Anlaşmalar',
          onTap: () {
            debugPrint("Fikir Öneri İstek'e tıklanıldı");
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const CorporateAgreementsView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        ),
        _buildMenuItem(
          context: context,
          icon: FeatherIcons.package,
          title: 'Faydalı Dökümanlar',
          onTap: () {
            debugPrint("Fikir Öneri İstek'e tıklanıldı");
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const UsefulDocumentView(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title, style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.transparent,
      hoverColor: Colors.grey[200],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Başarılı Bir Şekilde Çıkış Yapıldı"),
              backgroundColor: AppColors.snackBarGreen,
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.snackBarGreen, AppColors.snackBarGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FeatherIcons.logOut, color: AppColors.generalBackground, size: 20),
                SizedBox(width: 8),
                Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: AppColors.generalBackground,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider? _getProfileImage() {
    if (_viewModel.image != null) {
      return FileImage(_viewModel.image!);
    }
    return null;
  }

  Future<void> _handleImagePick() async {
    await _viewModel.pickImage();
    if (mounted) setState(() {});
  }
}
