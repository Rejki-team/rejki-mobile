import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'onboarding_state.dart';

/// Cubit untuk mengelola state onboarding
class OnboardingCubit extends Cubit<OnboardingState> {
  final CarouselSliderController carouselController;

  OnboardingCubit({CarouselSliderController? controller})
    : carouselController = controller ?? CarouselSliderController(),
      super(const OnboardingState());

  /// Total halaman onboarding
  static const int totalPages = 4;

  /// Daftar title untuk setiap halaman
  static const List<String> pageTitles = [
    'Segala pekerjaan\nyang baik-baik.',
    'Pekerjaan terdekat\ndi lingkunganmu',
    'Pekerjaan terdekat dari\nkamu Harian ataupun\nborongan',
    'Gratis registrasi\nGratis cari pekerjaan\nGratis cari pekerja',
  ];

  /// Ubah halaman ke index tertentu
  void goToPage(int index) {
    if (index >= 0 && index < totalPages) {
      carouselController.animateToPage(index);
      emit(state.copyWith(currentPage: index));
    }
  }

  /// Ke halaman berikutnya
  void nextPage() {
    if (state.currentPage < totalPages - 1) {
      final nextIndex = state.currentPage + 1;
      carouselController.animateToPage(nextIndex);
      emit(state.copyWith(currentPage: nextIndex));
    }
  }

  /// Ke halaman sebelumnya
  void previousPage() {
    if (state.currentPage > 0) {
      final prevIndex = state.currentPage - 1;
      carouselController.animateToPage(prevIndex);
      emit(state.copyWith(currentPage: prevIndex));
    }
  }

  /// Update halaman saat carousel digeser manual
  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  /// Cek apakah di halaman pertama
  bool get isFirstPage => state.currentPage == 0;

  /// Cek apakah di halaman terakhir
  bool get isLastPage => state.currentPage == totalPages - 1;

  /// Mendapatkan title berdasarkan halaman saat ini
  String get currentTitle => pageTitles[state.currentPage];
}
