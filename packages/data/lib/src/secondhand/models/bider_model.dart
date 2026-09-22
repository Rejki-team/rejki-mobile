import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'bider_model.freezed.dart';
part 'bider_model.g.dart';

/// BiderModel (Data Layer, F-15, Kelompok 3 Phase 3/4)
///
/// Deserializes `BiderResponse`/`BiderWithIklanResponse` dari backend nyata.
/// Kedua bentuk response digabung jadi satu model — field enrichment yang
/// tidak dikirim server otomatis `null` (nullable, pola sama `LamaranModel`).
@freezed
abstract class BiderModel with _$BiderModel {
  const BiderModel._();

  const factory BiderModel({
    required String id,
    @JsonKey(name: 'iklan_id') required String iklanId,
    @JsonKey(name: 'peminat_id') required String peminatId,
    required String status,
    @JsonKey(name: 'sudah_menghubungi') @Default(false) bool sudahMenghubungi,
    @JsonKey(name: 'created_at') required String createdAt,

    // Enrichment sisi pemilik (BiderResponse dari list_bider).
    @JsonKey(name: 'peminat_nama') String? peminatNama,
    String? kelurahan,
    String? kecamatan,
    @JsonKey(name: 'jarak_km') double? jarakKm,

    // Enrichment sisi peminat (BiderWithIklanResponse dari list_bider_saya).
    @JsonKey(name: 'iklan_judul') String? iklanJudul,
    @JsonKey(name: 'iklan_deskripsi') String? iklanDeskripsi,
    @JsonKey(name: 'iklan_jenis_barang') String? iklanJenisBarang,
    @JsonKey(name: 'iklan_jumlah') int? iklanJumlah,
    @JsonKey(name: 'iklan_lokasi_pengambilan') String? iklanLokasiPengambilan,
    @JsonKey(name: 'iklan_foto_urls') @Default([]) List<String> iklanFotoUrls,
    @JsonKey(name: 'iklan_availability_status') String? iklanAvailabilityStatus,
  }) = _BiderModel;

  factory BiderModel.fromJson(Map<String, dynamic> json) =>
      _$BiderModelFromJson(json);

  BiderEntity toEntity() {
    return BiderEntity(
      id: id,
      iklanId: iklanId,
      peminatId: peminatId,
      status: status,
      sudahMenghubungi: sudahMenghubungi,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      peminatNama: peminatNama,
      kelurahan: kelurahan,
      kecamatan: kecamatan,
      jarakKm: jarakKm,
      iklanJudul: iklanJudul,
      iklanDeskripsi: iklanDeskripsi,
      iklanJenisBarang: iklanJenisBarang,
      iklanJumlah: iklanJumlah,
      iklanLokasiPengambilan: iklanLokasiPengambilan,
      iklanFotoUrls: iklanFotoUrls,
      iklanAvailabilityStatus: iklanAvailabilityStatus,
    );
  }
}
