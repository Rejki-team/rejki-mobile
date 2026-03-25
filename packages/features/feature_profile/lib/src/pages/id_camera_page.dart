import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:designsystems/designsystems.dart';

/// Type of ID document for camera overlay
enum IdDocumentType {
  /// Indonesian ID Card (KTP) - landscape card
  ktp,

  /// Selfie with KTP - oval face + rectangle KTP
  selfieWithKtp,
}

/// Custom Camera Page for ID Document Capture
///
/// A full-screen camera page with dashed overlay guide for capturing
/// ID documents like KTP (Indonesian ID Card).
///
/// Features:
/// - Full camera preview
/// - Dashed rectangle overlay as capture guide (KTP mode)
/// - Oval face + rectangle KTP overlay (selfie mode)
/// - Portrait mode forced
/// - Front/back camera selection based on mode
/// - Capture and retake functionality
///
/// Example:
/// ```dart
/// final result = await Navigator.push<File>(
///   context,
///   MaterialPageRoute(
///     builder: (context) => IdCameraPage(
///       documentType: IdDocumentType.ktp,
///       title: 'Foto KTP',
///     ),
///   ),
/// );
/// if (result != null) {
///   // Handle captured image
/// }
/// ```
class IdCameraPage extends StatefulWidget {
  /// Type of document to capture (affects overlay shape)
  final IdDocumentType documentType;

  /// Title shown in header
  final String title;

  /// Instruction text shown below overlay
  final String instruction;

  const IdCameraPage({
    super.key,
    this.documentType = IdDocumentType.ktp,
    this.title = 'Foto KTP',
    this.instruction = 'Posisikan KTP Anda dalam bingkai',
  });

  @override
  State<IdCameraPage> createState() => _IdCameraPageState();
}

