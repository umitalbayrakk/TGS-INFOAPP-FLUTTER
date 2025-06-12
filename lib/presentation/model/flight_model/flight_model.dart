class FlightModel {
  final String? callsign;
  final String? country;
  final double? longitude;
  final double? latitude;
  final double? altitude;

  FlightModel({this.callsign, this.country, this.longitude, this.latitude, this.altitude});

  factory FlightModel.fromJson(List<dynamic> json) {
    return FlightModel(
      callsign: json[1] as String?,
      country: json[2] as String?,
      longitude: json[5] != null ? (json[5] as num).toDouble() : null,
      latitude: json[6] != null ? (json[6] as num).toDouble() : null,
      altitude: json[7] != null ? (json[7] as num).toDouble() : null,
    );
  }
}
