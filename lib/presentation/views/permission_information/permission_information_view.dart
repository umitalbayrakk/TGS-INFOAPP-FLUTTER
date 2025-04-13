import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class PermissionModel with ChangeNotifier {
  int annualEntitlement = 15;
  int usedAnnualDays = 0;
  int usedExcuseDays = 0;

  final List<Map<String, dynamic>> permissions = [
    {'date': '2024-01-10', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-01-11', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-01-12', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-03-15', 'type': 'Mazeret İzni', 'status': 'Approved'},
    {'date': '2024-05-20', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-05-21', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-07-01', 'type': 'Mazeret İzni', 'status': 'Approved'},
    {'date': '2024-09-10', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-09-11', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-11-05', 'type': 'Yıllık İzin', 'status': 'Approved'},
    {'date': '2024-12-01', 'type': 'Mazeret İzni', 'status': 'Rejected'},
    {'date': '2025-01-15', 'type': 'Yıllık İzin', 'status': 'Pending'},
    {'date': '2025-01-16', 'type': 'Yıllık İzin', 'status': 'Pending'},
    {'date': '2025-02-10', 'type': 'Mazeret İzni', 'status': 'Pending'},
    {'date': '2025-03-01', 'type': 'Yıllık İzin', 'status': 'Pending'},
  ];

  PermissionModel() {
    _calculateUsedDays();
  }

  void _calculateUsedDays() {
    usedAnnualDays = permissions.where((p) => p['type'] == 'Yıllık İzin' && p['status'] == 'Approved').length;
    usedExcuseDays = permissions.where((p) => p['type'] == 'Mazeret İzni' && p['status'] == 'Approved').length;
  }

  int get remainingAnnualDays => annualEntitlement - usedAnnualDays;
  int get pendingDays => permissions.where((p) => p['status'] == 'Pending').length;
}

class PermissionInformationView extends StatelessWidget {
  const PermissionInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PermissionModel(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBarWidgets(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _PermissionStatusCard(),
                const SizedBox(height: 24),
                Text(
                  'İzin Geçmişi',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey[800]),
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

class _PermissionStatusCard extends StatelessWidget {
  const _PermissionStatusCard();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PermissionModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey[200]!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'İzin Durumu',
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
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStatCard('Kullanılan Yıllık', '${model.usedAnnualDays} Gün', Colors.red, Icons.work_history),
            const SizedBox(width: 8),
            _buildStatCard('Kalan Yıllık', '${model.remainingAnnualDays} Gün', Colors.green, Icons.beach_access),
            const SizedBox(width: 8),
            _buildStatCard('Mazeret İzni', '${model.usedExcuseDays} Gün', Colors.orange, Icons.warning_amber),
          ],
        ),
        if (model.pendingDays > 0)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Bekleyen: ${model.pendingDays} Gün',
              style: const TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
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
      itemCount: model.permissions.length,
      itemBuilder: (context, index) {
        final permission = model.permissions[index];
        final date = DateFormat('dd MMMM yyyy', 'tr').format(DateTime.parse(permission['date']));

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: ListTile(
            leading: Icon(
              permission['type'] == 'Yıllık İzin' ? Icons.beach_access : Icons.warning_amber,
              color: permission['type'] == 'Yıllık İzin' ? Colors.blue : Colors.orange,
            ),
            title: Text(permission['type'], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(date, style: TextStyle(color: Colors.grey[600])),
            trailing: _buildStatusChip(permission['status']),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    final Map<String, Color> statusColors = {
      'Approved': Colors.green,
      'Pending': Colors.orange,
      'Rejected': Colors.red,
    };

    return Chip(
      label: Text(
        status == 'Approved'
            ? 'Onaylandı'
            : status == 'Pending'
            ? 'Beklemede'
            : 'Reddedildi',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: statusColors[status]!,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
