import 'package:geolocator/geolocator.dart';

class LocationCoordinate {
  final double latitude;
  final double longitude;
  final double accuracy;
  final double altitude;
  final double speed;
  final DateTime timestamp;

  const LocationCoordinate({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.speed,
    required this.timestamp,
  });

  /// Factory constructor to map from [Position] class provided by Geolocator plugin
  factory LocationCoordinate.fromPosition(Position position) {
    return LocationCoordinate(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      speed: position.speed,
      timestamp: position.timestamp,
    );
  }

  @override
  String toString() {
    return 'LocationCoordinate(lat: $latitude, lng: $longitude, acc: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationCoordinate &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.accuracy == accuracy &&
        other.altitude == altitude &&
        other.speed == speed &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return Object.hash(
      latitude,
      longitude,
      accuracy,
      altitude,
      speed,
      timestamp,
    );
  }
}
