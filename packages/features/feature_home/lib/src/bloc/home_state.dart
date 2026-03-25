part of 'home_bloc.dart';

/// HomeStatus - Status untuk HomeState
///
/// Enum untuk merepresentasikan berbagai status loading.
enum HomeStatus {
  /// Status awal sebelum ada aksi
  initial,

  /// Status saat sedang loading data
  loading,

  /// Status saat data berhasil dimuat
  success,

  /// Status saat terjadi error
  failure,
}

/// HomeState - Model dalam pattern MVI
///
/// Menggunakan Freezed untuk immutable state dengan copyWith auto-generated.
/// State ini merepresentasikan seluruh UI state dari halaman Home.
@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    /// Status loading saat ini
    @Default(HomeStatus.initial) HomeStatus status,

    /// Pesan error jika status failure
    String? errorMessage,

    /// Nama pengguna untuk header
    @Default('Pengguna') String userName,

    /// Jumlah notifikasi yang belum dibaca
    @Default(0) int notificationCount,

    /// List banner/carousel items
    @Default([]) List<dynamic> banners,

    /// List kategori layanan
    @Default([]) List<dynamic> categories,

    /// Latest jobs from API (max 2 for home page display)
    @Default([]) List<JobEntity> latestJobs,

    /// List featured items (job cards, etc.)
    @Default([]) List<dynamic> featuredItems,

    /// Flag untuk menandakan sedang refresh (pull-to-refresh)
    @Default(false) bool isRefreshing,

    /// Flag untuk infinite scroll - sudah mencapai akhir data
    @Default(false) bool hasReachedMax,
  }) = _HomeState;
}

