import 'package:flutter/material.dart';
import 'dart:math';
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
    tumUcusler.clear();

    List<String> saatler = List.generate(
      38, // Up to 23:30
      (index) {
        int hour = 5 + (index * 30) ~/ 60;
        int minute = (index * 30) % 60;
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      },
    );

    Map<String, Set<String>> kullanilanSaatler = {};

    for (var havayolu in havayollari) {
      String havayoluKodu = havayolu['kod']!;
      kullanilanSaatler[havayoluKodu] = {};

      for (var kalkis in havalimanlari) {
        for (var varis in havalimanlari) {
          if (kalkis['kod'] != varis['kod'] &&
              !((kalkis['kod'] == 'SAW' && varis['kod'] == 'IST') ||
                  (kalkis['kod'] == 'IST' && varis['kod'] == 'SAW'))) {
            String kalkisKodu = kalkis['kod']!;
            String varisKodu = varis['kod']!;

            // Outbound (Gidiş)
            String? kalkisSaati;
            for (var saat in saatler) {
              String key = '$havayoluKodu-$kalkisKodu-$varisKodu-G';
              if (!kullanilanSaatler[havayoluKodu]!.contains(saat)) {
                kalkisSaati = saat;
                kullanilanSaatler[havayoluKodu]!.add(saat);
                break;
              }
            }

            if (kalkisSaati != null) {
              tumUcusler.add({
                'kod': '$havayoluKodu-$kalkisKodu$varisKodu-G',
                'kalkis': kalkisKodu,
                'varis': varisKodu,
                'saat': kalkisSaati,
                'tarih': bugun,
                'havayolu': havayoluKodu,
                'yon': 'Gidiş',
                'ikon': Icons.flight_takeoff,
              });
            }

            // Inbound (Geliş)
            String? varisSaati;
            for (var saat in saatler) {
              String key = '$havayoluKodu-$varisKodu-$kalkisKodu-D';
              if (!kullanilanSaatler[havayoluKodu]!.contains(saat)) {
                varisSaati = saat;
                kullanilanSaatler[havayoluKodu]!.add(saat);
                break;
              }
            }

            if (varisSaati != null) {
              tumUcusler.add({
                'kod': '$havayoluKodu-$varisKodu$kalkisKodu-D',
                'kalkis': varisKodu,
                'varis': kalkisKodu,
                'saat': varisSaati,
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

    // Sort by departure time
    tumUcusler.sort((a, b) => a['saat'].compareTo(b['saat']));
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

      // Sort filtered flights by departure time
      filtrelenmisUcusler.sort((a, b) => a['saat'].compareTo(b['saat']));
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
                        const Text('Havalimanı Seçin'),
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
                            if (deger != null) {
                              setState(() {
                                seciliHavalimani = deger;
                                ucuslariFiltrele();
                              });
                            }
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
                        const Text('Havayolu Şirketi Seçin'),
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
                            if (deger != null) {
                              setState(() {
                                seciliHavayolu = deger;
                                ucuslariFiltrele();
                              });
                            }
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
                              Icon(Icons.flight_takeoff, size: 60, color: Colors.grey[600]),
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
                              leading: Icon(ucus['ikon'], color: Colors.blue[700], size: 30),
                              title: Text(
                                '${ucus['kalkis']} -> ${ucus['varis']} (${ucus['yon']})',
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text('Saat: ${ucus['saat']}\nTarih: ${ucus['tarih']}'),
                              trailing: Text(
                                '${ucus['havayolu']} - ${ucus['kod']}',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
