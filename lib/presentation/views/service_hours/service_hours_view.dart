import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class ServiceHoursView extends StatefulWidget {
  const ServiceHoursView({super.key});

  @override
  State<ServiceHoursView> createState() => _ServiceHoursViewState();
}

class _ServiceHoursViewState extends State<ServiceHoursView> {
  final List<String> istanbulDistricts = [
    'Arnavutköy',
    'Ataşehir',
    'Avcılar',
    'Bağcılar',
    'Bahçelievler',
    'Bakırköy',
    'Başakşehir',
    'Bayrampaşa',
    'Beşiktaş',
    'Beykoz',
    'Beylikdüzü',
    'Beyoğlu',
    'Büyükçekmece',
    'Çatalca',
    'Çekmeköy',
    'Esenler',
    'Esenyurt',
    'Eyüpsultan',
    'Fatih',
    'Gaziosmanpaşa',
    'Güngören',
    'Kadıköy',
    'Kağıthane',
    'Kartal',
    'Küçükçekmece',
    'Maltepe',
    'Pendik',
    'Sancaktepe',
    'Sarıyer',
    'Silivri',
    'Sultanbeyli',
    'Sultangazi',
    'Şile',
    'Şişli',
    'Tuzla',
    'Ümraniye',
    'Üsküdar',
    'Zeytinburnu',
  ];
  final Map<String, List<Map<String, String>>> serviceHours = {
    'Arnavutköy': [
      {'time': '05:15', 'location': 'Arnavutköy Merkez'},
      {'time': '07:45', 'location': 'Tayakadın Köyü'},
      {'time': '10:30', 'location': 'Haraççı Meydan'},
      {'time': '13:00', 'location': 'Arnavutköy Terminal'},
      {'time': '16:15', 'location': 'Bolluca Durağı'},
      {'time': '19:30', 'location': 'Arnavutköy Merkez'},
      {'time': '22:00', 'location': 'Tayakadın Köyü'},
    ],
    'Ataşehir': [
      {'time': '06:20', 'location': 'Ataşehir Bulvarı'},
      {'time': '08:00', 'location': 'Ferhatpaşa Metro'},
      {'time': '10:45', 'location': 'Batı Ataşehir'},
      {'time': '13:30', 'location': 'Ataşehir Merkez'},
      {'time': '16:00', 'location': 'Yenisahra Durağı'},
      {'time': '18:45', 'location': 'Ferhatpaşa Metro'},
      {'time': '21:15', 'location': 'Ataşehir Bulvarı'},
    ],
    'Avcılar': [
      {'time': '05:30', 'location': 'Avcılar Metrobüs'},
      {'time': '07:15', 'location': 'Üniversite Kampüsü'},
      {'time': '09:45', 'location': 'Cihangir Mahallesi'},
      {'time': '12:15', 'location': 'Avcılar Merkez'},
      {'time': '15:30', 'location': 'Denizköşkler'},
      {'time': '18:00', 'location': 'Avcılar Metrobüs'},
      {'time': '20:30', 'location': 'Üniversite Kampüsü'},
    ],
    'Bağcılar': [
      {'time': '06:10', 'location': 'Bağcılar Meydan'},
      {'time': '08:40', 'location': 'Güneşli Kavşağı'},
      {'time': '11:15', 'location': 'Yüzyıl Mahallesi'},
      {'time': '14:00', 'location': 'Bağcılar Terminal'},
      {'time': '16:45', 'location': 'Mahmutbey Yolu'},
      {'time': '19:15', 'location': 'Bağcılar Meydan'},
    ],
    'Bahçelievler': [
      {'time': '05:45', 'location': 'Yenibosna Metro'},
      {'time': '07:30', 'location': 'Bahçelievler Merkez'},
      {'time': '10:00', 'location': 'Şirinevler Meydan'},
      {'time': '13:15', 'location': 'Kocasinan Durağı'},
      {'time': '16:30', 'location': 'Yenibosna Metro'},
      {'time': '19:00', 'location': 'Bahçelievler Merkez'},
      {'time': '21:45', 'location': 'Şirinevler Meydan'},
    ],
    'Bakırköy': [
      {'time': '06:30', 'location': 'Bakırköy İDO'},
      {'time': '08:15', 'location': 'Yeşilköy Sahil'},
      {'time': '11:30', 'location': 'Ataköy Marina'},
      {'time': '14:15', 'location': 'Bakırköy Meydan'},
      {'time': '17:00', 'location': 'Yeşilyurt Durağı'},
      {'time': '19:45', 'location': 'Bakırköy İDO'},
    ],
    'Başakşehir': [
      {'time': '05:00', 'location': 'Başakşehir 1. Etap'},
      {'time': '07:00', 'location': 'Kayaşehir Merkez'},
      {'time': '09:30', 'location': 'Bahçeşehir Giriş'},
      {'time': '12:00', 'location': 'Başakşehir Metro'},
      {'time': '15:15', 'location': 'Onurkent Durağı'},
      {'time': '18:30', 'location': 'Kayaşehir Merkez'},
      {'time': '21:00', 'location': 'Başakşehir 1. Etap'},
      
    ],
    'Bayrampaşa': [
      {'time': '06:15', 'location': 'Bayrampaşa Otogar'},
      {'time': '08:45', 'location': 'Yıldırım Mahallesi'},
      {'time': '11:15', 'location': 'Kocatepe Durağı'},
      {'time': '13:45', 'location': 'Bayrampaşa Merkez'},
      {'time': '16:15', 'location': 'Otogar Girişi'},
      {'time': '19:00', 'location': 'Bayrampaşa Otogar'},
    ],
    'Beşiktaş': [
      {'time': '07:00', 'location': 'Beşiktaş İskele'},
      {'time': '09:15', 'location': 'Barbaros Bulvarı'},
      {'time': '11:45', 'location': 'Akaretler Durağı'},
      {'time': '14:30', 'location': 'Ortaköy Sahil'},
      {'time': '17:15', 'location': 'Beşiktaş Meydan'},
      {'time': '20:00', 'location': 'Barbaros Bulvarı'},
    ],
  };

  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('THY Servis Saatleri', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'İlçe Seçiniz',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              value: selectedDistrict,
              items:
                  istanbulDistricts.map((String district) {
                    return DropdownMenuItem<String>(value: district, child: Text(district));
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDistrict = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedDistrict != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$selectedDistrict Servis Saatleri',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  ...(serviceHours[selectedDistrict] ?? []).map((service) {
                    return Card(
                      color: AppColors.customCardColor,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Saat: ${service['time']}', style: const TextStyle(fontSize: 16)),
                                Text(
                                  'Kalkış: ${service['location']}',
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            const Icon(FeatherIcons.clock, color: AppColors.borderColor, size: 30),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
