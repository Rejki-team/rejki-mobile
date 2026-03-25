import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_job_params.freezed.dart';

/// Create Job Parameters (Domain Layer)
@freezed
abstract class CreateJobParams with _$CreateJobParams {
  const CreateJobParams._();

  const factory CreateJobParams({
    /// Judul Pekerjaan
    required String title,

    /// Deskripsi Pekerjaan
    required String jobDesc,

    /// Syarat Pekerjaan
    required String requirements,

    /// Upah Pekerjaan (input currency amount)
    required int salary,

    /// Tipe Upah Pekerjaan (dropdown value: e.g., "hourly", "daily", "project")
    required String salaryOfWorker,

    /// Jumlah Pekerja yang di Butuhkan
    required int numberOfWorker,

    /// Waktu Pekerjaan (format: YYYY-MM-DD HH:mm:ss)
    required String dateOfJob,

    /// Alamat Lokasi Pekerjaan
    required String address,

    /// Lokasi Detail - Provinsi
    required String province,

    /// Lokasi Detail - Kota/Kabupaten
    required String city,

    /// Lokasi Detail - Kecamatan
    required String subdistrict,

    /// Lokasi Detail - Kelurahan
    required String ward,

    /// Alamat Lokasi Pekerjaan - Desa/Kampung
    required String village,

    /// Foto Pekerjaan
    required List<File> images,

    /// Latitude koordinat perangkat (opsional — bisa null jika GPS tidak tersedia)
    double? latitude,

    /// Longitude koordinat perangkat (opsional — bisa null jika GPS tidak tersedia)
    double? longitude,
  }) = _CreateJobParams;
}
