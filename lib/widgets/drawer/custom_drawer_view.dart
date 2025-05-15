import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/corporate_agreements/corporate_agreements_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_time/flight_time_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/permission_information/permission_information_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/service_hours/service_hours_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/useful_document/useful_document_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawe_view_viewmodel.dart';

class CustomDrawer extends StatefulWidget {
  final Map<String, String> user;

  const CustomDrawer({super.key, required this.user});

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
    return Drawer(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        decoration: BoxDecoration(),
        child: SafeArea(
          child: Column(
            children: [_buildHeader(context), Expanded(child: _buildMenuItems(context)), _buildFooter(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Theme.of(context).iconTheme.color,
          child: Icon(Icons.person, size: 80),
        ),
        const SizedBox(height: 16),
        Text(
          widget.user['name'] ?? 'User Name',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.user['email'] ?? 'user@example.com',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    const menuItems = [
      MenuItemModel(
        icon: Icons.assignment_ind_outlined,
        title: 'İzin Bilgileri',
        route: PermissionInformationView(user: {}),
      ),
      MenuItemModel(icon: Icons.flight, title: 'Uçuş Bilgileri', route: FlightTimeView()),
      MenuItemModel(icon: Icons.directions_bus, title: 'Servis Saatleri', route: ServiceHoursView(user: {})),
      MenuItemModel(
        icon: Icons.business_center_outlined,
        title: 'Kurumsal Anlaşmalar',
        route: CorporateAgreementsView(),
      ),
      MenuItemModel(
        icon: Icons.document_scanner_outlined,
        title: 'Faydalı Dökümanlar',
        route: UsefulDocumentView(user: {}),
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return ModernMenuTile(
          icon: item.icon,
          title: item.title,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => item.route));
          },
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Çıkış Yapıldı'), backgroundColor: AppColors.snackBarGreen));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).iconTheme.color!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FeatherIcons.logOut, color: Theme.of(context).iconTheme.color, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Çıkış Yap',
                    style: TextStyle(color: Theme.of(context).iconTheme.color, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'TURKISH GROUND SERVICES',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).textTheme.bodySmall?.color),
          ),
        ],
      ),
    );
  }
}

class ModernMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ModernMenuTile({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).iconTheme.color!),
        ),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).iconTheme.color, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(FeatherIcons.chevronRight, color: Theme.of(context).iconTheme.color, size: 20),
          ],
        ),
      ),
    );
  }
}

class MenuItemModel {
  final IconData icon;
  final String title;
  final Widget route;

  const MenuItemModel({required this.icon, required this.title, required this.route});
}
