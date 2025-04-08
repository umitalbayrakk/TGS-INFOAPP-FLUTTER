import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class PermissionModel with ChangeNotifier {
  int totalDays = 30;
  int usedDays = 0;
  List<Map<String, String>> permissions = [];
  final Map<String, Timer> _pendingTimers = {};

  PermissionModel() {
    _loadPermissions();
  }

  Future<void> _loadPermissions() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPermissions = prefs.getString('permissions');
    if (savedPermissions != null) {
      permissions = List<Map<String, String>>.from(
        json.decode(savedPermissions).map((item) => Map<String, String>.from(item)),
      );
      usedDays = permissions.where((p) => p['status'] == 'Approved' && p['type'] != 'Ücretsiz İzin').length;
    }
    _startPendingTimers();
    notifyListeners();
  }

  Future<void> _savePermissions() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('permissions', json.encode(permissions));
  }

  void _startPendingTimers() {
    for (var permission in permissions) {
      if (permission['status'] == 'Pending') {
        _scheduleAutoApproval(permission);
      }
    }
  }

  void _scheduleAutoApproval(Map<String, String> permission) {
    final key = '${permission['date']}_${permission['type']}';
    _pendingTimers[key]?.cancel();

    final timer = Timer(const Duration(minutes: 1), () {
      // 1 dakika olarak ayarlandı (test için)
      final index = permissions.indexWhere(
        (p) => p['date'] == permission['date'] && p['type'] == permission['type'] && p['status'] == 'Pending',
      );

      if (index != -1) {
        permissions[index]['status'] = 'Approved';
        if (permissions[index]['type'] != 'Ücretsiz İzin') {
          usedDays++;
        }
        _pendingTimers.remove(key);
        _savePermissions();
        notifyListeners();
      }
    });

    _pendingTimers[key] = timer;
  }

  void addPermission(String type, DateTime date) {
    final newPermission = {'date': DateFormat('yyyy-MM-dd').format(date), 'type': type, 'status': 'Pending'};
    permissions.insert(0, newPermission);
    _scheduleAutoApproval(newPermission);
    _savePermissions();
    notifyListeners();
  }

  void removePermission(int index) {
    if (index < permissions.length) {
      final permission = permissions[index];
      final key = '${permission['date']}_${permission['type']}';
      if (permission['status'] == 'Approved' && permission['type'] != 'Ücretsiz İzin') {
        usedDays--;
      }
      _pendingTimers[key]?.cancel();
      _pendingTimers.remove(key);
      permissions.removeAt(index);
      _savePermissions();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _pendingTimers.forEach((_, timer) => timer.cancel());
    _pendingTimers.clear();
    super.dispose();
  }
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
                const SizedBox(height: 24),
                const _NewRequestButton(),
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
    final pendingDays = model.permissions.where((p) => p['status'] == 'Pending' && p['type'] != 'Ücretsiz İzin').length;

    return Card(
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
            Text('İzin Durumu', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusItem('Toplam', '${model.totalDays} Gün', Colors.grey[700]!),
                _buildStatusItem('Kullanılan', '${model.usedDays} Gün', Colors.red),
                _buildStatusItem('Kalan', '${model.totalDays - model.usedDays} Gün', Colors.green),
              ],
            ),
            if (pendingDays > 0) ...[
              const SizedBox(height: 12),
              Text(
                'Bekleyen: $pendingDays Gün',
                style: const TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.w500),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String title, String value, Color valueColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: valueColor)),
        const SizedBox(height: 4),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
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
        final date = DateFormat('dd MMMM yyyy', 'tr').format(DateTime.parse(permission['date']!));

        return Dismissible(
          key: Key('${permission['date']}$index'),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => model.removePermission(index),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: Card(
            elevation: 0,
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(permission['type']!, style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(date),
              trailing: _buildStatusChip(permission['status']!),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    final statusColors = {'Approved': Colors.green, 'Rejected': Colors.red, 'Pending': Colors.orange};

    return Chip(
      label: Text(
        status == 'Approved'
            ? 'Onaylandı'
            : status == 'Rejected'
            ? 'Reddedildi'
            : 'Beklemede',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: statusColors[status],
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

class _NewRequestButton extends StatelessWidget {
  const _NewRequestButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => _showRequestDialog(context),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.borderColor,
        foregroundColor: AppColors.scaffoldBackgroundColor,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text('Yeni İzin Talebi', style: TextStyle(fontSize: 16)),
    );
  }

  void _showRequestDialog(BuildContext context) {
    String? selectedType;
    DateTime? selectedDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder:
          (dialogContext) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(dialogContext).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yeni İzin Talebi',
                    style: Theme.of(dialogContext).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'İzin Türü', border: OutlineInputBorder()),
                    items:
                        [
                          'Yıllık İzin',
                          'Hastalık İzni',
                          'Ücretsiz İzin',
                        ].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                    onChanged: (value) => selectedType = value,
                    validator: (value) => value == null ? 'Lütfen bir tür seçin' : null,
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () async {
                      selectedDate = await showDatePicker(
                        context: dialogContext,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2025),
                        lastDate: DateTime(2026),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(primary: Colors.blue, onPrimary: Colors.white),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (selectedDate != null) {
                        (dialogContext as Element).markNeedsBuild();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      side: const BorderSide(color: AppColors.borderColor),
                    ),
                    child: Text(
                      selectedDate == null ? 'Tarih Seç' : DateFormat('dd MMMM yyyy', 'tr').format(selectedDate!),
                      style: const TextStyle(color: AppColors.borderColor),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: const Text('İptal', style: TextStyle(color: Colors.red)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            if (selectedType != null && selectedDate != null) {
                              try {
                                Provider.of<PermissionModel>(
                                  context,
                                  listen: false,
                                ).addPermission(selectedType!, selectedDate!);
                                Navigator.pop(dialogContext);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text('İzin talebiniz oluşturuldu. Otomatik onaylanacaktır.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text('Hata oluştu: $e'), backgroundColor: Colors.red));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Lütfen tüm alanları doldurun'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.borderColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Gönder'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: const PermissionInformationView(), theme: ThemeData(useMaterial3: true)));
}
