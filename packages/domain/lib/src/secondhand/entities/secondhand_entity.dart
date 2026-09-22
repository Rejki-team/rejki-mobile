import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondhand_entity.freezed.dart';

/// Secondhand Entity (Domain Layer, F-15, Kelompok 3 Phase 4)
///
/// Merepresentasikan satu Iklan Barang Bekas sesuai kontrak backend nyata
/// (`IklanBarangBekasResponse`) — bukan skema mock lama.
@freezed
abstract class SecondhandEntity with _$SecondhandEntity {
  const SecondhandEntity._();

  const factory SecondhandEntity({
    required String id,
    required String sellerId,
    required String judul,
    required String deskripsi,

    /// "bekas" | "baru"
    required String jenisBarang,
    required int jumlah,

    /// Alamat pengambilan barang (wajib diisi pemilik)
    required String lokasiPengambilan,

    /// Teks lokasi bebas dipakai untuk geocoding (opsional)
    String? lokasi,
    String? regionId,
    @Default([]) List<String> fotoUrls,

    /// "tersedia" | "sudah_diambil"
    required String availabilityStatus,
    required String moderationStatus,
    required DateTime createdAt,
  }) = _SecondhandEntity;

  String? get firstImageUrl => fotoUrls.isNotEmpty ? fotoUrls.first : null;
  bool get isTersedia => availabilityStatus == 'tersedia';
  bool get isSudahDiambil => availabilityStatus == 'sudah_diambil';
}
