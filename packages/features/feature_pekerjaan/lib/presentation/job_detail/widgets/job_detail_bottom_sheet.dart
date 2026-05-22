import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Data model for Job Detail Bottom Sheet
///
/// Contains all the dynamic data displayed in a job detail bottom sheet.
class JobDetailData {
  /// Job category (e.g., "Angkut Barang")
  final String category;

  /// Job advertisement code (e.g., "24/11/2024/023323111")
  final String adCode;

  /// Availability status label (e.g., "Tersedia")
  final String statusLabel;

  /// Job description text
  final String description;

  /// Job date formatted string (e.g., "24 November 2025")
  final String dateText;

  /// Job time formatted string (e.g., "11:00")
  final String timeText;

  /// Payment info formatted string (e.g., "Rp. 50,000 + kopi")
  final String paymentText;

  /// Location text (e.g., "RW.03, Pisangan baru")
  final String locationText;

  /// Full address text
  final String address;

  /// Number of workers needed (as string)
  final String workerCount;

  /// Employer name
  final String employerName;

  /// Employer rating (0-5)
  final double employerRating;

  /// Number of reviews
  final int reviewCount;

  /// Employer phone number
  final String phoneNumber;

  /// Job requirements text (supports multiline)
  final String requirements;

  /// List of job photo URLs
  final List<String> photoUrls;

  const JobDetailData({
    required this.category,
    required this.adCode,
    required this.statusLabel,
    required this.description,
    required this.dateText,
    required this.timeText,
    required this.paymentText,
    required this.locationText,
    required this.address,
    required this.workerCount,
    required this.employerName,
    required this.employerRating,
    required this.reviewCount,
    required this.phoneNumber,
    required this.requirements,
    required this.photoUrls,
  });
}

/// Job Detail Bottom Sheet Widget
///
/// A comprehensive bottom sheet for displaying job details with:
/// - Job category, code, and availability status
/// - Description and metadata grid
/// - Address and worker count information
/// - Employer card with rating
/// - Requirements and photos sections
/// - Fixed action buttons (Chat and Take Job)
///
/// Usage:
/// ```dart
/// JobDetailBottomSheet.show(
///   context: context,
///   data: JobDetailData(...),
///   onChatPressed: () => print('Chat'),
///   onTakeJobPressed: () => print('Take Job'),
/// );
/// ```
class JobDetailBottomSheet extends StatelessWidget {
  /// Job detail data
  final JobDetailData data;

  /// Callback when "Hubungi via Chat" button is pressed
  final VoidCallback? onChatPressed;

  /// Callback when "Ambil Pekerjaan" button is pressed
  final VoidCallback? onTakeJobPressed;

  /// Whether the take job action is in loading state (checking worker profile)
  final bool isLoading;

  const JobDetailBottomSheet({
    super.key,
    required this.data,
    this.onChatPressed,
    this.onTakeJobPressed,
    this.isLoading = false,
  });

