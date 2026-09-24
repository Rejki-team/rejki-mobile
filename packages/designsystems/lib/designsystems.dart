/// Design Systems Package
///
/// A comprehensive design system for the application containing
/// colors, typography, spacing, dimensions, shadows, animations, and themes.
///
/// Usage:
/// ```dart
/// import 'package:designsystems/designsystems.dart';
///
/// // Use colors
/// Container(color: AppColors.primary)
///
/// // Use typography
/// Text('Hello', style: AppTypography.headlineLarge)
///
/// // Use spacing
/// Padding(padding: AppSpacing.paddingAllMd)
///
/// // Use dimensions
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppDimensions.borderRadiusMd,
///   ),
/// )
///
/// // Use shadows
/// Container(
///   decoration: BoxDecoration(
///     boxShadow: AppShadows.md,
///   ),
/// )
///
/// // Use theme
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// )
/// ```
library;

// Colors
export 'src/colors/app_colors.dart';

// Typography
export 'src/typography/app_typography.dart';

// Spacing
export 'src/spacing/app_spacing.dart';

// Dimensions
export 'src/dimensions/app_dimensions.dart';

// Shadows
export 'src/shadows/app_shadows.dart';

// Animations
export 'src/animations/app_animations.dart';

// Assets
export 'src/assets/app_assets.dart';

// Theme
export 'src/theme/app_theme.dart';
