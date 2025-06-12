import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tgs_info_app_flutter/presentation/model/flight_model/flight_model.dart';

class FlightService {
  final String _baseUrl = 'https://opensky-network.org/api/states/all';

  Future<List<FlightModel>> fetchFlights() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> states = data['states'] ?? [];
        return states.map((json) => FlightModel.fromJson(json)).toList();
      } else {
        throw Exception('Veri çekilemedi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Hata oluştu: $e');
    }
  }
}