class _IdCameraPageState extends State<IdCameraPage>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isCapturing = false;
  String? _errorMessage;
  File? _capturedImage;
  bool _showPreview = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    _lockOrientation();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    _unlockOrientation();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  /// Lock orientation to portrait mode
  Future<void> _lockOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Unlock orientation when leaving
  Future<void> _unlockOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// Initialize camera
  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();

      if (_cameras == null || _cameras!.isEmpty) {
        setState(() {
          _errorMessage = 'Tidak ada kamera yang tersedia';
        });
        return;
      }

      // Use front camera for selfie, back camera for ID document
      final preferredDirection =
          widget.documentType == IdDocumentType.selfieWithKtp
          ? CameraLensDirection.front
          : CameraLensDirection.back;

      final camera = _cameras!.firstWhere(
        (cam) => cam.lensDirection == preferredDirection,
        orElse: () => _cameras!.first,
      );

      _controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _controller!.initialize();

      // Lock capture orientation to portrait
      await _controller!.lockCaptureOrientation(DeviceOrientation.portraitUp);

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal menginisialisasi kamera: $e';
      });
    }
  }

  /// Capture photo
  Future<void> _capturePhoto() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isCapturing) {
      return;
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile image = await _controller!.takePicture();

      if (mounted) {
        setState(() {
          _capturedImage = File(image.path);
          _showPreview = true;
          _isCapturing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal mengambil foto: $e')));
      }
    }
  }

  /// Retake photo
  void _retakePhoto() {
    setState(() {
      _capturedImage = null;
      _showPreview = false;
    });
  }

  /// Confirm and return captured image
  void _confirmPhoto() {
    if (_capturedImage != null) {
      Navigator.of(context).pop(_capturedImage);
    }
  }

  /// Cancel and go back
  void _cancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Camera Preview or Captured Image Preview
            _showPreview ? _buildImagePreview() : _buildCameraPreview(),

            // Top Bar
            _buildTopBar(),

            // Overlay Guide (only in camera mode)
            if (!_showPreview) _buildOverlayGuide(),

            // Bottom Controls
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  /// Build camera preview
  Widget _buildCameraPreview() {
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 48),
              const SizedBox(height: AppSpacing.md),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
              ElevatedButton(
                onPressed: _initializeCamera,
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return Center(child: CameraPreview(_controller!));
  }

  /// Build captured image preview
  Widget _buildImagePreview() {
    if (_capturedImage == null) {
      return const SizedBox.shrink();
    }

    return Center(child: Image.file(_capturedImage!, fit: BoxFit.contain));
  }

  /// Build top bar with title and close button
  Widget _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            // Close Button
            IconButton(
              onPressed: _cancel,
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
            ),

            // Title
            Expanded(
              child: Text(
                widget.title,
                style: AppTypography.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Placeholder for symmetry
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  /// Build dashed overlay guide for ID document
  Widget _buildOverlayGuide() {
    return Positioned.fill(
      child: IgnorePointer(
        child: CustomPaint(
          painter: _IdOverlayPainter(documentType: widget.documentType),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Instruction text
                Container(
                  margin: const EdgeInsets.only(bottom: 120),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                  ),
                  child: Text(
                    widget.instruction,
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build bottom controls (capture/confirm buttons)
  Widget _buildBottomControls() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
          ),
        ),
        child: _showPreview ? _buildPreviewControls() : _buildCaptureControls(),
      ),
    );
  }

  /// Build capture controls
  Widget _buildCaptureControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Capture Button
        GestureDetector(
          onTap: _isCapturing ? null : _capturePhoto,
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Center(
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isCapturing ? Colors.grey : Colors.white,
                ),
                child: _isCapturing
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Build preview controls (retake/confirm)
  Widget _buildPreviewControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Retake Button
        _buildControlButton(
          icon: Icons.refresh,
          label: 'Ulangi',
          onPressed: _retakePhoto,
        ),

        // Confirm Button
        _buildControlButton(
          icon: Icons.check,
          label: 'Gunakan',
          onPressed: _confirmPhoto,
          isPrimary: true,
        ),
      ],
    );
  }

  /// Build control button
  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isPrimary
                  ? AppColors.buttonGradientEnd
                  : Colors.white.withValues(alpha: 0.2),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for ID document overlay with dashed border
class _IdOverlayPainter extends CustomPainter {
  final IdDocumentType documentType;

  _IdOverlayPainter({required this.documentType});

  @override
  void paint(Canvas canvas, Size size) {
    switch (documentType) {
      case IdDocumentType.ktp:
        _paintKtpOverlay(canvas, size);
        break;
      case IdDocumentType.selfieWithKtp:
        _paintSelfieWithKtpOverlay(canvas, size);
        break;
    }
  }

  /// Paint KTP overlay (single rectangle)
  void _paintKtpOverlay(Canvas canvas, Size size) {
    final overlayWidth = size.width * 0.85;
    // KTP aspect ratio is approximately 85.6mm x 53.98mm (1.586:1)
    final overlayHeight = overlayWidth / 1.586;

    final left = (size.width - overlayWidth) / 2;
    final top = (size.height - overlayHeight) / 2 - 30;

    final overlayRect = Rect.fromLTWH(left, top, overlayWidth, overlayHeight);

    // Draw semi-transparent overlay
    _drawDarkenedOverlay(canvas, size, [
      RRect.fromRectAndRadius(overlayRect, const Radius.circular(12)),
    ]);

    // Draw dashed border
    _drawDashedRRect(
      canvas,
      RRect.fromRectAndRadius(overlayRect, const Radius.circular(12)),
      Colors.white,
      3.0,
      12.0,
      8.0,
    );

    // Draw corner markers
    _drawCornerMarkers(canvas, overlayRect, Colors.white, 4.0, 30.0);
  }

  /// Paint Selfie with KTP overlay (oval for face + rectangle for KTP)
  void _paintSelfieWithKtpOverlay(Canvas canvas, Size size) {
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Face oval dimensions (upper half of screen)
    final faceWidth = screenWidth * 0.55;
    final faceHeight = faceWidth * 1.3; // Oval face ratio
    final faceLeft = (screenWidth - faceWidth) / 2;
    final faceTop = screenHeight * 0.12;
    final faceRect = Rect.fromLTWH(faceLeft, faceTop, faceWidth, faceHeight);

    // KTP rectangle dimensions (below face)
    final ktpWidth = screenWidth * 0.7;
    final ktpHeight = ktpWidth / 1.586; // KTP aspect ratio
    final ktpLeft = (screenWidth - ktpWidth) / 2;
    final ktpTop = faceTop + faceHeight + 30; // 30px gap below face
    final ktpRect = Rect.fromLTWH(ktpLeft, ktpTop, ktpWidth, ktpHeight);

    // Draw semi-transparent overlay with both holes
    _drawDarkenedOverlayWithOval(canvas, size, faceRect, ktpRect);

    // Draw dashed oval for face
    _drawDashedOval(canvas, faceRect, Colors.white, 3.0, 10.0, 6.0);

    // Draw dashed rectangle for KTP
    _drawDashedRRect(
      canvas,
      RRect.fromRectAndRadius(ktpRect, const Radius.circular(8)),
      Colors.white,
      3.0,
      12.0,
      8.0,
    );

    // Draw corner markers for KTP
    _drawCornerMarkers(canvas, ktpRect, Colors.white, 3.0, 20.0);

    // Draw face label
    _drawLabel(canvas, 'Wajah', faceRect.center.dx, faceTop - 20, Colors.white);

    // Draw KTP label
    _drawLabel(canvas, 'KTP', ktpRect.center.dx, ktpTop - 15, Colors.white);
  }

  /// Draw darkened overlay with holes for face oval and KTP rectangle
  void _drawDarkenedOverlayWithOval(
    Canvas canvas,
    Size size,
    Rect faceRect,
    Rect ktpRect,
  ) {
    final overlayPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    final fullPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create oval path for face
    final facePath = Path()..addOval(faceRect);

    // Create rounded rect path for KTP
    final ktpPath = Path()
      ..addRRect(RRect.fromRectAndRadius(ktpRect, const Radius.circular(8)));

    // Combine paths
    var combinedPath = Path.combine(
      PathOperation.difference,
      fullPath,
      facePath,
    );
    combinedPath = Path.combine(
      PathOperation.difference,
      combinedPath,
      ktpPath,
    );

    canvas.drawPath(combinedPath, overlayPaint);
  }

  /// Draw darkened overlay with RRect holes
  void _drawDarkenedOverlay(Canvas canvas, Size size, List<RRect> holes) {
    final overlayPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    final fullPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path combinedPath = fullPath;
    for (final hole in holes) {
      final holePath = Path()..addRRect(hole);
      combinedPath = Path.combine(
        PathOperation.difference,
        combinedPath,
        holePath,
      );
    }

    canvas.drawPath(combinedPath, overlayPaint);
  }

  /// Draw dashed oval
  void _drawDashedOval(
    Canvas canvas,
    Rect rect,
    Color color,
    double strokeWidth,
    double dashLength,
    double gapLength,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()..addOval(rect);
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final start = distance;
        final end = (distance + dashLength).clamp(0.0, metric.length);

        final extractPath = metric.extractPath(start, end);
        canvas.drawPath(extractPath, paint);

        distance += dashLength + gapLength;
      }
    }
  }

  /// Draw dashed rounded rectangle
  void _drawDashedRRect(
    Canvas canvas,
    RRect rrect,
    Color color,
    double strokeWidth,
    double dashLength,
    double gapLength,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()..addRRect(rrect);
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final start = distance;
        final end = (distance + dashLength).clamp(0.0, metric.length);

        final extractPath = metric.extractPath(start, end);
        canvas.drawPath(extractPath, paint);

        distance += dashLength + gapLength;
      }
    }
  }

  /// Draw corner markers for emphasis
  void _drawCornerMarkers(
    Canvas canvas,
    Rect rect,
    Color color,
    double strokeWidth,
    double markerLength,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Top-left corner
    canvas.drawLine(
      Offset(rect.left, rect.top + markerLength),
      Offset(rect.left, rect.top),
      paint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.top),
      Offset(rect.left + markerLength, rect.top),
      paint,
    );

    // Top-right corner
    canvas.drawLine(
      Offset(rect.right - markerLength, rect.top),
      Offset(rect.right, rect.top),
      paint,
    );
    canvas.drawLine(
      Offset(rect.right, rect.top),
      Offset(rect.right, rect.top + markerLength),
      paint,
    );

    // Bottom-left corner
    canvas.drawLine(
      Offset(rect.left, rect.bottom - markerLength),
      Offset(rect.left, rect.bottom),
      paint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.bottom),
      Offset(rect.left + markerLength, rect.bottom),
      paint,
    );

    // Bottom-right corner
    canvas.drawLine(
      Offset(rect.right - markerLength, rect.bottom),
      Offset(rect.right, rect.bottom),
      paint,
    );
    canvas.drawLine(
      Offset(rect.right, rect.bottom),
      Offset(rect.right, rect.bottom - markerLength),
      paint,
    );
  }

  /// Draw label text
  void _drawLabel(Canvas canvas, String text, double x, double y, Color color) {
    final textSpan = TextSpan(
      text: text,
      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final offset = Offset(
      x - textPainter.width / 2,
      y - textPainter.height / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant _IdOverlayPainter oldDelegate) {
    return oldDelegate.documentType != documentType;
  }
}
