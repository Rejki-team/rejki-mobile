import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'location_manager_interface.dart';
import 'models/location_coordinate.dart';

@LazySingleton(as: AppLocationManager)
class AppLocationManagerImpl implements AppLocationManager {
  // Underlying Subscription object guarding memory leak by allowing manual dispose
  StreamSubscription<Position>? _positionStreamSubscription;

  // Stream channel pipeline forwarding geolocator to domains without importing plugin
  final StreamController<LocationCoordinate> _locationStreamController =
      StreamController<LocationCoordinate>.broadcast();

  bool _isTracking = false;

  @override
  bool get isTracking => _isTracking;

  @override
  Stream<LocationCoordinate> get locationStream =>
      _locationStreamController.stream;

  @override
  Future<bool> checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // 1. Validate service toggle
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      }

      // 2. Validate application tier permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are unconditionally denied
        return false;
      }

      return true;
    } catch (e) {
      // Safely catch plugin platform channels failure preventing God crashes
      return false;
    }
  }

  @override
  Future<LocationCoordinate?> getCurrentLocation() async {
    final hasPermission = await checkPermissions();
    if (!hasPermission) return null;

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
        ),
      );

      return LocationCoordinate.fromPosition(position);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> startTracking() async {
    // 1. Early abort race condition block if already tracking memory safe
    if (_isTracking) return;

    // 2. Resolve access
    final hasPermission = await checkPermissions();
    if (!hasPermission) return;

    _isTracking = true;

    // 3. Start subscription to system GPS
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5, // Metres delta trigger
    );

    _positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
          (Position position) {
            // Sink event sequentially into broadcast
            if (!_locationStreamController.isClosed) {
              _locationStreamController.add(
                LocationCoordinate.fromPosition(position),
              );
            }
          },
          onError: (dynamic error) {
            if (!_locationStreamController.isClosed) {
              _locationStreamController.addError(error);
            }
          },
        );
  }

  @override
  void stopTracking() {
    // Safe memory dispose handling
    if (!_isTracking) return;

    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    _isTracking = false;
  }

  /// Exposed internal dispose method exclusively for test environments and system exit hooks.
  /// Typically not used since Manager is an App-Level singleton relying on `.stopTracking()`.
  void dispose() {
    stopTracking();
    _locationStreamController.close();
  }
}
