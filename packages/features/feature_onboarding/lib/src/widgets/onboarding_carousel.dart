import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:designsystems/designsystems.dart';

/// Image Carousel untuk onboarding screens
///
/// Menampilkan gambar dalam carousel horizontal dengan indicator dots.
///
/// ```dart
/// OnboardingCarousel(
///   images: [
///     'packages/designsystems/assets/illustrations/onboarding_1.png',
///     'packages/designsystems/assets/illustrations/onboarding_2.png',
///     'packages/designsystems/assets/illustrations/onboarding_3.png',
///   ],
///   onPageChanged: (index) {
///     // Handle page change
///   },
/// )
/// ```
class OnboardingCarousel extends StatefulWidget {
  /// List path gambar untuk carousel
  final List<String> images;

  /// Callback ketika halaman berubah
  final ValueChanged<int>? onPageChanged;

  /// Index awal (default: 0)
  final int initialIndex;

  /// Apakah auto-play (default: false)
  final bool autoPlay;

  /// Durasi auto-play (default: 3 detik)
  final Duration autoPlayInterval;

  /// Apakah infinite loop (default: false)
  final bool enableInfiniteScroll;

  /// Controller untuk carousel (opsional)
  final CarouselSliderController? controller;

  const OnboardingCarousel({
    super.key,
    required this.images,
    this.onPageChanged,
    this.initialIndex = 0,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.enableInfiniteScroll = false,
    this.controller,
  });

  @override
  State<OnboardingCarousel> createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  late int _currentIndex;
  late CarouselSliderController _controller;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = widget.controller ?? CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Carousel
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.images.length,
          itemBuilder: (context, index, realIndex) {
            return _CarouselImage(imagePath: widget.images[index]);
          },
          options: CarouselOptions(
            height: AppDimensions.carouselImageSize,
            viewportFraction: 1.0,
            initialPage: widget.initialIndex,
            enableInfiniteScroll: widget.enableInfiniteScroll,
            autoPlay: widget.autoPlay,
            autoPlayInterval: widget.autoPlayInterval,
            autoPlayAnimationDuration: AppAnimations.durationSlow,
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
              widget.onPageChanged?.call(index);
            },
          ),
        ),

        const SizedBox(height: AppSpacing.xxs),

        // Indicator dots
        _IndicatorDots(
          count: widget.images.length,
          activeIndex: _currentIndex,
          onDotTap: (index) {
            _controller.animateToPage(index);
          },
        ),
      ],
    );
  }
}

/// Widget untuk menampilkan gambar carousel
class _CarouselImage extends StatelessWidget {
  final String imagePath;

  const _CarouselImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppDimensions.carouselImageSize,
        height: AppDimensions.carouselImageSize,
        decoration: BoxDecoration(
          borderRadius: AppDimensions.borderRadiusLg,
          color: AppColors.background,
        ),
        child: ClipRRect(
          borderRadius: AppDimensions.borderRadiusLg,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: AppDimensions.carouselImageSize,
            height: AppDimensions.carouselImageSize,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.background,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: AppDimensions.iconXxl,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Gambar tidak tersedia',
                        style: AppTypography.caption,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Indicator dots untuk carousel
class _IndicatorDots extends StatelessWidget {
  final int count;
  final int activeIndex;
  final ValueChanged<int>? onDotTap;

  const _IndicatorDots({
    required this.count,
    required this.activeIndex,
    this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return GestureDetector(
          onTap: () => onDotTap?.call(index),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: AppAnimations.durationFast,
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
            width: isActive
                ? AppDimensions.indicatorDotActiveWidth
                : AppDimensions.indicatorDotInactiveWidth,
            height: isActive
                ? AppDimensions.indicatorDotActiveHeight
                : AppDimensions.indicatorDotInactiveHeight,
            decoration: BoxDecoration(
              color: isActive ? AppColors.accent : AppColors.border,
              borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            ),
          ),
        );
      }),
    );
  }
}

/// Widget indikator dots standalone (dapat digunakan terpisah)
///
/// ```dart
/// CarouselIndicator(
///   count: 4,
///   activeIndex: currentIndex,
///   onDotTap: (index) => controller.animateToPage(index),
/// )
/// ```
class CarouselIndicator extends StatelessWidget {
  /// Jumlah dots
  final int count;

  /// Index yang aktif
  final int activeIndex;

  /// Callback ketika dot di-tap
  final ValueChanged<int>? onDotTap;

  /// Warna dot aktif (default: AppColors.accent)
  final Color? activeColor;

  /// Warna dot tidak aktif (default: AppColors.border)
  final Color? inactiveColor;

  const CarouselIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
    this.onDotTap,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return GestureDetector(
          onTap: () => onDotTap?.call(index),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: AppAnimations.durationFast,
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
            width: isActive
                ? AppDimensions.indicatorDotActiveWidth
                : AppDimensions.indicatorDotInactiveWidth,
            height: isActive
                ? AppDimensions.indicatorDotActiveHeight
                : AppDimensions.indicatorDotInactiveHeight,
            decoration: BoxDecoration(
              color: isActive
                  ? (activeColor ?? AppColors.accent)
                  : (inactiveColor ?? AppColors.border),
              borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            ),
          ),
        );
      }),
    );
  }
}
