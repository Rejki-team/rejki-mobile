import 'package:freezed_annotation/freezed_annotation.dart';

part 'lamar_params.freezed.dart';

/// Parameter untuk melamar pekerjaan (F-3, PRD §5.11.3). Pengganti `BidJobParams`.
/// Tidak ada `workerId` — backend mengidentifikasi pelamar dari JWT, cukup
/// validasi eksistensi profil pekerja dilakukan server-side.
@freezed
abstract class LamarParams with _$LamarParams {
  const factory LamarParams({
    required String iklanId,
    required DateTime tanggal,

    /// Format "HH:mm:ss" — sama dengan wire format backend (`chrono::NaiveTime`).
    required String jamMulai,
    required String jamAkhir,
    @Default(1) int kuotaDiambil,
  }) = _LamarParams;
}
