import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:local/local.dart';

/// Service AdMob (F-33, PRD §5.16).
///
/// - Iklan hanya tampil setelah pengguna login ([SessionStorage.isLoggedIn]).
/// - Maksimal [AdImpressionStorage.maxImpressionsPerDay] tayangan per hari
///   per pengguna, reset otomatis tiap hari kalender.
/// - Titik pemasangan: transisi antar tab utama (Home/News/Chat/
///   History/Profile) di `MainShell` — "peristiwa" paling sering dilalui di
///   aplikasi (PRD §5.16 "setiap peristiwa yang terjadi di dalam aplikasi"),
///   tanpa menambah 1 hook per tombol/aksi kecil (hindari over-engineering
///   dan UX buruk).
///
/// ID unit iklan default adalah **ID uji resmi Google** (aman dipakai tanpa
/// akun AdMob nyata, tidak pernah menghasilkan pendapatan nyata) — production
/// WAJIB mengganti via `--dart-define=ADMOB_INTERSTITIAL_AD_UNIT_ANDROID=...`
/// / `..._IOS=...` sebelum rilis.
class AdService {
  final SessionStorage _sessionStorage;
  final AdImpressionStorage _adImpressionStorage;

  AdService(this._sessionStorage, this._adImpressionStorage);

  static const String _testInterstitialAndroid =
      'ca-app-pub-3940256099942544/1033173712';
  static const String _testInterstitialIos =
      'ca-app-pub-3940256099942544/4411468910';

  static const String _interstitialAdUnitAndroid = String.fromEnvironment(
    'ADMOB_INTERSTITIAL_AD_UNIT_ANDROID',
    defaultValue: _testInterstitialAndroid,
  );
  static const String _interstitialAdUnitIos = String.fromEnvironment(
    'ADMOB_INTERSTITIAL_AD_UNIT_IOS',
    defaultValue: _testInterstitialIos,
  );

  String get _interstitialAdUnitId =>
      Platform.isAndroid ? _interstitialAdUnitAndroid : _interstitialAdUnitIos;

  /// Inisialisasi Mobile Ads SDK. Dipanggil sekali dari `main.dart` setelah
  /// DI selesai — aman dipanggil terlepas dari status login (hanya
  /// menyiapkan SDK, TIDAK menampilkan iklan apa pun).
  Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  /// Tampilkan interstitial bila memenuhi syarat (login + kuota harian).
  /// Gagal silently (log-only) — iklan tidak boleh pernah mengganggu alur
  /// navigasi utama aplikasi.
  Future<void> showInterstitialIfEligible() async {
    if (!_sessionStorage.isLoggedIn()) return;
    if (!_adImpressionStorage.canShowAd()) return;

    await InterstitialAd.load(
      adUnitId: _interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (_) {
              _adImpressionStorage.recordImpressionShown();
            },
            onAdDismissedFullScreenContent: (ad) => ad.dispose(),
            onAdFailedToShowFullScreenContent: (ad, _) => ad.dispose(),
          );
          ad.show();
        },
        onAdFailedToLoad: (_) {
          // Gagal load (mis. tidak ada koneksi/no fill) — abaikan, jangan
          // ganggu navigasi.
        },
      ),
    );
  }
}
