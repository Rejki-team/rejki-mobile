import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondhand_query_params.freezed.dart';

/// Query parameters untuk GET /barang (F-15) — kontrak backend HANYA menerima
/// `limit`/`offset`/`latitude`/`longitude` (radius, PRD §5.14.1). Tidak ada
/// `search`/`province`/`city`/`subdistrict` di backend — field itu dihapus
/// dari kontrak; `page` dipertahankan untuk UI, dikonversi ke `offset` di
/// datasource (pola sama `JobQueryParams`).
@freezed
abstract class SecondhandQueryParams with _$SecondhandQueryParams {
  const factory SecondhandQueryParams({
    @Default(1) int page,
    @Default(10) int limit,

    /// Koordinat pusat filter radius (F-1) — `null` = tidak difilter.
    double? latitude,
    double? longitude,
  }) = _SecondhandQueryParams;
}
