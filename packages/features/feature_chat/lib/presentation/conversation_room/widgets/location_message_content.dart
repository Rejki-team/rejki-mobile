import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:url_launcher/url_launcher.dart';

/// Pratinjau lokasi via OpenStreetMap (F-19, PRD §5.9) — tap membuka Google
/// Maps (`ponytail`: pratinjau statis non-interaktif cukup untuk chat bubble,
/// interaksi penuh diserahkan ke aplikasi Maps eksternal).
class LocationMessageContent extends StatelessWidget {
  final double lat;
  final double lng;

  const LocationMessageContent({
    super.key,
    required this.lat,
    required this.lng,
  });

  @override
  Widget build(BuildContext context) {
    final point = latlong.LatLng(lat, lng);
    return GestureDetector(
      onTap: () => _openInGoogleMaps(context),
      child: ClipRRect(
        borderRadius: AppDimensions.borderRadiusSm,
        child: SizedBox(
          width: 220,
          height: 140,
          child: IgnorePointer(
            child: FlutterMap(
              options: MapOptions(initialCenter: point, initialZoom: 15),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'id.co.pkp.rejki',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: point,
                      child: const Icon(
                        Icons.location_on,
                        color: AppColors.error,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                const SimpleAttributionWidget(
                  source: Text('© OpenStreetMap contributors'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openInGoogleMaps(BuildContext context) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tidak dapat membuka aplikasi peta')),
        );
      }
    }
  }
}
