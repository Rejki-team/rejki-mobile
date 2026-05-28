/// Navigation arguments for DaftarPelamarPage.
class DaftarPelamarArgs {
  final String jobId;
  final String jobTitle;
  final String adCode;
  final String jobStatus;
  /// Jadwal resmi iklan pekerjaan. Dipakai sebagai fallback referensi waktu
  /// saat menghitung 30 menit sebelum pemilik boleh tandai selesai.
  final DateTime? jobDateOfJob;

  const DaftarPelamarArgs({
    required this.jobId,
    required this.jobTitle,
    required this.adCode,
    required this.jobStatus,
    this.jobDateOfJob,
  });
}
