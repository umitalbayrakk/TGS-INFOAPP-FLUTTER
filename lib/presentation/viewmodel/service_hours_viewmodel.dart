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
      {'time': '09:30'},
      {'time': '11:00'},
      {'time': '13:15'},
      {'time': '15:40'},
    ],
    'Avcılar': [
      {'time': '05:30'},
      {'time': '07:15'},
      {'time': '08:45'},
      {'time': '10:30'},
      {'time': '12:00'},
    ],
    'Beşiktaş': [
      {'time': '07:00'},
      {'time': '09:15'},
      {'time': '11:30'},
      {'time': '13:45'},
      {'time': '16:00'},
    ],
    'Bağcılar': [
      {'time': '06:10'},
      {'time': '07:40'},
      {'time': '09:20'},
      {'time': '11:10'},
      {'time': '13:50'},
    ],
    'Bahçelievler': [
      {'time': '06:00'},
      {'time': '07:30'},
      {'time': '09:00'},
      {'time': '10:45'},
      {'time': '12:30'},
    ],
    'Bakırköy': [
      {'time': '06:25'},
      {'time': '08:10'},
      {'time': '09:50'},
      {'time': '11:20'},
      {'time': '13:00'},
    ],
    'Başakşehir': [
      {'time': '05:45'},
      {'time': '07:15'},
      {'time': '09:00'},
      {'time': '10:45'},
      {'time': '12:15'},
    ],
    'Bayrampaşa': [
      {'time': '06:05'},
      {'time': '07:50'},
      {'time': '09:30'},
      {'time': '11:00'},
      {'time': '12:45'},
    ],
    'Beyoğlu': [
      {'time': '06:50'},
      {'time': '08:30'},
      {'time': '10:00'},
      {'time': '11:45'},
      {'time': '13:20'},
    ],
    'Büyükçekmece': [
      {'time': '05:50'},
      {'time': '07:25'},
      {'time': '09:10'},
      {'time': '10:50'},
      {'time': '12:30'},
    ],
    'Çatalca': [
      {'time': '05:40'},
      {'time': '07:10'},
      {'time': '08:50'},
      {'time': '10:30'},
      {'time': '12:10'},
    ],
    'Çekmeköy': [
      {'time': '06:35'},
      {'time': '08:10'},
      {'time': '09:50'},
      {'time': '11:30'},
      {'time': '13:10'},
    ],
    'Esenler': [
      {'time': '06:15'},
      {'time': '07:55'},
      {'time': '09:40'},
      {'time': '11:20'},
      {'time': '13:00'},
    ],
    'Esenyurt': [
      {'time': '05:55'},
      {'time': '07:30'},
      {'time': '09:10'},
      {'time': '10:50'},
      {'time': '12:25'},
    ],
    'Eyüpsultan': [
      {'time': '06:20'},
      {'time': '08:00'},
      {'time': '09:40'},
      {'time': '11:25'},
      {'time': '13:05'},
    ],
    'Fatih': [
      {'time': '06:00'},
      {'time': '07:45'},
      {'time': '09:25'},
      {'time': '11:10'},
      {'time': '12:50'},
    ],
    'Gaziosmanpaşa': [
      {'time': '06:10'},
      {'time': '07:50'},
      {'time': '09:30'},
      {'time': '11:15'},
      {'time': '12:55'},
    ],
    'Güngören': [
      {'time': '06:05'},
      {'time': '07:40'},
      {'time': '09:20'},
      {'time': '11:00'},
      {'time': '12:40'},
    ],
    'Kadıköy': [
      {'time': '06:45'},
      {'time': '08:25'},
      {'time': '10:10'},
      {'time': '11:50'},
      {'time': '13:30'},
    ],
    'Kağıthane': [
      {'time': '06:30'},
      {'time': '08:10'},
      {'time': '09:45'},
      {'time': '11:25'},
      {'time': '13:05'},
    ],
    'Kartal': [
      {'time': '06:55'},
      {'time': '08:40'},
      {'time': '10:20'},
      {'time': '12:00'},
      {'time': '13:40'},
    ],
    'Küçükçekmece': [
      {'time': '06:00'},
      {'time': '07:40'},
      {'time': '09:20'},
      {'time': '11:00'},
      {'time': '12:40'},
    ],
    'Maltepe': [
      {'time': '06:50'},
      {'time': '08:30'},
      {'time': '10:10'},
      {'time': '11:50'},
      {'time': '13:30'},
    ],
    'Pendik': [
      {'time': '06:40'},
      {'time': '08:20'},
      {'time': '10:00'},
      {'time': '11:40'},
      {'time': '13:20'},
    ],
    'Sancaktepe': [
      {'time': '06:30'},
      {'time': '08:10'},
      {'time': '09:50'},
      {'time': '11:30'},
      {'time': '13:10'},
    ],
    'Sarıyer': [
      {'time': '06:15'},
      {'time': '08:00'},
      {'time': '09:40'},
      {'time': '11:20'},
      {'time': '13:00'},
    ],
    'Silivri': [
      {'time': '05:50'},
      {'time': '07:30'},
      {'time': '09:10'},
      {'time': '10:50'},
      {'time': '12:30'},
    ],
    'Sultanbeyli': [
      {'time': '06:35'},
      {'time': '08:15'},
      {'time': '09:55'},
      {'time': '11:35'},
      {'time': '13:15'},
    ],
    'Sultangazi': [
      {'time': '06:05'},
      {'time': '07:50'},
      {'time': '09:30'},
      {'time': '11:10'},
      {'time': '12:50'},
    ],
    'Şile': [
      {'time': '05:40'},
      {'time': '07:20'},
      {'time': '09:00'},
      {'time': '10:40'},
      {'time': '12:20'},
    ],
    'Şişli': [
      {'time': '06:45'},
      {'time': '08:25'},
      {'time': '10:00'},
      {'time': '11:45'},
      {'time': '13:30'},
    ],
    'Tuzla': [
      {'time': '06:55'},
      {'time': '08:35'},
      {'time': '10:15'},
      {'time': '11:55'},
      {'time': '13:35'},
    ],
    'Ümraniye': [
      {'time': '06:20'},
      {'time': '08:00'},
      {'time': '09:40'},
      {'time': '11:20'},
      {'time': '13:00'},
    ],
    'Üsküdar': [
      {'time': '06:30'},
      {'time': '08:10'},
      {'time': '09:50'},
      {'time': '11:30'},
      {'time': '13:10'},
    ],
    'Zeytinburnu': [
      {'time': '06:10'},
      {'time': '07:50'},
      {'time': '09:30'},
      {'time': '11:10'},
      {'time': '12:50'},
    ],
  };

  final Map<String, LatLng> _districtCoordinates = {
    'Arnavutköy': LatLng(41.1956, 28.7402),
    'Ataşehir': LatLng(40.9922, 29.1244),
    'Avcılar': LatLng(40.9790, 28.7210),
    'Beşiktaş': LatLng(41.0438, 29.0094),
  };

  String _selectedDistrict = 'Arnavutköy';

  var user;

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

  List<Map<String, String>> get serviceHoursForDistrict => _serviceHours[_selectedDistrict] ?? [];

  Map<String, LatLng> get districtCoordinates => _districtCoordinates;
}
