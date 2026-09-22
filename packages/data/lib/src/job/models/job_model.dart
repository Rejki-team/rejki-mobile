import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'job_image_model.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

/// Terjemahkan status backend (PRD Bab 9: tersedia/sedang_dikerjakan/selesai)
/// ke vocabulary lama yang sudah dipakai `JobEntity.isOpen`/UI existing
/// (open/in_progress/closed) — dibiarkan agar tidak perlu mengubah seluruh
/// consumer `JobEntity.status` sekaligus (Kelompok 3 Phase 2, scope terbatas
/// hanya perbaikan path+field mapping, bukan rename entity).
String _translateStatus(String? backendStatus) {
  switch (backendStatus) {
    case 'sedang_dikerjakan':
      return 'in_progress';
    case 'selesai':
      return 'closed';
    case 'tersedia':
    default:
      return 'open';
  }
}

/// Shared Job Model (Data Layer)
///
/// Field JSON di sini match `IklanPekerjaanResponse` backend `rejki-app`
/// (`/pekerjaan`) — BUKAN skema "jobs" lama. Beberapa field `JobEntity` lama
/// (adCode, workerCount, dateOfJob, province/city/subdistrict/ward/village,
/// requirements, employerPhone) TIDAK ADA di backend nyata — diberi default
/// aman (bukan crash saat parse), dicatat sebagai gap terpisah, bukan
/// diperbaiki di sini (butuh perubahan skema backend di luar scope Phase 2).
@freezed
abstract class JobModel with _$JobModel {
  const JobModel._();

  const factory JobModel({
    required String id,
    @JsonKey(name: 'poster_id') required String posterId,
    required String judul,
    required String perusahaan,
    required String deskripsi,
    String? lokasi,
    @JsonKey(name: 'gaji_min') int? gajiMin,
    @JsonKey(name: 'gaji_max') int? gajiMax,
    required String tipe,
    @JsonKey(name: 'foto_urls') @Default([]) List<String> fotoUrls,
    required String status,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  /// Convert to domain entity — mengisi field yang tidak ada di backend
  /// dengan default aman (lihat catatan gap di atas class).
  JobEntity toEntity() {
    return JobEntity(
      id: id,
      adCode: id.length >= 8 ? id.substring(0, 8) : id,
      userId: posterId,
      title: judul,
      description: deskripsi,
      requirements: null,
      salary: gajiMin ?? gajiMax ?? 0,
      salaryType: tipe,
      workerCount: 1,
      dateOfJob: null,
      address: lokasi ?? '-',
      province: '',
      city: '',
      subdistrict: '',
      ward: '',
      village: null,
      status: _translateStatus(status),
      images: fotoUrls
          .map(
            (url) => JobImageModel(id: '', jobId: id, uriPath: url).toEntity(),
          )
          .toList(),
      bidCount: null,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: null,
      employerName: perusahaan,
      employerPhone: '',
    );
  }
}
