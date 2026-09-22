import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';

/// Repository for Job MUTATIONS (create, update, delete)
///
/// This is feature-specific and handles only write operations.
/// Read operations use the shared JobRepository from packages/domain.
abstract class JobMutationRepository {
  /// Create a new job posting
  Future<Either<JobFailure, JobEntity>> createJob(CreateJobParams params);

  /// Terima/tolak lamaran (F-3, PRD §5.11.5) — dipanggil pemilik iklan.
  /// Pengganti `updateBidStatus`.
  Future<Either<JobFailure, LamaranEntity>> reviewLamaran({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  });

  /// Mulai bekerja (F-3, PRD §5.11.4) — dipanggil pelamar, backend memvalidasi
  /// geofence 50m dari lokasi iklan menggunakan koordinat GPS device.
  Future<Either<JobFailure, LamaranEntity>> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  });

  /// Tandai pekerjaan selesai (F-3, PRD §5.11.4) — dipanggil pelamar.
  Future<Either<JobFailure, LamaranEntity>> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  });

  /// Pembatalan lamaran yang sudah Diterima oleh pemilik iklan, maksimal H-24
  /// jam sebelum mulai (PRD §5.11.5). [alasan] wajib diisi, divalidasi backend.
  Future<Either<JobFailure, LamaranEntity>> batalkanLamaran({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  });

  /// Pelamar menilai pemberi kerja setelah Lamaran Selesai (F-17, PRD §5.15,
  /// arah `pelamar_ke_pemberi_kerja`). [posterId] = `LamaranEntity.iklanPosterId`
  /// (enrichment "Riwayat Aktifitas Pelamar", Kelompok 3 Fase 6 P6.4).
  Future<Either<JobFailure, Unit>> createJobReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  });
}
