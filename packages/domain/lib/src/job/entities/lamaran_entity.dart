import 'package:freezed_annotation/freezed_annotation.dart';

part 'lamaran_entity.freezed.dart';

/// Status Lamaran — match PRD Bab 9 persis (F-3, backend Kelompok 3 Phase 1).
enum LamaranStatusValue { diajukan, diterima, ditolak, proses, selesai }

/// Lamaran pekerjaan (F-3/F-4, PRD §5.11.3-5.11.5) — pengganti `BidEntity` lama.
/// `jamMulai`/`jamAkhir` disimpan sebagai string "HH:mm:ss" (format wire backend),
/// bukan `DateTime`, agar tidak ada tanggal palsu yang perlu diabaikan.
///
/// Field `pelamar*` hanya terisi dari daftar "Kelola Pelamar" (dilihat pemilik
/// iklan); field `iklan*` hanya terisi dari "Riwayat Aktifitas Pelamar" (dilihat
/// pelamar) — keduanya enrichment batched di backend, tidak pernah terisi bersamaan.
@freezed
abstract class LamaranEntity with _$LamaranEntity {
  const LamaranEntity._();

  const factory LamaranEntity({
    required String id,
    required String iklanId,
    required String pelamarId,
    required String status,
    required DateTime tanggal,
    required String jamMulai,
    required String jamAkhir,
    @Default(1) int kuotaDiambil,
    String? alasanBatal,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Enrichment — Kelola Pelamar (list_lamaran_for_iklan) saja.
    String? pelamarNama,
    String? pelamarIklanPekerjaId,
    List<String>? pelamarKeahlian,
    String? pelamarFotoUrl,
    // Enrichment — Riwayat Aktifitas Pelamar (list_lamaran_for_pelamar) saja.
    String? iklanJudul,
    String? iklanPerusahaan,
    int? iklanGajiMin,
    int? iklanGajiMax,
    String? iklanTipe,
    String? iklanLokasi,

    /// Pemilik iklan — `dinilai_id` saat pelamar menilai pemberi kerja
    /// (F-17, PRD §5.15, Kelompok 3 Fase 6 P6.4).
    String? iklanPosterId,
  }) = _LamaranEntity;

  bool get isDiajukan => status == LamaranStatusValue.diajukan.name;
  bool get isDiterima => status == LamaranStatusValue.diterima.name;
  bool get isDitolak => status == LamaranStatusValue.ditolak.name;
  bool get isProses => status == LamaranStatusValue.proses.name;
  bool get isSelesai => status == LamaranStatusValue.selesai.name;
}
