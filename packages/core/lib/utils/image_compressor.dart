import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

/// Image compression utility (reusable across all feature packages).
///
/// ## Purpose
/// Compress a [File] image to a maximum of [_maxFileSizeKb] KB without
/// sacrificing quality unnecessarily. Uses an iterative quality-reduction
/// approach from [_initialQuality] down to [_minQuality].
///
/// ## Threading Model
/// [FlutterImageCompress] already dispatches all pixel-processing work to
/// native background threads internally via its platform channel.
/// Wrapping it in `compute()` (a Dart isolate) would cause
/// `UnimplementedError` because platform channels are **not** accessible
/// from background Dart isolates. The call is therefore made directly on
/// the main Dart isolate — the native side handles the concurrency.
///
/// ## Guarantees
/// - Never modifies the original [File].
/// - Heavy work runs on the native background thread (no ANR risk).
/// - Returns a compressed JPEG copy in the system temp directory.
/// - Callers always receive a [File] (uniform API surface).
///
/// ## Usage
/// ```dart
/// final compressed = await ImageCompressor.compress(originalFile);
/// bloc.add(ImagesChanged([...current, compressed]));
/// ```
class ImageCompressor {
  const ImageCompressor._();

  /// Maximum output file size in kilobytes.
  static const int _maxFileSizeKb = 250;

  /// Maximum output file size in bytes (derived).
  static const int _maxFileSizeBytes = _maxFileSizeKb * 1024;

  /// Starting JPEG quality (0–100).
  static const int _initialQuality = 85;

  /// Quality reduction per iteration.
  static const int _qualityStep = 10;

  /// Minimum quality floor — below this we return best-effort to avoid
  /// severe degradation.
  static const int _minQuality = 30;

  /// Compress [source] to ≤ 250 KB.
  ///
  /// Iteratively compresses from quality [_initialQuality] down to
  /// [_minQuality] until the output fits within [_maxFileSizeBytes].
  ///
  /// Throws [ImageCompressionException] if:
  /// - [source] does not exist on disk.
  /// - The platform compression API returns null on all attempts.
  static Future<File> compress(File source) async {
    if (!source.existsSync()) {
      throw ImageCompressionException(
        'Source file not found: ${source.path}',
      );
    }

    int quality = _initialQuality;
    File? lastCompressed;

    while (quality >= _minQuality) {
      final outputPath = _tempOutputPath(source.path, quality);

      // FlutterImageCompress dispatches native work to a background thread
      // via its platform channel. Do NOT wrap in compute() — platform
      // channels are unavailable in Dart background isolates.
      final XFile? xfile = await FlutterImageCompress.compressAndGetFile(
        source.absolute.path,
        outputPath,
        quality: quality,
        format: CompressFormat.jpeg,
        keepExif: false,
      );

      if (xfile == null) break;

      final compressed = File(xfile.path);
      lastCompressed = compressed;

      final bytes = await compressed.length();
      if (bytes <= _maxFileSizeBytes) {
        return compressed; // ✅ within budget
      }

      // Still too large — reduce quality and retry.
      quality -= _qualityStep;
    }

    if (lastCompressed == null) {
      throw ImageCompressionException(
        'Platform compression API returned null for: ${source.path}',
      );
    }

    // Best-effort: return last compressed file even if still above limit.
    return lastCompressed;
  }

  /// Builds a unique temp path for each compression attempt.
  ///
  /// Microsecond timestamp + quality suffix prevents filename collisions
  /// when the same source is compressed multiple times.
  static String _tempOutputPath(String sourcePath, int quality) {
    final tempDir = Directory.systemTemp.path;
    final lastSep = sourcePath.lastIndexOf(RegExp(r'[/\\]'));
    final lastDot = sourcePath.lastIndexOf('.');
    final base = lastSep >= 0
        ? (lastDot > lastSep
            ? sourcePath.substring(lastSep + 1, lastDot)
            : sourcePath.substring(lastSep + 1))
        : sourcePath;
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final sep = Platform.pathSeparator;
    return '$tempDir$sep${base}_q${quality}_$timestamp.jpg';
  }
}

/// Thrown when [ImageCompressor.compress] cannot produce a valid output.
class ImageCompressionException implements Exception {
  final String message;
  const ImageCompressionException(this.message);

  @override
  String toString() => 'ImageCompressionException: $message';
}
