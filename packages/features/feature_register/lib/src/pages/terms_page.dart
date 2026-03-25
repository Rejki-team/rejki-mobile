import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import '../cubit/cubit.dart';

/// Halaman Terms & Conditions
///
/// Menampilkan halaman syarat & ketentuan dengan WebView.
/// User wajib scroll sampai bawah untuk mengaktifkan checkbox,
/// dan wajib centang checkbox untuk mengaktifkan tombol Setuju.
class TermsPage extends StatelessWidget {
  /// Asset path atau URL untuk terms
  final String termsSource;

  /// Apakah source adalah asset lokal
  final bool isAsset;

  /// Versi terms
  final String termsVersion;

  /// Callback saat user setuju (mengembalikan ConsentModel)
  final void Function(ConsentModel consent)? onAgree;

  /// Callback saat user cancel
  final VoidCallback? onCancel;

  const TermsPage({
    super.key,
    required this.termsSource,
    this.isAsset = true,
    this.termsVersion = 'v1.0.0',
    this.onAgree,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TermsCubit(),
      child: _TermsView(
        termsSource: termsSource,
        isAsset: isAsset,
        termsVersion: termsVersion,
        onAgree: onAgree,
        onCancel: onCancel,
      ),
    );
  }
}

class _TermsView extends StatefulWidget {
  final String termsSource;
  final bool isAsset;
  final String termsVersion;
  final void Function(ConsentModel consent)? onAgree;
  final VoidCallback? onCancel;

  const _TermsView({
    required this.termsSource,
    required this.isAsset,
    required this.termsVersion,
    this.onAgree,
    this.onCancel,
  });

  @override
  State<_TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<_TermsView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  Future<void> _initWebView() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            context.read<TermsCubit>().updateProgress(progress);
          },
          onPageStarted: (String url) {
            context.read<TermsCubit>().setLoading(true);
          },
          onPageFinished: (String url) {
            context.read<TermsCubit>().setLoading(false);
            _injectScrollListener();
          },
          onWebResourceError: (WebResourceError error) {
            context.read<TermsCubit>().setError(
              'Gagal memuat halaman: ${error.description}',
            );
          },
        ),
      );

    // Load content
    if (widget.isAsset) {
      await _loadAsset();
    } else {
      await _controller.loadRequest(Uri.parse(widget.termsSource));
    }
  }

  Future<void> _loadAsset() async {
    try {
      final htmlContent = await rootBundle.loadString(widget.termsSource);
      await _controller.loadHtmlString(htmlContent);
    } catch (e) {
      if (mounted) {
        context.read<TermsCubit>().setError('Gagal memuat dokumen: $e');
      }
    }
  }

  Future<void> _injectScrollListener() async {
    // Inject JavaScript to detect scroll to bottom
    await _controller.runJavaScript('''
      (function() {
        var hasReachedBottom = false;
        
        function checkScroll() {
          var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
          var scrollHeight = document.documentElement.scrollHeight;
          var clientHeight = document.documentElement.clientHeight;
          
          // Consider "bottom" when user is within 50px of the bottom
          if (scrollTop + clientHeight >= scrollHeight - 50) {
            if (!hasReachedBottom) {
              hasReachedBottom = true;
              window.flutter_inappwebview.callHandler('scrolledToBottom');
            }
          }
        }
        
        window.addEventListener('scroll', checkScroll);
        // Also check on initial load
        setTimeout(checkScroll, 500);
      })();
    ''');

    // Add JavaScript channel for scroll detection
    await _controller.addJavaScriptChannel(
      'flutter_inappwebview',
      onMessageReceived: (JavaScriptMessage message) {
        if (message.message == 'scrolledToBottom' || mounted) {
          context.read<TermsCubit>().scrolledToBottom();
        }
      },
    );

    // Alternative: Check scroll position periodically
    _startScrollCheck();
  }

  void _startScrollCheck() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (!mounted) return;

      try {
        final result = await _controller.runJavaScriptReturningResult('''
          (function() {
            var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            var scrollHeight = document.documentElement.scrollHeight;
            var clientHeight = document.documentElement.clientHeight;
            return scrollTop + clientHeight >= scrollHeight - 50;
          })();
        ''');

        if (result.toString() == 'true') {
          if (mounted) {
            context.read<TermsCubit>().scrolledToBottom();
          }
        } else {
          _startScrollCheck(); // Continue checking
        }
      } catch (e) {
        // Ignore errors, continue checking
        _startScrollCheck();
      }
    });
  }

  void _handleAgree() {
    final consent = ConsentModel(
      hasAgreed: true,
      agreedAt: DateTime.now(),
      termsVersion: widget.termsVersion,
      termsSource: widget.termsSource,
    );
    widget.onAgree?.call(consent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: const Text('Syarat & Ketentuan'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: widget.onCancel,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Loading indicator
          BlocBuilder<TermsCubit, TermsState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.loadingProgress != current.loadingProgress,
            builder: (context, state) {
              if (state.isLoading) {
                return LinearProgressIndicator(
                  value: state.loadingProgress / 100,
                  backgroundColor: AppColors.border,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          // WebView
          Expanded(
            child: BlocBuilder<TermsCubit, TermsState>(
              buildWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage,
              builder: (context, state) {
                if (state.errorMessage != null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: AppColors.error,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            state.errorMessage!,
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return WebViewWidget(controller: _controller);
              },
            ),
          ),

          // Scroll hint
          BlocBuilder<TermsCubit, TermsState>(
            buildWhen: (previous, current) =>
                previous.hasScrolledToBottom != current.hasScrolledToBottom,
            builder: (context, state) {
              if (!state.hasScrolledToBottom) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.sm,
                    horizontal: AppSpacing.md,
                  ),
                  color: AppColors.warning.withValues(alpha: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        size: 16,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        'Scroll ke bawah untuk melanjutkan',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          // Bottom section
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textBlack.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  // Checkbox
                  BlocBuilder<TermsCubit, TermsState>(
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: state.hasAgreed,
                              onChanged: state.canAgree
                                  ? (value) => context
                                        .read<TermsCubit>()
                                        .toggleAgreement(value ?? false)
                                  : null,
                              activeColor: AppColors.primary,
                              side: BorderSide(
                                color: state.canAgree
                                    ? AppColors.border
                                    : AppColors.border.withValues(alpha: 0.5),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppDimensions.borderRadiusXs,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: GestureDetector(
                              onTap: state.canAgree
                                  ? () => context
                                        .read<TermsCubit>()
                                        .toggleAgreement(!state.hasAgreed)
                                  : null,
                              child: Text(
                                'Saya telah membaca dan menyetujui seluruh isi Syarat & Ketentuan di atas',
                                style: AppTypography.caption.copyWith(
                                  color: state.canAgree
                                      ? AppColors.textBlack
                                      : AppColors.textCaption,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: AppSpacing.md),

                  // Buttons
                  BlocBuilder<TermsCubit, TermsState>(
                    buildWhen: (previous, current) =>
                        previous.canSubmit != current.canSubmit,
                    builder: (context, state) {
                      return Row(
                        children: [
                          // Cancel button
                          Expanded(
                            child: AppOutlinedButton(
                              text: 'Batal',
                              icon: Icons.close,
                              onPressed: widget.onCancel,
                            ),
                          ),

                          const SizedBox(width: AppSpacing.md),

                          // Agree button
                          Expanded(
                            child: AppFilledGradientButton(
                              text: 'Setuju',
                              showIcon: false,
                              isEnabled: state.canSubmit,
                              onPressed: _handleAgree,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
