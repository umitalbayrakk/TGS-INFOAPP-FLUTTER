import 'package:flutter/material.dart';

class FlightTimeViewModel extends ChangeNotifier {
  List<Map<String, String>> _airports = [
    {'kod': 'IST', 'adi': 'İstanbul'},
    {'kod': 'SAW', 'adi': 'Sabiha Gökçen'},
    {'kod': 'ADB', 'adi': 'İzmir'},
    {'kod': 'AYT', 'adi': 'Antalya'},
    {'kod': 'BJV', 'adi': 'Bodrum'},
    {'kod': 'DLM', 'adi': 'Dalaman'},
  ];

  List<Map<String, String>> _airlines = [
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
  String _selectedAirport = 'IST';
  String _selectedAirline = 'TK';
  List<Map<String, dynamic>> _allFlights = [];
  List<Map<String, dynamic>> _filteredFlights = [];
  List<Map<String, String>> get airports => _airports;
  List<Map<String, String>> get airlines => _airlines;
  String get selectedAirport => _selectedAirport;
  String get selectedAirline => _selectedAirline;
  List<Map<String, dynamic>> get filteredFlights => _filteredFlights;
  void initialize() {
    _generateFlightData();
    _filterFlights();
  }

  void _generateFlightData() {
    final today = DateTime.now().toString().split(' ')[0];
    _allFlights.clear();

    List<String> times = List.generate(
      38, 
      (index) {
        int hour = 5 + (index * 30) ~/ 60;
        int minute = (index * 30) % 60;
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      },
    );

    Map<String, Set<String>> usedTimes = {};

    for (var airline in _airlines) {
      String airlineCode = airline['kod']!;
      usedTimes[airlineCode] = {};

      for (var departure in _airports) {
        for (var arrival in _airports) {
          if (departure['kod'] != arrival['kod'] &&
              !((departure['kod'] == 'SAW' && arrival['kod'] == 'IST') ||
                  (departure['kod'] == 'IST' && arrival['kod'] == 'SAW'))) {
            String departureCode = departure['kod']!;
            String arrivalCode = arrival['kod']!;
            String? departureTime;
            for (var time in times) {
              String key = '$airlineCode-$departureCode-$arrivalCode-G';
              if (!usedTimes[airlineCode]!.contains(time)) {
                departureTime = time;
                usedTimes[airlineCode]!.add(time);
                break;
              }
            }

            if (departureTime != null) {
              _allFlights.add({
                'kod': '$airlineCode-$departureCode$arrivalCode-G',
                'kalkis': departureCode,
                'varis': arrivalCode,
                'saat': departureTime,
                'tarih': today,
                'havayolu': airlineCode,
                'yon': 'Gidiş',
                'ikon': Icons.flight_takeoff,
              });
            }
            String? arrivalTime;
            for (var time in times) {
              String key = '$airlineCode-$arrivalCode-$departureCode-D';
              if (!usedTimes[airlineCode]!.contains(time)) {
                arrivalTime = time;
                usedTimes[airlineCode]!.add(time);
                break;
              }
            }

            if (arrivalTime != null) {
              _allFlights.add({
                'kod': '$airlineCode-$arrivalCode$departureCode-D',
                'kalkis': arrivalCode,
                'varis': departureCode,
                'saat': arrivalTime,
                'tarih': today,
                'havayolu': airlineCode,
                'yon': 'Geliş',
                'ikon': Icons.flight_land,
              });
            }
          }
        }
      }
    }
    _allFlights.sort((a, b) => a['saat'].compareTo(b['saat']));
  }
  void _filterFlights() {
    final today = DateTime.now().toString().split(' ')[0];
    _filteredFlights = _allFlights.where((flight) {
      return (flight['kalkis'] == _selectedAirport || flight['varis'] == _selectedAirport) &&
          flight['havayolu'] == _selectedAirline &&
          flight['tarih'] == today;
    }).toList();
    _filteredFlights.sort((a, b) => a['saat'].compareTo(b['saat']));
    notifyListeners();
  }
  void updateSelectedAirport(String airport) {
    _selectedAirport = airport;
    _filterFlights();
  }
  void updateSelectedAirline(String airline) {
    _selectedAirline = airline;
    _filterFlights();
  }
}