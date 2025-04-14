import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class FlightTimeView extends StatefulWidget {
  const FlightTimeView({super.key});

  @override
  State<FlightTimeView> createState() => _FlightTimeViewState();
}

class _FlightTimeViewState extends State<FlightTimeView> {
  List<Map<String, String>> havalimanlari = [
    {'kod': 'IST', 'adi': 'İstanbul'},
    {'kod': 'SAW', 'adi': 'Sabiha Gökçen'},
    {'kod': 'ADB', 'adi': 'İzmir'},
    {'kod': 'AYT', 'adi': 'Antalya'},
    {'kod': 'BJV', 'adi': 'Bodrum'},
    {'kod': 'DLM', 'adi': 'Dalaman'},
  ];

  List<Map<String, String>> havayollari = [
    {'kod': 'TK', 'adi': 'Türk Hava Yolları'},
    {'kod': 'PC', 'adi': 'Pegasus'},
    {'kod': 'VF', 'adi': 'Ajet'},
    {'kod': 'XC', 'adi': 'Corendon'},
    {'kod': 'FH', 'adi': 'Freebird'},
    {'kod': 'KK', 'adi': 'Atlasglobal'},
    {'kod': 'YF', 'adi': 'SunExpress'},
    {'kod': '6Y', 'adi': 'Smartwings'},
    {'kod': 'X3', 'adi': 'TUI fly'},
  ];

  String seciliHavalimani = 'IST';
  String seciliHavayolu = 'TK';

  List<Map<String, dynamic>> tumUcusler = [];
  List<Map<String, dynamic>> filtrelenmisUcusler = [];

  @override
  void initState() {
    super.initState();
    ucusVerileriniOlustur();
    ucuslariFiltrele();
  }

  void ucusVerileriniOlustur() {
    final bugun = DateTime.now().toString().split(' ')[0];

    for (var havayolu in havayollari) {
      for (var kalkis in havalimanlari) {
        for (var varis in havalimanlari) {
          if (kalkis['kod'] != varis['kod'] &&
              !((kalkis['kod'] == 'SAW' && varis['kod'] == 'IST') ||
                  (kalkis['kod'] == 'IST' && varis['kod'] == 'SAW'))) {
            String kalkisKodu = kalkis['kod']!;
            String varisKodu = varis['kod']!;
            String havayoluKodu = havayolu['kod']!;

            // Gidiş uçuşu
            tumUcusler.add({
              'kod': '$havayoluKodu-$kalkisKodu$varisKodu-G',
              'kalkis': kalkisKodu,
              'varis': varisKodu,
              'saat': '08:30',
              'tarih': bugun,
              'havayolu': havayoluKodu,
              'yon': 'Gidiş',
              'ikon': Icons.flight_takeoff,
            });

            // Geliş uçuşu
            tumUcusler.add({
              'kod': '$havayoluKodu-$varisKodu$kalkisKodu-D',
              'kalkis': varisKodu,
              'varis': kalkisKodu,
              'saat': '10:00',
              'tarih': bugun,
              'havayolu': havayoluKodu,
              'yon': 'Geliş',
              'ikon': Icons.flight_land,
            });
          }
        }
      }
    }
  }

  void ucuslariFiltrele() {
    final bugun = DateTime.now().toString().split(' ')[0];
    setState(() {
      filtrelenmisUcusler =
          tumUcusler.where((ucus) {
            return (ucus['kalkis'] == seciliHavalimani || ucus['varis'] == seciliHavalimani) &&
                ucus['havayolu'] == seciliHavayolu &&
                ucus['tarih'] == bugun;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Uçuşlar',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue[700]),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Havalimanı Seçin'),
                        const SizedBox(height: 8),
                        DropdownButton<String>(
                          value: seciliHavalimani,
                          isExpanded: true,
                          items:
                              havalimanlari
                                  .map(
                                    (havalimani) => DropdownMenuItem<String>(
                                      value: havalimani['kod'],
                                      child: Text('${havalimani['kod']} - ${havalimani['adi']}'),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (deger) {
                            setState(() {
                              seciliHavalimani = deger!;
                              ucuslariFiltrele();
                            });
                          },
                          style: const TextStyle(color: Colors.black87),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.blue[700]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Havayolu Şirketi Seçin'),
                        const SizedBox(height: 8),
                        DropdownButton<String>(
                          value: seciliHavayolu,
                          isExpanded: true,
                          items:
                              havayollari
                                  .map(
                                    (havayolu) => DropdownMenuItem<String>(
                                      value: havayolu['kod'],
                                      child: Text('${havayolu['kod']} - ${havayolu['adi']}'),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (deger) {
                            setState(() {
                              seciliHavayolu = deger!;
                              ucuslariFiltrele();
                            });
                          },
                          style: const TextStyle(color: Colors.black87),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.blue[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child:
                    filtrelenmisUcusler.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flight_takeoff, size: 60, color: Colors.grey),
                              const SizedBox(height: 16),
                              Text('Uçuş bulunamadı.', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: filtrelenmisUcusler.length,
                          itemBuilder: (context, index) {
                            final ucus = filtrelenmisUcusler[index];
                            return ListTile(
                              leading: Icon(ucus['ikon'], color: Colors.blue[700]),
                              title: Text('${ucus['kalkis']} -> ${ucus['varis']}'),
                              subtitle: Text('Saat: ${ucus['saat']} | Yön: ${ucus['yon']} \nTarih: ${ucus['tarih']}'),
                              trailing: Text('${ucus['havayolu']} - ${ucus['kod']}'),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