  /// Shows the job detail bottom sheet
  static Future<void> show({
    required BuildContext context,
    required JobDetailData data,
    VoidCallback? onChatPressed,
    VoidCallback? onTakeJobPressed,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (bottomSheetContext) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => JobDetailBottomSheet(
          data: data,
          onChatPressed: () {
            Navigator.of(bottomSheetContext).pop();
            onChatPressed?.call();
          },
          onTakeJobPressed: () {
            Navigator.of(bottomSheetContext).pop();
            onTakeJobPressed?.call();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Material is required here because showModalBottomSheet with
    // backgroundColor: Colors.transparent does NOT inject a Material widget
    // automatically. Without a Material ancestor, Text widgets fall back to
    // Flutter's debug style (yellow text + yellow underline).
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusLg),
            topRight: Radius.circular(AppDimensions.radiusLg),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            _buildHandle(),

            // Scrollable content
            Expanded(child: _buildScrollableContent()),

            // Fixed bottom action buttons
            _buildBottomActions(context),
          ],
        ),
      ),
    );
  }

  /// Builds the bottom sheet handle bar
  Widget _buildHandle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      alignment: Alignment.center,
      child: Container(
        width: AppDimensions.bottomSheetHandleWidth,
        height: AppDimensions.bottomSheetHandleHeight,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
        ),
      ),
    );
  }

  /// Builds the scrollable content section
  Widget _buildScrollableContent() {
    return SingleChildScrollView(
      padding: AppSpacing.paddingAllMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Category, Code, Status
          _buildHeader(),

          const SizedBox(height: AppSpacing.xl),

          // Description
          Text(data.description, style: AppTypography.jobDetailDescription),

          const SizedBox(height: AppSpacing.xl),

          // Metadata grid (2x2)
          _buildMetadataGrid(),

          const SizedBox(height: AppSpacing.xl),

          // Address section
          _buildLabelValueSection(label: 'Alamat : ', value: data.address),

          const SizedBox(height: AppSpacing.xl),

          // Worker count section
          _buildLabelValueSection(
            label: 'Jumlah Pekerja ',
            value: data.workerCount,
          ),

          const SizedBox(height: AppSpacing.xl),

          // Employer card
          _buildEmployerCard(),

          const SizedBox(height: AppSpacing.xl),

          // Requirements and Photos sections
          _buildSectionsContainer(),

          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }

  /// Builds the header with category, code, and status
  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Category and code
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.category, style: AppTypography.jobDetailCategory),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Kode Iklan : ${data.adCode}',
                style: AppTypography.jobDetailCode,
              ),
            ],
          ),
        ),

        // Right: Status badge
        _buildAvailabilityBadge(),
      ],
    );
  }

  /// Builds the availability status badge
  Widget _buildAvailabilityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.availabilityBadgeBg,
        borderRadius: AppDimensions.borderRadiusXs,
        border: Border.all(
          color: AppColors.availabilityBadgeBorder,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Text(
        data.statusLabel,
        style: AppTypography.jobDetailAvailabilityBadge,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds the 2x2 metadata grid
  Widget _buildMetadataGrid() {
    return Column(
      children: [
        // First row
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                iconPath: AppAssets.iconLocation,
                iconColor: AppColors.badgeBlue,
                text: data.dateText,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildInfoCard(
                iconPath: AppAssets.iconMoney,
                iconColor: AppColors.badgeGreen,
                text: data.paymentText,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.sm),

        // Second row
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                iconPath: AppAssets.iconClock,
                iconColor: AppColors.iconOrange,
                text: data.timeText,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildInfoCard(
                iconPath: AppAssets.iconChat,
                iconColor: AppColors.iconPurple,
                text: data.locationText,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds an info card with icon and text
  Widget _buildInfoCard({
    required String iconPath,
    required Color iconColor,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.paddingAllMd,
      decoration: BoxDecoration(
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: AppDimensions.iconXxs,
            height: AppDimensions.iconXxs,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              text,
              style: AppTypography.jobDetailInfo,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a label-value section
  Widget _buildLabelValueSection({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.jobDetailLabel),
        const SizedBox(height: AppSpacing.xxs),
        Text(value, style: AppTypography.jobDetailInfo),
      ],
    );
  }

  /// Builds the employer card
  Widget _buildEmployerCard() {
    return Container(
      width: double.infinity,
      padding: AppSpacing.paddingAllMd,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User icon wrapper
          Container(
            width: AppDimensions.avatarSm,
            height: AppDimensions.avatarSm,
            padding: AppSpacing.paddingAllSm,
            decoration: BoxDecoration(
              color: AppColors.userIconWrapperBg,
              borderRadius: AppDimensions.borderRadiusSm,
            ),
            child: SvgPicture.asset(
              AppAssets.iconUser,
              width: AppDimensions.iconXs,
              height: AppDimensions.iconXs,
              colorFilter: ColorFilter.mode(
                AppColors.userIconTint,
                BlendMode.srcIn,
              ),
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          // Employer info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              child: EmployerInfoWidget(
                title: 'Pemberi Kerja',
                name: data.employerName,
                rating: data.employerRating,
                reviewCount: data.reviewCount,
              ),
            ),
          ),

          // Phone number
          Text(data.phoneNumber, style: AppTypography.jobDetailPhone),
        ],
      ),
    );
  }

  /// Builds the sections container (Requirements and Photos)
  Widget _buildSectionsContainer() {
    return Column(
      children: [
        // Requirements section
        _buildSection(
          iconPath: AppAssets.iconPaperOutlined,
          iconColor: AppColors.badgeBlue,
          title: 'Syarat Pekerjaan',
          child: Text(data.requirements, style: AppTypography.jobDetailInfo),
        ),

        // Photos section
        _buildSection(
          iconPath: AppAssets.iconImage,
          iconColor: AppColors.iconImageOrange,
          title: 'Foto Detail Pekerjaan',
          child: _buildPhotoGrid(),
        ),
      ],
    );
  }

  /// Builds a section with icon, title, and content
  Widget _buildSection({
    required String iconPath,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
          bottom: BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: AppDimensions.iconXxs,
                height: AppDimensions.iconXxs,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(title, style: AppTypography.jobDetailSectionTitle),
            ],
          ),

          const SizedBox(height: AppSpacing.sm),

          // Section content
          child,
        ],
      ),
    );
  }

  /// Builds the photo grid with zoomable images
  Widget _buildPhotoGrid() {
    debugPrint(
      '🖼️ [JobDetailBottomSheet] photoUrls count: ${data.photoUrls.length}',
    );
    debugPrint('🖼️ [JobDetailBottomSheet] photoUrls: ${data.photoUrls}');

    if (data.photoUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: data.photoUrls.map((url) {
        return _PhotoTile(
          imageUrl: url,
          size: AppDimensions.jobDetailImageSize,
        );
      }).toList(),
    );
  }

  /// Builds the bottom action buttons (fixed)
  Widget _buildBottomActions(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.paddingAllMd,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Info notice
            _buildInfoNotice(),

            const SizedBox(height: AppSpacing.sm),

            // Chat button
            _buildChatButton(),

            const SizedBox(height: AppSpacing.sm),

            // Take job button
            _buildTakeJobButton(),
          ],
        ),
      ),
    );
  }

  /// Builds the info notice text
  Widget _buildInfoNotice() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppAssets.iconInfoLine,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: ColorFilter.mode(AppColors.badgeBlue, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text.rich(
            TextSpan(
              style: AppTypography.jobDetailInfoNotice,
              children: [
                const TextSpan(text: 'Kamu perlu '),
                TextSpan(
                  text: 'menghubungi',
                  style: AppTypography.jobDetailInfoNoticeBold,
                ),
                const TextSpan(
                  text: ' pemberi kerja sebelum dapat mengambil pekerjaan ini.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the chat button
  Widget _buildChatButton() {
    return Material(
      color: AppColors.chatButtonGreen,
      borderRadius: AppDimensions.borderRadiusSm,
      child: InkWell(
        onTap: onChatPressed,
        borderRadius: AppDimensions.borderRadiusSm,
        child: Container(
          width: double.infinity,
          padding: AppSpacing.paddingButtonSm,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.iconChat,
                width: AppDimensions.iconXs,
                height: AppDimensions.iconXs,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Hubungi via Chat',
                style: AppTypography.buttonRegularSmall.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the take job button with gradient and optional loading state
  Widget _buildTakeJobButton() {
    final isDisabled = !isLoading && onTakeJobPressed == null;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: isDisabled ? null : AppColors.buttonGradient,
        color: isDisabled ? AppColors.border : null,
        borderRadius: AppDimensions.borderRadiusSm,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (isLoading || isDisabled) ? null : onTakeJobPressed,
          borderRadius: AppDimensions.borderRadiusSm,
          splashColor: AppColors.white.withValues(alpha: 0.1),
          highlightColor: AppColors.white.withValues(alpha: 0.05),
          child: Padding(
            padding: AppSpacing.paddingButtonSm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  const SizedBox(
                    width: AppDimensions.iconXs,
                    height: AppDimensions.iconXs,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  ),
                ] else ...[
                  SvgPicture.asset(
                    AppAssets.iconWork,
                    width: AppDimensions.iconXs,
                    height: AppDimensions.iconXs,
                    colorFilter: ColorFilter.mode(
                      isDisabled ? AppColors.textBlack : AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Ambil Pekerjaan',
                  style: AppTypography.buttonRegularSmall.copyWith(
                    color: isDisabled ? AppColors.textBlack : AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Photo tile widget with tap to zoom functionality
class _PhotoTile extends StatelessWidget {
  final String imageUrl;
  final double size;

  const _PhotoTile({required this.imageUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    debugPrint('🖼️ [_PhotoTile] Loading image: $imageUrl');
    return GestureDetector(
      onTap: () => _showZoomableImage(context),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.imagePlaceholder,
          borderRadius: AppDimensions.borderRadiusXs,
        ),
        clipBehavior: Clip.antiAlias,
        child: imageUrl.isNotEmpty
            ? AuthenticatedNetworkImage(
                imageUrl: imageUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.textCaption,
                    ),
                  ),
                ),
                errorWidget: Container(
                  color: AppColors.imagePlaceholder,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.textCaption,
                        size: AppDimensions.iconMd,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Gagal memuat',
                        style: TextStyle(
                          color: AppColors.textCaption,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }

  void _showZoomableImage(BuildContext context) {
    if (imageUrl.isEmpty) return;

    showDialog(
      context: context,
      barrierColor: AppColors.black.withValues(alpha: 0.9),
      builder: (context) => _ZoomableImageDialog(imageUrl: imageUrl),
    );
  }
}

/// Zoomable image dialog with pan and zoom support
class _ZoomableImageDialog extends StatelessWidget {
  final String imageUrl;

  const _ZoomableImageDialog({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Zoomable image
        Center(
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: AuthenticatedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              placeholder: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              errorWidget: Container(
                color: AppColors.imagePlaceholder,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textCaption,
                  size: AppDimensions.iconXxl,
                ),
              ),
            ),
          ),
        ),

        // Close button
        Positioned(
          top: MediaQuery.of(context).padding.top + AppSpacing.md,
          right: AppSpacing.md,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: AppSpacing.paddingAllSm,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: AppColors.white,
                size: AppDimensions.iconMd,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
