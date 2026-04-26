import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:local/local.dart';
import 'package:designsystems/designsystems.dart';

/// Widget avatar foto profil pengguna di Home Header.
///
/// Menampilkan foto profil bulat jika tersedia, atau fallback ke ikon
/// SVG user jika [imageUrl] kosong atau gagal dimuat.
///
/// Widget ini bersifat reusable dan dapat diintegrasikan dengan
/// package lain tanpa ketergantungan pada Bloc/Cubit tertentu.
///
/// Penggunaan:
/// ```dart
/// HomeProfileAvatar(
///   imageUrl: ApiConfig.buildImageUrl(profilePhotoPath),
///   size: AppDimensions.avatarSm,
/// )
/// ```
class HomeProfileAvatar extends StatefulWidget {
  /// URL lengkap gambar profil (dari [ApiConfig.buildImageUrl]).
  /// Kosongkan string jika belum ada foto profil.
  final String imageUrl;

  /// Ukuran diameter avatar (width = height). Default: [AppDimensions.avatarSm].
  final double size;

  const HomeProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size = AppDimensions.avatarSm,
  });

  @override
  State<HomeProfileAvatar> createState() => _HomeProfileAvatarState();
}

class _HomeProfileAvatarState extends State<HomeProfileAvatar> {
  String? _accessToken;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  /// Load access token dari SessionStorage untuk request gambar ber-auth.
  ///
  /// Error diabaikan secara graceful — fallback ke ikon user.
  Future<void> _loadToken() async {
    try {
      final sessionStorage = GetIt.I<SessionStorage>();
      final token = await sessionStorage.getAccessToken();
      if (mounted) {
        setState(() => _accessToken = token);
      }
    } catch (_) {
      // Graceful degradation — tampilkan fallback icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: AppColors.homeHeaderIconBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.homeHeaderIconBorder,
          width: AppDimensions.borderThin,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    // Jika belum ada URL foto → tampilkan icon fallback
    if (widget.imageUrl.isEmpty) {
      return _buildFallbackIcon();
    }

    // Jika token belum siap → tampilkan placeholder sementara
    if (_accessToken == null) {
      return _buildLoadingPlaceholder();
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: BoxFit.cover,
      httpHeaders: {'Authorization': 'Bearer $_accessToken'},
      placeholder: (context, url) => _buildLoadingPlaceholder(),
      errorWidget: (context, url, error) => _buildFallbackIcon(),
    );
  }

  /// Placeholder saat token sedang di-load atau gambar sedang di-fetch.
  Widget _buildLoadingPlaceholder() {
    return ColoredBox(
      color: AppColors.homeHeaderIconBg,
      child: Center(
        child: SizedBox(
          width: widget.size * 0.4,
          height: widget.size * 0.4,
          child: CircularProgressIndicator(
            strokeWidth: AppDimensions.borderThin,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  /// Fallback ikon user jika foto tidak tersedia atau gagal dimuat.
  Widget _buildFallbackIcon() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: SvgPicture.asset(
        AppAssets.iconUser,
        width: AppDimensions.iconXs,
        height: AppDimensions.iconXs,
        colorFilter: const ColorFilter.mode(
          AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
