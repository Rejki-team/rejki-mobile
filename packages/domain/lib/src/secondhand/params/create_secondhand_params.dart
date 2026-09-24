import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_secondhand_params.freezed.dart';

/// Parameters untuk membuat Iklan Barang Bekas baru (POST /barang, F-15).
///
/// Upload foto DIHAPUS dari alur ini — backend `foto_urls` butuh presigned-URL
/// flow terpisah yang belum di-wire (sama seperti keputusan `create_job`,
/// Kelompok 3 Phase 2). `images` yang dipilih user di UI TIDAK dikirim.
@freezed
abstract class CreateSecondhandParams with _$CreateSecondhandParams {
  const factory CreateSecondhandParams({
    required String judul,
    required String deskripsi,

    /// "bekas" | "baru"
    required String jenisBarang,
    required int jumlah,

    /// Alamat pengambilan barang (wajib)
    required String lokasiPengambilan,

    /// Teks lokasi bebas untuk geocoding server-side (opsional)
    String? lokasi,
    String? regionId,
  }) = _CreateSecondhandParams;
}
