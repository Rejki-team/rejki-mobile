import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'secondhand_model.freezed.dart';
part 'secondhand_model.g.dart';

/// Secondhand Model (Data Layer, F-15, Kelompok 3 Phase 4)
///
/// Deserializes `IklanBarangBekasResponse` dari backend nyata — snake_case
/// `@JsonKey` match kontrak persis, bukan skema mock lama.
@freezed
abstract class SecondhandModel with _$SecondhandModel {
  const SecondhandModel._();

  const factory SecondhandModel({
    required String id,
    @JsonKey(name: 'seller_id') required String sellerId,
    required String judul,
    required String deskripsi,
    @JsonKey(name: 'jenis_barang') required String jenisBarang,
    required int jumlah,
    @JsonKey(name: 'lokasi_pengambilan') required String lokasiPengambilan,
    String? lokasi,
    @JsonKey(name: 'region_id') String? regionId,
    @JsonKey(name: 'foto_urls') @Default([]) List<String> fotoUrls,
    @JsonKey(name: 'availability_status') required String availabilityStatus,
    @JsonKey(name: 'moderation_status') required String moderationStatus,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _SecondhandModel;

  factory SecondhandModel.fromJson(Map<String, dynamic> json) =>
      _$SecondhandModelFromJson(json);

  /// Convert to domain entity.
  SecondhandEntity toEntity() {
    return SecondhandEntity(
      id: id,
      sellerId: sellerId,
      judul: judul,
      deskripsi: deskripsi,
      jenisBarang: jenisBarang,
      jumlah: jumlah,
      lokasiPengambilan: lokasiPengambilan,
      lokasi: lokasi,
      regionId: regionId,
      fotoUrls: fotoUrls,
      availabilityStatus: availabilityStatus,
      moderationStatus: moderationStatus,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
    );
  }
}
