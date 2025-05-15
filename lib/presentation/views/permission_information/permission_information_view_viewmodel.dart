import 'package:flutter/material.dart';

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
  ];

  PermissionModel() {
    _calculateUsedDays();
  }

  void _calculateUsedDays() {
    usedAnnualDays = permissions
        .where((p) => p['type'] == 'Yıllık İzin' && p['status'] == 'Approved')
        .length;
    usedExcuseDays = permissions
        .where((p) => p['type'] == 'Mazeret İzni' && p['status'] == 'Approved')
        .length;
    notifyListeners();
  }

  int get remainingAnnualDays => annualEntitlement - usedAnnualDays;

  int get pendingDays =>
      permissions.where((p) => p['status'] == 'Pending').length;

  List<Map<String, dynamic>> get permissionHistory => permissions;
}