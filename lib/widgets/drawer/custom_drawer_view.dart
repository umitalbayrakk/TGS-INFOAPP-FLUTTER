import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/drawer_viewmodel.dart';
import 'package:tgs_info_app_flutter/presentation/views/corporate_agreements/corporate_agreements_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_time/flight_time_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/permission_information/permission_information_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/service_hours/service_hours_view.dart';
import 'package:tgs_info_app_flutter/presentation/views/useful_document/useful_document_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

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
    debugPrint("CustomDrawer build çağrıldı");
    return Drawer(
      elevation: 0,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: buildMenuItems(context)),
            //Text("TURKISH GROUNDS SERVICES", style: Theme.of(context).textTheme.bodyLarge),
            //const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      accountName: Row(
        children: [
          Icon(FeatherIcons.user, size: 20),
          SizedBox(width: 5),
          Text(
            "${widget.user['name']}",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      accountEmail: Row(
        children: [
          Icon(FeatherIcons.mail, size: 18),
          SizedBox(width: 5),
          Text(
            "${widget.user['email']}",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              tile(
                context: context,
                icon: Icons.assignment_ind_outlined,
                title: "İzin Bilgileri",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PermissionInformationView(user: widget.user)),
                  );
                },
              ),
              Divider(),
              tile(
                context: context,
                icon: Icons.flight,
                title: "Uçuş Bilgileri",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FlightTimeView()));
                },
              ),
              Divider(),
              tile(
                context: context,
                icon: Icons.car_crash,
                title: "Servis Saatleri",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceHoursView(user: widget.user)));
                },
              ),
              Divider(),
              tile(
                context: context,
                icon: Icons.business_center_outlined,
                title: "Kurumsal Anlaşmalar",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CorporateAgreementsView()));
                },
              ),
              Divider(),
              tile(
                context: context,
                icon: Icons.document_scanner_outlined,
                title: "Faydalı Dökümanlar",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsefulDocumentView(user: widget.user)),
                  );
                },
              ),
              Divider(),
              //    tile(
              //     context: context,
              //       icon: Icons.currency_exchange,
              //      title: "Döviz Kurları",
              // onTap: () {
              //    Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyScreen()));
              //  },
              // ),
              // tile(
              //   context: context,
              //  icon: WeatherIcons.day_sunny,
              //  title: "Hava Durumu",
              //   onTap: () {
              //    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherView()));
              //  },
              //  ),
            ],
          ),
        ),
      ],
    );
  }

  /* Widget _buildMenuItems(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.8,
      children: [
        /* CustomNavigationButton(
          title: 'Ayarlar',
          navigateTo: SettingsPageView(user: widget.user),
          icon: Icons.settings_outlined,
        ), */
        CustomNavigationButton(
          title: 'Fikir Öneri İstek',
          navigateTo: const FeedbackPage(),
          icon: Icons.feedback_outlined,
        ),
        CustomNavigationButton(
          title: 'İzin Bilgileri',
          navigateTo: PermissionInformationView(user: widget.user),
          icon: Icons.assignment_ind_outlined,
        ),
        // CustomNavigationButton(title: 'Telefon', navigateTo: const PhoneNumbersViews(), icon: Icons.phone),
        CustomNavigationButton(title: 'Uçuş Saatleri', navigateTo: const FlightTimeView(), icon: Icons.flight),
        CustomNavigationButton(
          title: 'Servis Saatleri',
          navigateTo: ServiceHoursView(user: widget.user),
          icon: Icons.car_crash,
        ),
        CustomNavigationButton(
          title: 'Kurumsal Anlaşmalar',
          navigateTo: const CorporateAgreementsView(),
          icon: Icons.business_center_outlined,
        ),
        CustomNavigationButton(
          title: 'Faydalı Dökümanlar',
          navigateTo: UsefulDocumentView(user: widget.user),
          icon: Icons.document_scanner_outlined,
        ),
        CustomNavigationButton(title: 'Döviz Kurları', navigateTo: CurrencyScreen(), icon: Icons.currency_exchange),
        CustomNavigationButton(title: 'Hava Durumu', navigateTo: WeatherView(), icon: WeatherIcons.day_sunny),
      ],
    );
  }
*/
  /* Widget _buildLogoutButton(BuildContext context) {
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
          decoration: BoxDecoration(color: AppColors.buttonColor, borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FeatherIcons.logOut, color: AppColors.whiteSpot, size: 20),
                SizedBox(width: 8),
                Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: AppColors.whiteSpot,
                    fontWeight: FontWeight.bold,
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

*/
  /* ImageProvider? _getProfileImage() {
    if (_viewModel.image != null) {
      return FileImage(_viewModel.image!);
    }
    return null;
  }

  Future<void> _handleImagePick() async {
    await _viewModel.pickImage();
    if (mounted) setState(() {});
  }
*/
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.buttonColor),
          child: MaterialButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo));
            },
            child: Icon(icon, color: AppColors.whiteSpot, size: 30),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

Widget tile({
  required BuildContext context,
  required IconData icon,
  required String title,
  String? trailing,
  VoidCallback? onTap,
}) {
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
            Text(trailing, style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyLarge!.color)),
          if (onTap != null) Icon(FeatherIcons.chevronRight, color: Theme.of(context).iconTheme.color, size: 18),
        ],
      ),
    ),
  );
}
