import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:local/local.dart';
import 'create_worker_ad_state.dart';

/// Cubit untuk halaman Buat/Perbarui Profil Pekerja.
///
/// Mendukung dua mode operasi:
/// - **Create mode**: Pengguna belum punya profil → submit ke POST /workers
/// - **Update mode**: Pengguna sudah punya profil → submit ke PUT /workers/{id}
///
/// **Penggunaan:**
/// ```dart
/// // Inisialisasi biasa (create mode):
/// GetIt.I<CreateWorkerAdCubit>()
///
/// // Inisialisasi dengan pre-fill dari profil:
/// GetIt.I<CreateWorkerAdCubit>()..loadExistingProfile()
/// ```
@injectable
class CreateWorkerAdCubit extends Cubit<CreateWorkerAdState> {
  final CreateWorkerAdUseCase _createWorkerAdUseCase;
  final UpdateWorkerProfileUseCase _updateWorkerProfileUseCase;
  final GetMyWorkerProfileUseCase _getMyWorkerProfileUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final EnumStorage _enumStorage;

  CreateWorkerAdCubit(
    this._createWorkerAdUseCase,
    this._updateWorkerProfileUseCase,
    this._getMyWorkerProfileUseCase,
    this._getUserProfileUseCase,
    this._enumStorage,
  ) : super(const CreateWorkerAdState()) {
    _loadStoredEnums();
  }

  // Placeholder for storing loaded enum lists
  List<String> _educationTypes = [];
  List<String> _workingHours = [];

  void _loadStoredEnums() {
    _educationTypes = _enumStorage.getEnums('education_types');
    _workingHours = _enumStorage.getEnums('working_hours');
  }

  List<String> get educationOptions => _educationTypes.isEmpty
      ? ['SD', 'SMP', 'SMA', 'Diploma', 'Sarjana']
      : _educationTypes;

  List<String> get workingHourOptions =>
      _workingHours.isEmpty ? ['fleksibel', 'morning', 'night'] : _workingHours;

  // ---------------------------------------------------------------------------
  // Input Handlers
  // ---------------------------------------------------------------------------

  void fullNameChanged(String value) => emit(state.copyWith(fullName: value));
  void educationChanged(String value) => emit(state.copyWith(education: value));
  void workingHoursChanged(String value) =>
      emit(state.copyWith(workingHours: value));
  void minimumWageChanged(String value) =>
      emit(state.copyWith(minimumWage: value));
  void isNegotiableChanged(String value) =>
      emit(state.copyWith(isNegotiable: value));
  void phoneNumberChanged(String value) =>
      emit(state.copyWith(phoneNumber: value));
  void experienceChanged(String value) =>
      emit(state.copyWith(experience: value));
  void photosChanged(List<File> images) => emit(state.copyWith(photos: images));
  void domicileAddressChanged(String value) =>
      emit(state.copyWith(domicileAddress: value));

  void countryChanged(String value) => emit(state.copyWith(country: value));
  void provinceChanged(String value) => emit(state.copyWith(province: value));
  void cityChanged(String value) => emit(state.copyWith(city: value));
  void districtChanged(String value) => emit(state.copyWith(district: value));
  void subdistrictChanged(String value) =>
      emit(state.copyWith(subdistrict: value));
  void villageChanged(String value) => emit(state.copyWith(village: value));

  // ---------------------------------------------------------------------------
  // Load Existing Profile (untuk mode "Gunakan Profil Saya")
  // ---------------------------------------------------------------------------

