import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

/// Pesan foto (F-19, PRD §5.9) — `photo_object_key` diresolve lewat
/// `ApiConfig.buildImageUrl`, sama seperti foto lain di app ini.
class PhotoMessageContent extends StatelessWidget {
  final String objectKey;

  const PhotoMessageContent({super.key, required this.objectKey});

  @override
  Widget build(BuildContext context) {
    return AuthenticatedNetworkImage(
      imageUrl: ApiConfig.buildImageUrl(objectKey),
      width: 220,
      height: 220,
      fit: BoxFit.cover,
      borderRadius: AppDimensions.borderRadiusSm,
    );
  }
}
