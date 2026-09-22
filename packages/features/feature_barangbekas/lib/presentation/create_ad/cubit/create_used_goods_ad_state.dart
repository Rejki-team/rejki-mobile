import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_used_goods_ad_state.freezed.dart';

@freezed
abstract class CreateUsedGoodsAdState with _$CreateUsedGoodsAdState {
  const CreateUsedGoodsAdState._();

  const factory CreateUsedGoodsAdState({
    @Default('') String judul,
    @Default('') String deskripsi,

    /// "bekas" | "baru" — dinormalisasi (lowercase+trim) sebelum submit.
    @Default('') String jenisBarang,
    @Default('') String jumlah,
    @Default('') String lokasiPengambilan,

    /// Region id kelurahan (dari cascading location picker) — dipakai backend
    /// untuk geocoding server-side (opsional).
    String? regionId,
    @Default(false) bool isRequesting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateUsedGoodsAdState;

  bool get isFormValid =>
      judul.isNotEmpty &&
      deskripsi.isNotEmpty &&
      jenisBarang.isNotEmpty &&
      jumlah.isNotEmpty &&
      lokasiPengambilan.isNotEmpty;
}
