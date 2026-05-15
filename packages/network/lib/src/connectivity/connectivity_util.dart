import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Tipe koneksi yang didukung
enum ConnectionType { wifi, mobile, ethernet, vpn, bluetooth, satellite, other, none }

/// Status koneksi
class ConnectionStatus {
  final bool isConnected;
  final List<ConnectionType> types;
  final String description;

  const ConnectionStatus({
    required this.isConnected,
    required this.types,
    required this.description,
  });

  /// Status tanpa koneksi
  static const noConnection = ConnectionStatus(
    isConnected: false,
    types: [ConnectionType.none],
    description: 'Tidak ada koneksi internet',
  );

  @override
  String toString() =>
      'ConnectionStatus(isConnected: $isConnected, types: $types)';
}

/// Utility untuk memeriksa dan memantau koneksi internet
///
/// Dapat digunakan di mana saja dengan:
/// ```dart
/// final connectivity = getIt<ConnectivityUtil>();
///
/// // Cek sekali
/// final status = await connectivity.checkConnection();
/// if (status.isConnected) { ... }
///
/// // Listen perubahan
/// connectivity.connectionStream.listen((status) {
///   if (!status.isConnected) { ... }
/// });
/// ```
///
/// NOTE: DI registration for this class should be done in the 'di' package.
class ConnectivityUtil {
  final Connectivity _connectivity = Connectivity();

  StreamController<ConnectionStatus>? _statusController;

  /// Stream untuk memantau perubahan koneksi
  Stream<ConnectionStatus> get connectionStream {
    _statusController ??= StreamController<ConnectionStatus>.broadcast();

    // Listen ke perubahan koneksi
    _connectivity.onConnectivityChanged.listen((results) {
      final status = _parseResults(results);
      _statusController?.add(status);
    });

    return _statusController!.stream;
  }

  /// Cek koneksi saat ini
  Future<ConnectionStatus> checkConnection() async {
    final results = await _connectivity.checkConnectivity();
    return _parseResults(results);
  }

  /// Cek apakah ada koneksi internet (shorthand)
  Future<bool> hasConnection() async {
    final status = await checkConnection();
    return status.isConnected;
  }

  /// Parse hasil connectivity ke ConnectionStatus
  ConnectionStatus _parseResults(List<ConnectivityResult> results) {
    if (results.isEmpty || results.every((r) => r == ConnectivityResult.none)) {
      return ConnectionStatus.noConnection;
    }

    final types = <ConnectionType>[];
    final descriptions = <String>[];

    for (final result in results) {
      switch (result) {
        case ConnectivityResult.wifi:
          types.add(ConnectionType.wifi);
          descriptions.add('WiFi');
        case ConnectivityResult.mobile:
          types.add(ConnectionType.mobile);
          descriptions.add('Data Seluler');
        case ConnectivityResult.ethernet:
          types.add(ConnectionType.ethernet);
          descriptions.add('Ethernet');
        case ConnectivityResult.vpn:
          types.add(ConnectionType.vpn);
          descriptions.add('VPN');
        case ConnectivityResult.bluetooth:
          types.add(ConnectionType.bluetooth);
          descriptions.add('Bluetooth');
        case ConnectivityResult.satellite:
          types.add(ConnectionType.satellite);
          descriptions.add('Satelit');
        case ConnectivityResult.other:
          types.add(ConnectionType.other);
          descriptions.add('Lainnya');
        case ConnectivityResult.none:
          // Skip
          break;
      }
    }

    if (types.isEmpty) {
      return ConnectionStatus.noConnection;
    }

    return ConnectionStatus(
      isConnected: true,
      types: types,
      description: 'Terhubung via ${descriptions.join(', ')}',
    );
  }

  /// Dispose resources
  void dispose() {
    _statusController?.close();
    _statusController = null;
  }
}
