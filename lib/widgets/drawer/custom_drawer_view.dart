import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/drawer_viewmodel.dart';
import 'package:tgs_info_app_flutter/presentation/views/corporate_agreements/corporate_agreements_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/feedback/feedback_page_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_time/flight_time_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/login/login_page_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/permission_information/permission_information_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/phone_number/phone_numbers_views.dart';
import 'package:tgs_info_app_flutter/presentation/views/service_hours/service_hours_view.dart';
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
      backgroundColor: AppColors.darkColor,
      elevation: 0,
      child: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildMenuItems(context)),
            _buildLogoutButton(context),
            const Text(
              "TURKISH GROUNDS SERVICES",
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
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.8,
      children: [
        CustomNavigationButton(title: 'Ayarlar', navigateTo: const SettingsPageView(), icon: Icons.settings_outlined),
        CustomNavigationButton(
          title: 'Fikir Öneri İstek',
          navigateTo: const FeedbackPage(),
          icon: Icons.feedback_outlined,
        ),
        CustomNavigationButton(
          title: 'İzin Bilgileri',
          navigateTo: const PermissionInformationView(),
          icon: Icons.assignment_ind_outlined,
        ),
        CustomNavigationButton(title: 'Telefon', navigateTo: const PhoneNumbersViews(), icon: Icons.phone),
        CustomNavigationButton(title: 'Uçuş Saatleri', navigateTo: const FlightTimeView(), icon: Icons.flight),
        CustomNavigationButton(title: 'Servis Saatleri', navigateTo: const ServiceHoursView(), icon: Icons.car_crash),
        CustomNavigationButton(
          title: 'Kurumsal Anlaşmalar',
          navigateTo: const CorporateAgreementsView(),
          icon: Icons.business_center_outlined,
        ),
        CustomNavigationButton(
          title: 'Faydalı Dökümanlar',
          navigateTo: const UsefulDocumentView(),
          icon: Icons.document_scanner_outlined,
        ),
      ],
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
              colors: [AppColors.cardColor, AppColors.cardColor],
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

class CustomNavigationButton extends StatelessWidget {
  final String title;
  final Widget navigateTo;
  final IconData icon;

  const CustomNavigationButton({Key? key, required this.title, required this.navigateTo, required this.icon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.cardColor),
          child: MaterialButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo));
            },
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
