import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../failures/report_failure.dart';

/// F-20 (PRD §5.10) — 2 jalur pelaporan, sesuai kontrak backend Kelompok 4 Fase 1.
abstract class ReportRepository {
  /// Jalur "Laporkan Iklan" — dari halaman detail Iklan Pekerjaan/Pekerja/Barang
  /// Bekas. [targetType] `'iklan'` atau `'user'`; [targetAdType] opsional
  /// (`'pekerjaan'`/`'pekerja'`/`'barang_bekas'`, Kelompok 6 Q9) — menutup gap
  /// backend `Report.target_type=Iklan` tidak bisa bedakan jenis iklan.
  /// [keterangan] divalidasi backend 50-255 karakter (divalidasi juga di UI
  /// sebelum kirim, lihat cubit).
  Future<Either<ReportFailure, Unit>> laporkanIklan({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  });

  /// Jalur "Pelaporan Masalah" — dari proses yang gagal (atau halaman umum,
  /// bila [targetId] `null`). Melakukan 2 langkah di belakang layar: minta
  /// presigned URL + buat aduan (1 request backend), lalu unggah [buktiBytes]
  /// langsung ke storage (request terpisah, lihat `PresignedUploadClient`).
  Future<Either<ReportFailure, Unit>> pelaporanMasalah({
    String? targetId,
    required String keterangan,
    required Uint8List buktiBytes,
    required String buktiMime,
  });
}
