import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_secondhand_params.freezed.dart';

/// Parameters for creating a new secondhand ad (POST /secondhands).
@freezed
abstract class CreateSecondhandParams with _$CreateSecondhandParams {
  const factory CreateSecondhandParams({
    /// Ad title
    required String title,

    /// Item description
    required String description,

    /// Item condition: "used" or "new"
    required String condition,

    /// Quantity available
    required int amount,

    /// Street address
    required String address,

    /// Province name
    required String province,

    /// City / kabupaten name
    required String city,

    /// Subdistrict / kecamatan name
    required String subdistrict,

    /// Village name
    required String village,

    /// Item photos (at least one required)
    required List<File> images,

    /// GPS latitude of the item location (optional — tidak block submit jika GPS gagal)
    double? latitude,

    /// GPS longitude of the item location (optional — tidak block submit jika GPS gagal)
    double? longitude,
  }) = _CreateSecondhandParams;
}
