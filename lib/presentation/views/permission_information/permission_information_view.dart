import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/permission_information_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class PermissionInformationView extends StatefulWidget {
  final Map<String, String> user;
  const PermissionInformationView({super.key, required this.user});

  @override
  State<PermissionInformationView> createState() => _PermissionInformationViewState();
}

class _PermissionInformationViewState extends State<PermissionInformationView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PermissionModel(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBarWidgets(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PermissionStatusCard(user: widget.user),
                SizedBox(height: 10),
                Text(
                  'İzin Geçmişi',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Expanded(child: _PermissionHistoryList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PermissionStatusCard extends StatelessWidget {
  final Map<String, String> user;

  PermissionStatusCard({required this.user});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PermissionModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.cardColor3, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user['name']} İzin Bilgisi",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Yıllık Hak Ediş: ${model.annualEntitlement} Gün',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: model.usedAnnualDays / model.annualEntitlement,
                  backgroundColor: AppColors.cardColor,
                  color: AppColors.appBarColor,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStatCard('Kul.Yıl.İzin', '${model.usedAnnualDays} Gün', AppColors.cardColor, Icons.work_history),
            const SizedBox(width: 8),
            _buildStatCard(
              'Kalan Yıllık',
              '${model.remainingAnnualDays} Gün',
              AppColors.snackBarGreen,
              Icons.beach_access,
            ),
            const SizedBox(width: 8),
            _buildStatCard('Mazeret İzni', '${model.usedExcuseDays} Gün', AppColors.orangeColor, Icons.warning_amber),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor3,
          borderRadius: BorderRadius.circular(16),
          //border: Border.all(color: AppColors.borderColor),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 4))],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}

class _PermissionHistoryList extends StatelessWidget {
  const _PermissionHistoryList();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PermissionModel>(context);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: model.permissionHistory.length,
      itemBuilder: (context, index) {
        final permission = model.permissionHistory[index];
        final date = DateFormat('dd MMMM yyyy', 'tr').format(DateTime.parse(permission['date']));
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(color: AppColors.cardColor3, borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: Icon(
                permission['type'] == 'Yıllık İzin' ? Icons.beach_access : Icons.warning_amber,
                color: permission['type'] == 'Yıllık İzin' ? Colors.blue : Colors.orange,
              ),
              title: Text(permission['type'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(date, style: TextStyle(color: Colors.grey[600])),
            ),
          ),
        );
      },
    );
  }
}
