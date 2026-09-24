import 'package:flutter/material.dart';

/// AppShimmer
///
/// A highly optimized shimmer effect wrapper for creating skeleton loading states.
/// It uses a built-in Flutter `AnimationController` and `ShaderMask` with a
/// `LinearGradient` to produce the effect seamlessly without external dependencies.
/// Thread safe, respects disposing lifecycle to prevent Memory Leak and ANR.
class AppShimmer extends StatefulWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const AppShimmer({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE2E8F0), // designsystems border / grey 200
    this.highlightColor = const Color(
      0xFFF8FAFC,
    ), // designsystems background / grey 50
    this.duration = const Duration(milliseconds: 1500),
  });

  /// Factory constructor for the standard predefined rectangle shimmer.
  /// Typically used inside a ListView wrapper.
  static Widget raw({
    double width = double.infinity,
    double height = 16.0,
    double borderRadius = 8.0,
  }) {
    return AppShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(); // Continuously animate
  }

  @override
  void dispose() {
    _controller.dispose(); // Prevent memory leak / ANR
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.1, 0.3, 0.4],
              transform: _SlidingGradientTransform(
                slidePercent: _controller.value,
              ),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    // Sliding horizontally
    return Matrix4.translationValues(
      bounds.width * slidePercent * 3.0 - bounds.width,
      0.0,
      0.0,
    );
  }
}

/// A ready-to-use ListView of shimmering cards.
class AppShimmerList extends StatelessWidget {
  final int itemCount;
  final double cardHeight;
  final EdgeInsetsGeometry padding;
  final double separatorHeight;

  const AppShimmerList({
    super.key,
    this.itemCount = 5,
    this.cardHeight = 120.0,
    this.padding = const EdgeInsets.all(16.0),
    this.separatorHeight = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      itemCount: itemCount,
      separatorBuilder: (context, index) => SizedBox(height: separatorHeight),
      itemBuilder: (context, index) {
        return AppShimmer(
          child: Container(
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 150,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 100,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
