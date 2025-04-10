import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/day&date/day_and_day_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';

class ServiceHoursView extends StatefulWidget {
  const ServiceHoursView({super.key});

  @override
  State<ServiceHoursView> createState() => _ServiceHoursViewState();
}

class _ServiceHoursViewState extends State<ServiceHoursView> {
  final Map<String, List<Map<String, String>>> serviceHours = {
    'Arnavutköy': [
      {'time': '05:15'},
      {'time': '07:45'},
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

  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidgets(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TimeCard(),
            if (selectedDistrict == null)
              Expanded(
                child: ListView(
                  children:
                      serviceHours.keys.map((district) {
                        return ListTile(
                          title: Text(district, style: const TextStyle(fontSize: 18)),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                          onTap: () {
                            setState(() {
                              selectedDistrict = district;
                            });
                          },
                        );
                      }).toList(),
                ),
              )
            else
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Geri tuşu ve başlık
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              selectedDistrict = null;
                            });
                          },
                        ),
                        Text(selectedDistrict!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Yer tutucu harita
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map, size: 40, color: Colors.grey),
                            SizedBox(height: 8),
                            Text("Harita burada görüntülenecek", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Servis saatleri listesi
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
