import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/model/flight_model/flight_model.dart';
import 'package:tgs_info_app_flutter/services/flight_service/flight_service.dart';

class FlightViewModel extends ChangeNotifier {
  final FlightService _flightService = FlightService();
  List<FlightModel> _flights = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<FlightModel> get flights => _flights;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchFlights() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _flights = await _flightService.fetchFlights();
      _isLoading = false;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
    }

    notifyListeners();
  }
}