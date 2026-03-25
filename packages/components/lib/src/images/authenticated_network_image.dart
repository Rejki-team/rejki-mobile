import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:local/local.dart';

/// Authenticated Network Image Widget
///
/// A widget that loads images from authenticated endpoints by automatically
/// including the Authorization header with bearer token.
///
/// Usage:
/// ```dart
/// AuthenticatedNetworkImage(
///   imageUrl: 'https://api.example.com/helpers/get-image?value=path',
///   width: 100,
///   height: 100,
///   fit: BoxFit.cover,
/// )
/// ```
class AuthenticatedNetworkImage extends StatefulWidget {
  /// The URL of the image to load
  final String imageUrl;

  /// Width of the image container
  final double? width;

  /// Height of the image container
  final double? height;

  /// How the image should be inscribed into the space
  final BoxFit? fit;

  /// Border radius for the image
  final BorderRadius? borderRadius;

  /// Placeholder widget shown while loading
  final Widget? placeholder;

  /// Error widget shown when image fails to load
  final Widget? errorWidget;

  const AuthenticatedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  State<AuthenticatedNetworkImage> createState() =>
      _AuthenticatedNetworkImageState();
}

class _AuthenticatedNetworkImageState extends State<AuthenticatedNetworkImage> {
  String? _accessToken;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAccessToken();
  }

  Future<void> _loadAccessToken() async {
    try {
      final sessionStorage = GetIt.I<SessionStorage>();
      final token = await sessionStorage.getAccessToken();
      if (mounted) {
        setState(() {
          _accessToken = token;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading access token: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildPlaceholder();
    }

    if (widget.imageUrl.isEmpty) {
      return _buildError();
    }

    Widget image = CachedNetworkImage(
      imageUrl: widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit ?? BoxFit.cover,
      httpHeaders: _accessToken != null
          ? {'Authorization': 'Bearer $_accessToken'}
          : null,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) {
        debugPrint('🖼️ [AuthenticatedNetworkImage] Error: $error');
        return _buildError();
      },
    );

    if (widget.borderRadius != null) {
      return ClipRRect(borderRadius: widget.borderRadius!, child: image);
    }

    return image;
  }

  Widget _buildPlaceholder() {
    return widget.placeholder ??
        Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey[200],
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
  }

  Widget _buildError() {
    return widget.errorWidget ??
        Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.image_not_supported_outlined, color: Colors.grey),
          ),
        );
  }
}
