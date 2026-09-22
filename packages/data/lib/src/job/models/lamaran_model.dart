import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'lamaran_model.freezed.dart';
part 'lamaran_model.g.dart';

/// DTO untuk `LamaranResponse`/`LamaranWithPelamarResponse`/`LamaranWithIklanResponse`
/// backend (F-3/F-4, Kelompok 3 Phase 1-2). Pengganti `BidModel`. Field `pelamar_*`
/// dan `iklan_*` bersifat enrichment opsional — hanya salah satu yang pernah terisi
/// tergantung endpoint (lihat `LamaranEntity`).
@freezed
abstract class LamaranModel with _$LamaranModel {
  const LamaranModel._();

  const factory LamaranModel({
    required String id,
    @JsonKey(name: 'iklan_id') required String iklanId,
    @JsonKey(name: 'pelamar_id') required String pelamarId,
    required String status,
    required String tanggal,
    @JsonKey(name: 'jam_mulai') required String jamMulai,
    @JsonKey(name: 'jam_akhir') required String jamAkhir,
    @JsonKey(name: 'kuota_diambil') @Default(1) int kuotaDiambil,
    @JsonKey(name: 'alasan_batal') String? alasanBatal,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'pelamar_nama') String? pelamarNama,
    @JsonKey(name: 'pelamar_iklan_pekerja_id') String? pelamarIklanPekerjaId,
    @JsonKey(name: 'pelamar_keahlian') List<String>? pelamarKeahlian,
    @JsonKey(name: 'pelamar_foto_url') String? pelamarFotoUrl,
    @JsonKey(name: 'iklan_judul') String? iklanJudul,
    @JsonKey(name: 'iklan_perusahaan') String? iklanPerusahaan,
    @JsonKey(name: 'iklan_gaji_min') int? iklanGajiMin,
    @JsonKey(name: 'iklan_gaji_max') int? iklanGajiMax,
    @JsonKey(name: 'iklan_tipe') String? iklanTipe,
    @JsonKey(name: 'iklan_lokasi') String? iklanLokasi,
    @JsonKey(name: 'iklan_poster_id') String? iklanPosterId,
  }) = _LamaranModel;

  factory LamaranModel.fromJson(Map<String, dynamic> json) =>
      _$LamaranModelFromJson(json);

  LamaranEntity toEntity() {
    return LamaranEntity(
      id: id,
      iklanId: iklanId,
      pelamarId: pelamarId,
      status: status,
      tanggal: DateTime.tryParse(tanggal) ?? DateTime.now(),
      jamMulai: jamMulai,
      jamAkhir: jamAkhir,
      kuotaDiambil: kuotaDiambil,
      alasanBatal: alasanBatal,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      pelamarNama: pelamarNama,
      pelamarIklanPekerjaId: pelamarIklanPekerjaId,
      pelamarKeahlian: pelamarKeahlian,
      pelamarFotoUrl: pelamarFotoUrl,
      iklanJudul: iklanJudul,
      iklanPerusahaan: iklanPerusahaan,
      iklanGajiMin: iklanGajiMin,
      iklanGajiMax: iklanGajiMax,
      iklanTipe: iklanTipe,
      iklanLokasi: iklanLokasi,
      iklanPosterId: iklanPosterId,
    );
  }
}
