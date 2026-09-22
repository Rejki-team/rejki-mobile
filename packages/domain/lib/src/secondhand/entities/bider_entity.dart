import 'package:freezed_annotation/freezed_annotation.dart';

part 'bider_entity.freezed.dart';

/// BiderEntity (F-15, Kelompok 3 Phase 3/4, PRD §5.14.1-5.14.2 Gambar 5)
///
/// Satu baris "jadi bider" (peminat mengambil barang). Status literal lowercase
/// sesuai kontrak backend persis (`menunggu/disetujui/withdrawn`) — pola sama
/// dengan LamaranEntity, hindari enum English yang perlu translasi manual.
///
/// Field enrichment bersifat opsional tergantung endpoint pemanggil:
/// - `list_bider` (pemilik iklan, "Kelola Iklan Saya") mengisi `peminat*`/`jarakKm`.
/// - `list_bider_saya` (peminat, "Riwayat Aktifitas") mengisi `iklan*`.
@freezed
abstract class BiderEntity with _$BiderEntity {
  const BiderEntity._();

  const factory BiderEntity({
    required String id,
    required String iklanId,
    required String peminatId,
    required String status,
    @Default(false) bool sudahMenghubungi,
    required DateTime createdAt,

    // Enrichment sisi pemilik iklan (list_bider) — nama/lokasi/jarak peminat.
    String? peminatNama,
    String? kelurahan,
    String? kecamatan,
    double? jarakKm,

    // Enrichment sisi peminat (list_bider_saya) — konteks iklan.
    String? iklanJudul,
    String? iklanDeskripsi,
    String? iklanJenisBarang,
    int? iklanJumlah,
    String? iklanLokasiPengambilan,
    @Default([]) List<String> iklanFotoUrls,
    String? iklanAvailabilityStatus,
  }) = _BiderEntity;

  bool get isMenunggu => status == 'menunggu';
  bool get isDisetujui => status == 'disetujui';
  bool get isWithdrawn => status == 'withdrawn';
}
