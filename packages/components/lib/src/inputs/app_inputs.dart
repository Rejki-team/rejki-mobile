import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Email Input Field Widget
///
/// Input field untuk email dengan ikon user di sebelah kiri.
///
/// ```dart
/// AppEmailInput(
///   controller: emailController,
///   hintText: 'Masukkan email',
///   isRequired: true,
///   onChanged: (value) => print(value),
/// )
/// ```
class AppEmailInput extends StatefulWidget {
  /// Label input
  final String label;

  /// Hint text
  final String hintText;

  /// Controller untuk input
  final TextEditingController? controller;

  /// Callback saat nilai berubah
  final ValueChanged<String>? onChanged;

  /// Apakah field wajib diisi
  final bool isRequired;

  /// Focus node
  final FocusNode? focusNode;

  /// Error message
  final String? errorText;

  /// Apakah enabled
  final bool enabled;

  const AppEmailInput({
    super.key,
    this.label = 'Email',
    this.hintText = 'Masukkan email Anda',
    this.controller,
    this.onChanged,
    this.isRequired = true,
    this.focusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<AppEmailInput> createState() => _AppEmailInputState();
}

class _AppEmailInputState extends State<AppEmailInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label row
        _InputLabel(label: widget.label, isRequired: widget.isRequired),

        const SizedBox(height: AppSpacing.sm),

        // Input field
        _FocusableInputContainer(
          isFocused: _isFocused,
          hasError: widget.errorText != null,
          child: Row(
            children: [
              // Left icon
              SvgPicture.asset(
                AppAssets.iconUser,
                width: AppDimensions.iconSm,
                height: AppDimensions.iconSm,
                colorFilter: const ColorFilter.mode(
                  AppColors.textCaption,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

              // Text input
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                  keyboardType: TextInputType.emailAddress,
                  style: AppTypography.inputText,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: AppTypography.inputHint,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Error text
        if (widget.errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.errorText!,
            style: AppTypography.caption.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

/// Password Input Field Widget
///
/// Input field untuk password dengan toggle visibility.
///
/// ```dart
/// AppPasswordInput(
///   controller: passwordController,
///   hintText: 'Masukkan password',
///   isRequired: true,
///   onChanged: (value) => print(value),
/// )
/// ```
class AppPasswordInput extends StatefulWidget {
  /// Label input
  final String label;

  /// Hint text
  final String hintText;

  /// Controller untuk input
  final TextEditingController? controller;

  /// Callback saat nilai berubah
  final ValueChanged<String>? onChanged;

  /// Apakah field wajib diisi
  final bool isRequired;

  /// Focus node
  final FocusNode? focusNode;

  /// Error message
  final String? errorText;

  /// Apakah enabled
  final bool enabled;

  const AppPasswordInput({
    super.key,
    this.label = 'Password',
    this.hintText = 'Masukkan password Anda',
    this.controller,
    this.onChanged,
    this.isRequired = true,
    this.focusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<AppPasswordInput> createState() => _AppPasswordInputState();
}

class _AppPasswordInputState extends State<AppPasswordInput> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label row
        _InputLabel(label: widget.label, isRequired: widget.isRequired),

        const SizedBox(height: AppSpacing.sm),

        // Input field
        _FocusableInputContainer(
          isFocused: _isFocused,
          hasError: widget.errorText != null,
          child: Row(
            children: [
              // Left icon - Lock
              SvgPicture.asset(
                AppAssets.iconLock,
                width: AppDimensions.iconSm,
                height: AppDimensions.iconSm,
                colorFilter: const ColorFilter.mode(
                  AppColors.textCaption,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

              // Text input
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                  obscureText: _obscureText,
                  style: AppTypography.inputText,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: AppTypography.inputHint,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

              // Right icon - Show/Hide toggle
              GestureDetector(
                onTap: _toggleVisibility,
                behavior: HitTestBehavior.opaque,
                child: SvgPicture.asset(
                  _obscureText ? AppAssets.iconShow : AppAssets.iconHide,
                  width: AppDimensions.iconSm,
                  height: AppDimensions.iconSm,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textCaption,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Error text
        if (widget.errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.errorText!,
            style: AppTypography.caption.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

/// Remember Me Checkbox Widget
///
/// Checkbox dengan label "Ingat saya".
///
/// ```dart
/// AppRememberMeCheckbox(
///   value: rememberMe,
///   onChanged: (value) => setState(() => rememberMe = value),
/// )
/// ```
class AppRememberMeCheckbox extends StatelessWidget {
  /// Nilai checkbox
  final bool value;

  /// Callback saat nilai berubah
  final ValueChanged<bool>? onChanged;

  /// Label teks
  final String label;

  const AppRememberMeCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label = 'Ingat saya',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Checkbox icon
          SvgPicture.asset(
            value
                ? AppAssets.iconCheckboxEnabled
                : AppAssets.iconCheckboxDefault,
            width: AppDimensions.iconMd,
            height: AppDimensions.iconMd,
          ),

          const SizedBox(width: AppSpacing.xs),

          // Label
          Text(label, style: AppTypography.checkboxLabel),
        ],
      ),
    );
  }
}

/// Phone Input Field Widget
///
/// Input field untuk nomor telepon dengan ikon calling di sebelah kiri.
///
/// ```dart
/// AppPhoneInput(
///   controller: phoneController,
///   hintText: 'Masukkan nomor telepon',
///   isRequired: true,
///   onChanged: (value) => print(value),
/// )
/// ```
class AppPhoneInput extends StatefulWidget {
  /// Label input
  final String label;

  /// Hint text
  final String hintText;

  /// Controller untuk input
  final TextEditingController? controller;

  /// Callback saat nilai berubah
  final ValueChanged<String>? onChanged;

  /// Apakah field wajib diisi
  final bool isRequired;

  /// Focus node
  final FocusNode? focusNode;

  /// Error message
  final String? errorText;

  /// Apakah enabled
  final bool enabled;

  const AppPhoneInput({
    super.key,
    this.label = 'No Telephone',
    this.hintText = 'Masukkan nomor telepon Anda',
    this.controller,
    this.onChanged,
    this.isRequired = true,
    this.focusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<AppPhoneInput> createState() => _AppPhoneInputState();
}

class _AppPhoneInputState extends State<AppPhoneInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label row
        _InputLabel(label: widget.label, isRequired: widget.isRequired),

        const SizedBox(height: AppSpacing.sm),

        // Input field
        _FocusableInputContainer(
          isFocused: _isFocused,
          hasError: widget.errorText != null,
          child: Row(
            children: [
              // Left icon - Calling
              SvgPicture.asset(
                AppAssets.iconCalling,
                width: AppDimensions.iconSm,
                height: AppDimensions.iconSm,
                colorFilter: const ColorFilter.mode(
                  AppColors.textCaption,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

              // Text input
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                  keyboardType: TextInputType.phone,
                  style: AppTypography.inputText,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: AppTypography.inputHint,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Error text
        if (widget.errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.errorText!,
            style: AppTypography.caption.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

/// Code/Number Input Field Widget
///
/// Input field untuk kode verifikasi atau angka.
///
/// ```dart
/// AppCodeInput(
///   controller: codeController,
///   hintText: 'Masukkan kode verifikasi',
///   isRequired: false,
///   onChanged: (value) => print(value),
/// )
/// ```
class AppCodeInput extends StatefulWidget {
  /// Label input
  final String label;

  /// Hint text
  final String hintText;

  /// Controller untuk input
  final TextEditingController? controller;

  /// Callback saat nilai berubah
  final ValueChanged<String>? onChanged;

  /// Apakah field wajib diisi
  final bool isRequired;

  /// Focus node
  final FocusNode? focusNode;

  /// Error message
  final String? errorText;

  /// Apakah enabled
  final bool enabled;

  /// Maksimum panjang kode
  final int? maxLength;

  const AppCodeInput({
    super.key,
    this.label = 'Kode Verifikasi',
    this.hintText = 'Masukkan kode verifikasi',
    this.controller,
    this.onChanged,
    this.isRequired = false,
    this.focusNode,
    this.errorText,
    this.enabled = true,
    this.maxLength,
  });

  @override
  State<AppCodeInput> createState() => _AppCodeInputState();
}

class _AppCodeInputState extends State<AppCodeInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label row
        _InputLabel(label: widget.label, isRequired: widget.isRequired),

        const SizedBox(height: AppSpacing.sm),

        // Input field
        _FocusableInputContainer(
          isFocused: _isFocused,
          hasError: widget.errorText != null,
          child: Row(
            children: [
              // Left icon - Lock/Key
              SvgPicture.asset(
                AppAssets.iconLock,
                width: AppDimensions.iconSm,
                height: AppDimensions.iconSm,
                colorFilter: const ColorFilter.mode(
                  AppColors.textCaption,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

              // Text input
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                  keyboardType: TextInputType.number,
                  maxLength: widget.maxLength,
                  style: AppTypography.inputText,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: AppTypography.inputHint,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    counterText: '', // Hide character counter
                  ),
                ),
              ),
            ],
          ),
        ),

        // Error text
        if (widget.errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.errorText!,
            style: AppTypography.caption.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

/// Input Label Widget (internal)
class _InputLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const _InputLabel({required this.label, required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: AppTypography.inputLabel),
        if (isRequired) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text(
            '*',
            style: AppTypography.inputLabel.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

/// Focusable Input Container with double border effect
///
/// When focused:
/// - Inner border: 1px #155DFC (inputFocusBorder)
/// - Outer border: 3px #A8CDFF (inputFocusOuter) using BoxShadow
///
/// When error:
/// - Inner border: 1px #EF4444 (error)
/// - Outer border: 3px #FECACA (errorOuter) using BoxShadow
class _FocusableInputContainer extends StatelessWidget {
  final Widget child;
  final bool isFocused;
  final bool hasError;

  const _FocusableInputContainer({
    required this.child,
    this.isFocused = false,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    // Determine border color
    Color borderColor;
    if (hasError) {
      borderColor = AppColors.error;
    } else if (isFocused) {
      borderColor = AppColors.inputFocusBorder;
    } else {
      borderColor = AppColors.border;
    }

    // Determine shadow (outer glow)
    List<BoxShadow>? boxShadow;
    if (hasError) {
      boxShadow = [
        BoxShadow(color: AppColors.errorOuter, blurRadius: 0, spreadRadius: 3),
      ];
    } else if (isFocused) {
      boxShadow = [
        BoxShadow(
          color: AppColors.inputFocusOuter,
          blurRadius: 0,
          spreadRadius: 3,
        ),
      ];
    }

    return AnimatedContainer(
      duration: AppAnimations.durationFast,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.smd,
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(color: borderColor, width: AppDimensions.borderThin),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

/// Checkbox dengan teks yang memiliki link
///
/// Widget checkbox dengan label yang dapat memiliki teks biasa
/// dan teks link yang dapat diklik.
///
/// ```dart
/// AppCheckboxWithLink(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value),
///   prefixText: 'Saya setuju dengan segala ',
///   linkText: 'syarat & ketentuan',
///   suffixText: ' aplikasi rejki',
///   onLinkTap: () => openWebView(),
/// )
/// ```
class AppCheckboxWithLink extends StatelessWidget {
  /// Nilai checkbox
  final bool value;

  /// Callback saat nilai berubah
  final ValueChanged<bool>? onChanged;

  /// Teks sebelum link
  final String prefixText;

  /// Teks link yang dapat diklik
  final String linkText;

  /// Teks setelah link
  final String suffixText;

  /// Callback saat link diklik
  final VoidCallback? onLinkTap;

  /// Error message
  final String? errorText;

  const AppCheckboxWithLink({
    super.key,
    required this.value,
    this.onChanged,
    this.prefixText = '',
    required this.linkText,
    this.suffixText = '',
    this.onLinkTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: value,
                onChanged: onChanged != null
                    ? (v) => onChanged!(v ?? false)
                    : null,
                activeColor: AppColors.primary,
                side: BorderSide(
                  color: errorText != null ? AppColors.error : AppColors.border,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),

            const SizedBox(width: AppSpacing.sm),

            // Label with link
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text.rich(
                  TextSpan(
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textBlack,
                    ),
                    children: [
                      TextSpan(text: prefixText),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: GestureDetector(
                          onTap: onLinkTap,
                          child: Text(
                            linkText,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(text: suffixText),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // Error text
        if (errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            errorText!,
            style: AppTypography.caption.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}
