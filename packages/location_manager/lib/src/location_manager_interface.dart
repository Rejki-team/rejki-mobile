import 'models/location_coordinate.dart';

/// Define the boundary boundary interface for location services.
/// Used for DI binding and inversion of control allowing testing mock.
abstract class AppLocationManager {
  /// Resolves device permission securely and asks for coordinate in one action.
  /// Returns `null` if permission evaluates to denied.
  Future<LocationCoordinate?> getCurrentLocation();

  /// Retrieve continuous asynchronous updates from GPS metrics sensor
  Stream<LocationCoordinate> get locationStream;

  /// Initiate tracking cycle loop process securely
  Future<void> startTracking();

  /// Gracefully dispose and close the cycle loop observation to free memory overhead
  void stopTracking();

  /// Validates availability status of streaming lifecycle flag
  bool get isTracking;

  /// Centralized permission verification explicitly.
  /// Avoid using God logic UI contexts here, it merely responds with a precise boolean.
  Future<bool> checkPermissions();
}