  /// Memuat profil pekerja yang sudah ada dan profil user untuk pre-fill form.
  ///
  /// **Flow:**
  /// 1. GET /workers/me → jika ada profil → set [isUpdateMode]=true, [workerId]=ID
  /// 2. GET /users/profile → prefill field dari data profil user yang terverifikasi
  ///
  /// Jika salah satu gagal, error ditampilkan via [errorMessage].
  /// Caller harus listen ke [isLoadingProfile] untuk menampilkan indikator loading.
  Future<void> loadExistingProfile() async {
    if (isClosed) return;
    emit(state.copyWith(isLoadingProfile: true, errorMessage: null));

    // Step 1: Cek apakah sudah ada profil pekerja
    final workerResult = await _getMyWorkerProfileUseCase();
    if (isClosed) return;

    String resolvedWorkerId = '';
    bool resolvedIsUpdateMode = false;

    workerResult.fold(
      (failure) {
        // Gagal fetch worker — tetap lanjut ke step 2 untuk prefill dari user profile
        // tapi tidak set update mode
        debugLog(
          '[CreateWorkerAdCubit] Gagal fetch worker profile: ${failure.toString()}',
        );
      },
      (workerEntity) {
        if (workerEntity != null) {
          resolvedWorkerId = workerEntity.id;
          resolvedIsUpdateMode = true;
        }
      },
    );

    // Step 2: Fetch profil user untuk prefill data
    final profileResult = await _getUserProfileUseCase();
    if (isClosed) return;

    profileResult.fold(
      (failure) {
        final message = failure.map(
          serverError: (e) => e.message ?? 'Gagal memuat profil.',
          networkError: (_) => 'Gangguan koneksi internet.',
          validationError: (e) => e.message,
          unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
        );
        emit(
          state.copyWith(
            isLoadingProfile: false,
            workerId: resolvedWorkerId,
            isUpdateMode: resolvedIsUpdateMode,
            errorMessage: message,
          ),
        );
      },
      (userInfo) {
        // Prefill form dari data profil user
        emit(
          state.copyWith(
            isLoadingProfile: false,
            workerId: resolvedWorkerId,
            isUpdateMode: resolvedIsUpdateMode,
            // Prefill dari data profil
            fullName: userInfo.fullName.isNotEmpty
                ? userInfo.fullName
                : state.fullName,
            phoneNumber: userInfo.phoneNumber.isNotEmpty
                ? userInfo.phoneNumber
                : state.phoneNumber,
            education: userInfo.educationLevel.isNotEmpty
                ? userInfo.educationLevel
                : state.education,
            experience: userInfo.workExperience.isNotEmpty
                ? userInfo.workExperience
                : state.experience,
            domicileAddress: userInfo.addressKtp.isNotEmpty
                ? userInfo.addressKtp
                : state.domicileAddress,
            province: userInfo.province.isNotEmpty
                ? userInfo.province
                : state.province,
            city: userInfo.city.isNotEmpty ? userInfo.city : state.city,
            district: userInfo.districts.isNotEmpty
                ? userInfo.districts
                : state.district,
            village: userInfo.village.isNotEmpty
                ? userInfo.village
                : state.village,
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Submit
  // ---------------------------------------------------------------------------

  /// Submit form dalam mode create atau update tergantung [state.isUpdateMode].
  ///
  /// - Create mode: POST /workers
  /// - Update mode: PUT /workers/{workerId}
  Future<void> submit({double latitude = 0.0, double longitude = 0.0}) async {
    if (!state.isFormValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final params = CreateWorkerParams(
      fullName: state.fullName,
      education: state.education,
      available: state.workingHours,
      desiredSalary: int.tryParse(state.minimumWage.replaceAll('.', '')) ?? 0,
      isNegotiable: state.isNegotiable.toLowerCase() == 'ya',
      phoneNumber: state.phoneNumber,
      workExperience: state.experience,
      address: state.domicileAddress,
      province: state.province,
      city: state.city,
      subdistrict: state.district,
      ward: state.subdistrict,
      village: state
          .subdistrict, // Village value mapped identical to ward per API spec
      latitude: latitude,
      longitude: longitude,
      images: state.photos,
    );

    final result = state.isUpdateMode && state.workerId.isNotEmpty
        ? await _updateWorkerProfileUseCase(state.workerId, params)
        : await _createWorkerAdUseCase(params);

    if (isClosed) return; // Prevent memory leak / ANR

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.map(
              serverError: (s) => s.message ?? 'Server error',
              networkError: (_) => 'No Internet Connection',
              validationError: (v) => v.message,
              unknown: (_) => 'Unknown error',
            ),
          ),
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }
}

/// Internal debug logger — only prints in debug mode.
void debugLog(String message) {
  assert(() {
    // ignore: avoid_print
    print(message);
    return true;
  }());
}
