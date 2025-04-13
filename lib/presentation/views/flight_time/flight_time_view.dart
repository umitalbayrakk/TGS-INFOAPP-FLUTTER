import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class FlightTimeView extends StatefulWidget {
  const FlightTimeView({super.key});

  @override
  State<FlightTimeView> createState() => _FlightTimeViewState();
}

class _FlightTimeViewState extends State<FlightTimeView> {
  List<Map<String, String>> airports = [
    {'code': 'IST', 'name': 'İstanbul'},
    {'code': 'SAW', 'name': 'Sabiha Gökçen'},
    {'code': 'ADB', 'name': 'İzmir'},
    {'code': 'AYT', 'name': 'Antalya'},
    {'code': 'BJV', 'name': 'Bodrum'},
    {'code': 'DLM', 'name': 'Dalaman'},
  ];

  List<Map<String, String>> airlines = [
    {'code': 'TK', 'name': 'Türk Hava Yolları'},
    {'code': 'VF', 'name': 'Ajet'},
    {'code': 'XC', 'name': 'Corendon'},
    {'code': 'FH', 'name': 'Freebird'},
    {'code': 'PC', 'name': 'Pegasus'},
  ];

  String selectedAirport = 'IST';
  String selectedAirline = 'TK';

  List<Map<String, dynamic>> allFlights = [];
  List<Map<String, dynamic>> filteredFlights = [];

  @override
  void initState() {
    super.initState();
    generateFlightData();
    filterFlights();
  }

  void generateFlightData() {
    List<String> arrivals = ['LHR', 'JFK', 'CDG', 'DXB', 'BER', 'VIE', 'AMS', 'FRA', 'MUC', 'ZRH', 'DUS', 'CPH', 'BRU'];

    for (var airport in airports) {
      for (var airline in airlines) {
        for (int i = 0; i < 20; i++) {
          String departure = airport['code']!;
          String airlineCode = airline['code']!;
          String arrival = arrivals[(i + departure.codeUnitAt(0)) % arrivals.length];
          String time = '${(i + 4).toString().padLeft(2, '0')}:${(i * 3 % 60).toString().padLeft(2, '0')}';
          String date = '2025-01-${(10 + i % 20).toString().padLeft(2, '0')}';

          allFlights.add({
            'code': '$airlineCode${1000 + i}',
            'departure': departure,
            'arrival': arrival,
            'time': time,
            'airline': airlineCode,
            'icon': Icons.flight_takeoff,
            'date': date,
          });
        }
      }
    }
  }

  void filterFlights() {
    setState(() {
      filteredFlights =
          allFlights
              .where((flight) => flight['departure'] == selectedAirport && flight['airline'] == selectedAirline)
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('Kalkış Havalimanı'),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedAirport,
                              items:
                                  airports
                                      .map(
                                        (airport) => DropdownMenuItem<String>(
                                          value: airport['code'],
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: Text('${airport['code']} - ${airport['name']}'),
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedAirport = value!;
                                  filterFlights();
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down, color: Colors.blue[700]),
                              style: const TextStyle(color: Colors.black87),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Havayolu Şirketi'),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedAirline,
                              items:
                                  airlines
                                      .map(
                                        (airline) => DropdownMenuItem<String>(
                                          value: airline['code'],
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: Text('${airline['code']} - ${airline['name']}'),
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedAirline = value!;
                                  filterFlights();
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down, color: Colors.blue[700]),
                              style: const TextStyle(color: Colors.black87),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        filteredFlights.isEmpty
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.flight_takeoff, size: 60, color: Colors.grey),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Bu kriterlere uygun uçuş bulunamadı.',
                                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      filterFlights();
                                    },
                                    child: const Text('Yeniden Ara'),
                                  ),
                                ],
                              ),
                            )
                            : Scrollbar(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 16,
                                    dataRowHeight: 60,
                                    headingRowColor: MaterialStateProperty.all(Colors.blue[50]),
                                    columns: const [
                                      DataColumn(label: Text('Uçuş Kodu')),
                                      DataColumn(label: Text('Rota')),
                                      DataColumn(label: Text('Saat')),
                                      DataColumn(label: Text('Tarih')),
                                      DataColumn(label: Text('İkon')),
                                    ],
                                    rows:
                                        filteredFlights
                                            .map(
                                              (flight) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(
                                                      flight['code']!,
                                                      style: const TextStyle(fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                  DataCell(Text('${flight['departure']} -> ${flight['arrival']}')),
                                                  DataCell(Text(flight['time']!)),
                                                  DataCell(Text(flight['date']!)),
                                                  DataCell(Icon(flight['icon'], color: Colors.blue[700])),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
