import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ServiceHoursViewModel with ChangeNotifier {
  final Map<String, List<Map<String, String>>> _serviceHours = {
    'Arnavutköy': [
      {'time': '05:15'},
      {'time': '05:40'},
      {'time': '06:00'},
      {'time': '07:45'},
      {'time': '09:00'},
      {'time': '11:00'},
      {'time': '11:00'},
      {'time': '13:00'},
      {'time': '13:00'},
      {'time': '15:00'},
      {'time': '17:00'},
    ],
    'Ataşehir': [
      {'time': '06:20'},
      {'time': '08:00'},
    ],
    'Avcılar': [
      {'time': '05:30'},
      {'time': '07:15'},
    ],
    'Beşiktaş': [
      {'time': '07:00'},
      {'time': '09:15'},
    ],
  };

  final Map<String, LatLng> _districtCoordinates = {
    'Arnavutköy': LatLng(41.1956, 28.7402),
    'Ataşehir': LatLng(40.9922, 29.1244),
    'Avcılar': LatLng(40.9790, 28.7210),
    'Beşiktaş': LatLng(41.0438, 29.0094),
  };

  String _selectedDistrict = 'Arnavutköy';

  ServiceHoursViewModel({required Map<String, String> user}) {
    _initializeSelectedDistrict(user);
  }

  void _initializeSelectedDistrict(Map<String, String> user) {
    String? userLocation = user['location']?.trim();
    String? userName = user['name']?.trim();
    print("ServiceHoursViewModel: Kullanıcı: $userName, Konum: $userLocation");

    if (userLocation == null || userLocation.isEmpty) {
      print("Uyarı: Kullanıcının konumu null veya boş! Varsayılan atanıyor.");
      _selectedDistrict = 'Arnavutköy';
    } else {
      String normalizedLocation = userLocation.toLowerCase().trim();
      _selectedDistrict = _serviceHours.keys.firstWhere(
        (key) => key.toLowerCase() == normalizedLocation,
        orElse: () => 'Arnavutköy',
      );
    }
    print("ServiceHoursViewModel: Seçilen İlçe: $_selectedDistrict");
    notifyListeners();
  }

  String get selectedDistrict => _selectedDistrict;

  List<Map<String, String>> get serviceHoursForDistrict =>
      _serviceHours[_selectedDistrict] ?? [];

  Map<String, LatLng> get districtCoordinates => _districtCoordinates;
}