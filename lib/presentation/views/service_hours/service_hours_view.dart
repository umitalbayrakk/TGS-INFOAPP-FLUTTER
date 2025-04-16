import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';

class ServiceHoursView extends StatefulWidget {
  final Map<String, String> user;

  const ServiceHoursView({super.key, required this.user});

  @override
  State<ServiceHoursView> createState() => _ServiceHoursViewState();
}

class _ServiceHoursViewState extends State<ServiceHoursView> {
  final Map<String, List<Map<String, String>>> serviceHours = {
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

  final Map<String, LatLng> districtCoordinates = {
    'Arnavutköy': LatLng(41.1956, 28.7402),
    'Ataşehir': LatLng(40.9922, 29.1244),
    'Avcılar': LatLng(40.9790, 28.7210),
    'Beşiktaş': LatLng(41.0438, 29.0094),
  };

  late String selectedDistrict;

  @override
  void initState() {
    super.initState();
    String? userLocation = widget.user['location']?.trim();
    String? userName = widget.user['name']?.trim();
    print("ServiceHoursView: Kullanıcı: $userName, Konum: $userLocation");

    if (userLocation == null || userLocation.isEmpty) {
      print("Uyarı: Kullanıcının konumu null veya boş! Varsayılan atanıyor.");
      selectedDistrict = 'Arnavutköy';
    } else {
      String normalizedLocation = userLocation.toLowerCase().trim();
      selectedDistrict = serviceHours.keys.firstWhere(
        (key) => key.toLowerCase() == normalizedLocation,
        orElse: () => 'Arnavutköy',
      );
    }
    print("ServiceHoursView: Seçilen İlçe: $selectedDistrict");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(user: widget.user),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.borderColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: AppColors.borderColor, size: 35),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 2,
        shadowColor: AppColors.borderColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 10),
              child: Image.asset("assets/tgs.png", height: 150, width: 150),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(selectedDistrict, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset("assets/images/maps.png", height: 300, width: 400),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: serviceHours[selectedDistrict]!.length,
                      itemBuilder: (context, index) {
                        final item = serviceHours[selectedDistrict]![index];
                        return ListTile(
                          leading: const Icon(Bootstrap.alarm),
                          title: Text('Saat: ${item['time']}'),
                          subtitle: const Text('Konum: Dünya Ticaret Merkezi'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
