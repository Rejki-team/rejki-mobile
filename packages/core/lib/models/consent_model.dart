import 'package:freezed_annotation/freezed_annotation.dart';

part 'consent_model.freezed.dart';
part 'consent_model.g.dart';

/// Model untuk menyimpan data consent/persetujuan pengguna
///
/// ```dart
/// final consent = ConsentModel(
///   hasAgreed: true,
///   agreedAt: DateTime.now(),
///   termsVersion: 'v1.0.0',
/// );
/// ```
@freezed
abstract class ConsentModel with _$ConsentModel {
  const factory ConsentModel({
    /// Apakah user sudah setuju
    required bool hasAgreed,

    /// Waktu persetujuan
    required DateTime agreedAt,

    /// Versi terms yang disetujui
    @Default('v1.0.0') String termsVersion,

    /// Source terms (asset atau url)
    String? termsSource,
  }) = _ConsentModel;

  factory ConsentModel.fromJson(Map<String, dynamic> json) =>
      _$ConsentModelFromJson(json);
}
