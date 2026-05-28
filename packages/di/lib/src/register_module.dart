import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_pekerjaan/feature_pekerjaan.dart';
import 'package:feature_pekerja/feature_pekerja.dart';
import 'package:feature_pelatihan/feature_pelatihan.dart' hide LocationBloc;
// ignore: implementation_imports
import 'package:feature_pelatihan/presentation/location/bloc/location_bloc.dart' as pelatihan_loc;
import 'package:feature_barangbekas/feature_barangbekas.dart' hide LocationBloc;
import 'package:feature_barangbekas/presentation/location/bloc/location_bloc.dart' as barangbekas_loc;
import 'package:feature_notification/feature_notification.dart';
import 'package:feature_register/feature_register.dart';
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_cubit.dart';
import 'package:feature_pekerja/presentation/location/bloc/location_bloc.dart' as worker_loc;
// ignore: implementation_imports
import 'package:feature_profile/src/location/bloc/location_bloc.dart' as profile_loc;
import 'package:feature_profile/feature_profile.dart' hide LocationBloc;
import 'package:feature_history/feature_history.dart';

/// Register module untuk third-party dependencies
///
/// Gunakan @module untuk mendaftarkan dependencies yang
/// tidak bisa di-annotate langsung (third-party packages)
@module
abstract class RegisterModule {
  /// SharedPreferences - untuk menyimpan data non-sensitif
  ///
  /// Gunakan @preResolve karena getInstance() adalah async
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  /// FlutterSecureStorage - untuk menyimpan data sensitif (token)
  ///
  /// Menggunakan konfigurasi yang aman untuk Android dan iOS
  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// SessionStorage - untuk mengelola session dan token
  ///
  /// Depends on: FlutterSecureStorage, SharedPreferences
  @lazySingleton
  SessionStorage sessionStorage(
    FlutterSecureStorage secureStorage,
    SharedPreferences prefs,
  ) => SessionStorage(secureStorage, prefs);

  /// DioClient - HTTP client dengan auth interceptor
  ///
  /// Depends on: SessionStorage
  @lazySingleton
  DioClient dioClient(SessionStorage sessionStorage) =>
      DioClient(sessionStorage);

  /// ConnectivityUtil - untuk memeriksa dan memantau koneksi internet
  @lazySingleton
  ConnectivityUtil get connectivityUtil => ConnectivityUtil();

  // ============================================
  // AUTH DATA LAYER
  // ============================================

  /// AuthRemoteDataSource - untuk auth API calls
  @lazySingleton
  AuthRemoteDataSource authRemoteDataSource(DioClient dioClient) =>
      AuthRemoteDataSource(dioClient);

  /// AuthRepository - implementation untuk auth repository
  @LazySingleton(as: AuthRepository)
  AuthRepositoryImpl authRepository(
    AuthRemoteDataSource remoteDataSource,
    SessionStorage sessionStorage,
  ) => AuthRepositoryImpl(remoteDataSource, sessionStorage);

  // ============================================
  // AUTH USE CASES
  // ============================================

  /// LoginUseCase - untuk login
  @lazySingleton
  LoginUseCase loginUseCase(AuthRepository repository) =>
      LoginUseCase(repository);

  /// RegisterUseCase - untuk registrasi user baru
  @lazySingleton
  RegisterUseCase registerUseCase(AuthRepository repository) =>
      RegisterUseCase(repository);

  // ============================================
  // JOB DATA LAYER
  // ============================================

  /// JobRemoteDataSource - untuk fetch job data dari API
  @lazySingleton
  JobRemoteDataSource jobRemoteDataSource(DioClient dioClient) =>
      JobRemoteDataSourceImpl(dioClient);

  /// BidJobDataSource - untuk bidding job
  @lazySingleton
  BidJobDataSource bidJobDataSource(DioClient dioClient) =>
      BidJobDataSourceImpl(dio: dioClient.dio);

  /// JobRepository - implementation untuk job repository
  @LazySingleton(as: JobRepository)
  JobRepositoryImpl jobRepository(
    JobRemoteDataSource remoteDataSource,
    BidJobDataSource bidJobDataSource,
  ) => JobRepositoryImpl(remoteDataSource, bidJobDataSource);

  // ============================================
  // JOB USE CASES
  // ============================================

  /// GetLatestJobsUseCase - untuk mendapatkan latest jobs
  @lazySingleton
  GetLatestJobsUseCase getLatestJobsUseCase(JobRepository repository) =>
      GetLatestJobsUseCase(repository);

  /// GetJobsUseCase - untuk mendapatkan jobs dengan query parameters
  @lazySingleton
  GetJobsUseCase getJobsUseCase(JobRepository repository) =>
      GetJobsUseCase(repository);

  /// GetJobByIdUseCase - untuk mendapatkan job by ID
  @lazySingleton
  GetJobByIdUseCase getJobByIdUseCase(JobRepository repository) =>
      GetJobByIdUseCase(repository);

  /// BidJobUseCase - untuk melamar pekerjaan
  @lazySingleton
  BidJobUseCase bidJobUseCase(JobRepository repository) =>
      BidJobUseCase(repository);

  /// GetMyBidsUseCase - untuk mengambil daftar pekerjaan (bids) user
  @lazySingleton
  GetMyBidsUseCase getMyBidsUseCase(JobRepository repository) =>
      GetMyBidsUseCase(repository);

  /// GetIncomingBidsUseCase - untuk mengambil daftar pelamar masuk ke job milik user
  @lazySingleton
  GetIncomingBidsUseCase getIncomingBidsUseCase(JobRepository repository) =>
      GetIncomingBidsUseCase(repository);

  /// GetMyJobsUseCase - untuk mengambil daftar job yang dipasang user
  @lazySingleton
  GetMyJobsUseCase getMyJobsUseCase(JobRepository repository) =>
      GetMyJobsUseCase(repository);

  // ============================================
  // JOB MUTATION (CREATE, UPDATE, DELETE)
  // ============================================

  /// JobMutationDataSource - for creating/updating jobs
  @lazySingleton
  JobMutationDataSource jobMutationDataSource(DioClient dioClient) =>
      JobMutationDataSourceImpl(dio: dioClient.dio);

  /// JobMutationRepository - implementation for job mutations
  @LazySingleton(as: JobMutationRepository)
  JobMutationRepositoryImpl jobMutationRepository(
    JobMutationDataSource remoteDataSource,
  ) => JobMutationRepositoryImpl(remoteDataSource: remoteDataSource);

  /// CreateJobUseCase - for creating new jobs
  @lazySingleton
  CreateJobUseCase createJobUseCase(JobMutationRepository repository) =>
      CreateJobUseCase(repository);

  /// UpdateBidStatusUseCase - untuk mengubah status pekerjaan (mis. selesai)
  @lazySingleton
  UpdateBidStatusUseCase updateBidStatusUseCase(JobMutationRepository repository) =>
      UpdateBidStatusUseCase(repository);

  /// OwnerCompleteJobUseCase - untuk pemilik menandai semua pekerjaan selesai
  @lazySingleton
  OwnerCompleteJobUseCase ownerCompleteJobUseCase(JobMutationRepository repository) =>
      OwnerCompleteJobUseCase(repository);

  /// OwnerConfirmBidUseCase - untuk pemilik konfirmasi klaim selesai per-bid
  @lazySingleton
  OwnerConfirmBidUseCase ownerConfirmBidUseCase(JobMutationRepository repository) =>
      OwnerConfirmBidUseCase(repository);

  /// CreateJobReviewUseCase - untuk memberikan rating dan review pada pekerjaan
  @lazySingleton
  CreateJobReviewUseCase createJobReviewUseCase(JobMutationRepository repository) =>
      CreateJobReviewUseCase(repository);

  // ============================================
  // LOCATION DATA LAYER
  // ============================================

  /// LocationRemoteDataSource - untuk fetch location data dari API
  @lazySingleton
  LocationRemoteDataSource locationRemoteDataSource(DioClient dioClient) =>
      LocationRemoteDataSourceImpl(dioClient);

  /// LocationRepository - implementation untuk location repository
  @LazySingleton(as: LocationRepository)
  LocationRepositoryImpl locationRepository(
    LocationRemoteDataSource remoteDataSource,
  ) => LocationRepositoryImpl(remoteDataSource);

  // ============================================
  // LOCATION USE CASES
  // ============================================

  /// GetProvincesUseCase - untuk mendapatkan daftar provinsi
  @lazySingleton
  GetProvincesUseCase getProvincesUseCase(LocationRepository repository) =>
      GetProvincesUseCase(repository);

  /// GetRegenciesUseCase - untuk mendapatkan daftar kabupaten/kota
  @lazySingleton
  GetRegenciesUseCase getRegenciesUseCase(LocationRepository repository) =>
      GetRegenciesUseCase(repository);

  /// GetDistrictsUseCase - untuk mendapatkan daftar kecamatan
  @lazySingleton
  GetDistrictsUseCase getDistrictsUseCase(LocationRepository repository) =>
      GetDistrictsUseCase(repository);

  /// GetVillagesUseCase - untuk mendapatkan daftar kelurahan/desa
  @lazySingleton
  GetVillagesUseCase getVillagesUseCase(LocationRepository repository) =>
      GetVillagesUseCase(repository);

  // ============================================
  // HELPER LAYER
  // ============================================

  /// EnumStorage - lokal storage
  @lazySingleton
  EnumStorage enumStorage(SharedPreferences prefs) => EnumStorage(prefs);

  /// HelperRemoteDataSource - remote
  @lazySingleton
  HelperRemoteDataSource helperRemoteDataSource(DioClient dioClient) =>
      HelperRemoteDataSourceImpl(dioClient);

  /// HelperRepository - repo
  @LazySingleton(as: HelperRepository)
  HelperRepositoryImpl helperRepository(
    HelperRemoteDataSource remoteDataSource,
    EnumStorage enumStorage,
  ) => HelperRepositoryImpl(remoteDataSource, enumStorage);

  /// SyncEnumsUseCase
  @lazySingleton
  SyncEnumsUseCase syncEnumsUseCase(HelperRepository repository) =>
      SyncEnumsUseCase(repository);

  // ============================================
  // FEATURE BLOCS/CUBITS
  // ============================================

  /// HomeBloc - for home page
  ///
  /// Membutuhkan dua use case yang dijalankan secara paralel:
  /// - [GetLatestJobsUseCase] untuk load 2 lowongan terbaru
  /// - [GetUserFullProfileUseCase] untuk load nama, status verifikasi, dan foto profil
  @factoryMethod
  HomeBloc homeBloc(
    GetLatestJobsUseCase getLatestJobsUseCase,
    GetUserFullProfileUseCase getUserFullProfileUseCase,
  ) =>
      HomeBloc(getLatestJobsUseCase, getUserFullProfileUseCase);

  /// CreateJobBloc - for creating job postings
  @factoryMethod
  CreateJobBloc createJobBloc(CreateJobUseCase createJobUseCase) =>
      CreateJobBloc(createJobUseCase: createJobUseCase);

  /// LocationBloc - for cascading location selection (Pekerjaan)
  @factoryMethod
  LocationBloc locationBloc(
    GetProvincesUseCase getProvincesUseCase,
    GetRegenciesUseCase getRegenciesUseCase,
    GetDistrictsUseCase getDistrictsUseCase,
    GetVillagesUseCase getVillagesUseCase,
  ) => LocationBloc(
    getProvincesUseCase: getProvincesUseCase,
    getRegenciesUseCase: getRegenciesUseCase,
    getDistrictsUseCase: getDistrictsUseCase,
    getVillagesUseCase: getVillagesUseCase,
  );

  /// LocationBloc - for cascading location selection (Pekerja)
  @factoryMethod
  worker_loc.LocationBloc locationBlocPekerja(
    GetProvincesUseCase getProvincesUseCase,
    GetRegenciesUseCase getRegenciesUseCase,
    GetDistrictsUseCase getDistrictsUseCase,
    GetVillagesUseCase getVillagesUseCase,
  ) => worker_loc.LocationBloc(
    getProvincesUseCase: getProvincesUseCase,
    getRegenciesUseCase: getRegenciesUseCase,
    getDistrictsUseCase: getDistrictsUseCase,
    getVillagesUseCase: getVillagesUseCase,
  );

  /// LocationBloc - for cascading location selection (Profile)
  @factoryMethod
  profile_loc.LocationBloc locationBlocProfile(
    GetProvincesUseCase getProvincesUseCase,
    GetRegenciesUseCase getRegenciesUseCase,
    GetDistrictsUseCase getDistrictsUseCase,
    GetVillagesUseCase getVillagesUseCase,
  ) => profile_loc.LocationBloc(
    getProvincesUseCase: getProvincesUseCase,
    getRegenciesUseCase: getRegenciesUseCase,
    getDistrictsUseCase: getDistrictsUseCase,
    getVillagesUseCase: getVillagesUseCase,
  );

  /// ProfileRemoteDataSourceImpl
  @lazySingleton
  ProfileRemoteDataSource profileRemoteDataSource(DioClient client) =>
      ProfileRemoteDataSourceImpl(client);

  /// ProfileRepositoryImpl
  @lazySingleton
  ProfileRepository profileRepository(
      ProfileRemoteDataSource remoteDataSource,
      SessionStorage sessionStorage) =>
      ProfileRepositoryImpl(remoteDataSource, sessionStorage);

  /// UpdateProfileUseCase
  @lazySingleton
  UpdateProfileUseCase updateProfileUseCase(ProfileRepository repository) =>
      UpdateProfileUseCase(repository);

  /// EditProfileCubit
  @factoryMethod
  EditProfileCubit editProfileCubit(UpdateProfileUseCase updateProfileUseCase) =>
      EditProfileCubit(updateProfileUseCase);

  /// ProfileCubit - untuk halaman Profile (READ data profil + statistik iklan + upload foto)
  ///
  /// Berbeda dari [EditProfileCubit] yang mengelola form edit data pribadi.
  @factoryMethod
  ProfileCubit profileCubit(
    GetUserSummaryUseCase getUserSummaryUseCase,
    UploadProfilePhotoUseCase uploadProfilePhotoUseCase,
    SessionStorage sessionStorage,
  ) =>
      ProfileCubit(getUserSummaryUseCase, uploadProfilePhotoUseCase, sessionStorage);

  /// JobListingCubit - for job listing page
  @factoryMethod
  JobListingCubit jobListingCubit(GetJobsUseCase getJobsUseCase, SyncEnumsUseCase syncEnumsUseCase) =>
      JobListingCubit(getJobsUseCase: getJobsUseCase, syncEnumsUseCase: syncEnumsUseCase);

  /// JobDetailCubit - for job detail page
  @factoryMethod
  JobDetailCubit jobDetailCubit(GetJobByIdUseCase getJobByIdUseCase) =>
      JobDetailCubit(getJobByIdUseCase: getJobByIdUseCase);

  /// TakeJobCubit - for take job dialog
  /// Menggunakan GetMyWorkerProfileUseCase (bukan SessionStorage) untuk mendapatkan
  /// workerId yang benar dari profil pekerja.
  @factoryMethod
  TakeJobCubit takeJobCubit(
    BidJobUseCase bidJobUseCase,
    GetMyWorkerProfileUseCase getMyWorkerProfileUseCase,
  ) =>
      TakeJobCubit(bidJobUseCase, getMyWorkerProfileUseCase);

  /// RegisterCubit - for registration page
  @factoryMethod
  RegisterCubit registerCubit(RegisterUseCase registerUseCase) =>
      RegisterCubit(registerUseCase: registerUseCase);

  // ============================================
  // WORKER DATA LAYER & USE CASES
  // ============================================

  @lazySingleton
  WorkerRemoteDataSource workerRemoteDataSource(DioClient dioClient) =>
      WorkerRemoteDataSourceImpl(dioClient);

  @LazySingleton(as: WorkerRepository)
  WorkerRepositoryImpl workerRepository(
    WorkerRemoteDataSource remoteDataSource,
  ) => WorkerRepositoryImpl(remoteDataSource);

  @lazySingleton
  GetWorkersUseCase getWorkersUseCase(WorkerRepository repository) =>
      GetWorkersUseCase(repository);

  @lazySingleton
  GetWorkerByIdUseCase getWorkerByIdUseCaseWorker(WorkerRepository repository) =>
      GetWorkerByIdUseCase(repository);

  @lazySingleton
  CreateWorkerAdUseCase createWorkerAdUseCase(WorkerRepository repository) =>
      CreateWorkerAdUseCase(repository);

  /// GetMyWorkerProfileUseCase - untuk cek apakah user sudah punya profil pekerja
  /// Digunakan sebelum bid pekerjaan (GET /workers/me)
  @lazySingleton
  GetMyWorkerProfileUseCase getMyWorkerProfileUseCase(
    WorkerRepository repository,
  ) =>
      GetMyWorkerProfileUseCase(repository);

  /// UpdateWorkerProfileUseCase - untuk memperbarui profil pekerja (PUT /workers/{id})
  @lazySingleton
  UpdateWorkerProfileUseCase updateWorkerProfileUseCase(
    WorkerRepository repository,
  ) =>
      UpdateWorkerProfileUseCase(repository);

  /// GetWorkerContactsUseCase - untuk mendapatkan daftar pekerja yang dihubungi
  @lazySingleton
  GetWorkerContactsUseCase getWorkerContactsUseCase(
    WorkerRepository repository,
  ) =>
      GetWorkerContactsUseCase(repository);

  /// GetIncomingContactsUseCase - untuk mendapatkan permintaan kontak masuk ke profil pekerja
  @lazySingleton
  GetIncomingContactsUseCase getIncomingContactsUseCase(
    WorkerRepository repository,
  ) =>
      GetIncomingContactsUseCase(repository);

  /// UpdateWorkerContactStatusUseCase - untuk terima/tolak permintaan kontak pekerja
  @lazySingleton
  UpdateWorkerContactStatusUseCase updateWorkerContactStatusUseCase(
    WorkerRepository repository,
  ) =>
      UpdateWorkerContactStatusUseCase(repository);

  /// SubmitWorkerReviewUseCase - untuk memberikan rating kepada pekerja
  @lazySingleton
  SubmitWorkerReviewUseCase submitWorkerReviewUseCase(
    WorkerRepository repository,
  ) =>
      SubmitWorkerReviewUseCase(repository);

  // ============================================
  // FEATURE PEKERJA CUBITS
  // ============================================

  /// WorkerListingCubit - untuk halaman daftar pekerja
  @factoryMethod
  WorkerListingCubit workerListingCubit(GetWorkersUseCase getWorkersUseCase) => 
      WorkerListingCubit(getWorkersUseCase);

  /// WorkerDetailCubit - untuk halaman detail pekerja
  @factoryMethod
  WorkerDetailCubit workerDetailCubit(GetWorkerByIdUseCase getWorkerByIdUseCaseWorker) => 
      WorkerDetailCubit(getWorkerByIdUseCaseWorker);

  /// CreateWorkerAdCubit - untuk membuat/memperbarui profil pekerja
  ///
  /// Mendukung dua mode:
  /// - Create mode: submit ke POST /workers (CreateWorkerAdUseCase)
  /// - Update mode: submit ke PUT /workers/{id} (UpdateWorkerProfileUseCase)
  @factoryMethod
  CreateWorkerAdCubit createWorkerAdCubit(
    CreateWorkerAdUseCase createWorkerUseCase,
    UpdateWorkerProfileUseCase updateWorkerProfileUseCase,
    GetMyWorkerProfileUseCase getMyWorkerProfileUseCase,
    GetUserProfileUseCase getUserProfileUseCase,
    EnumStorage enumStorage,
  ) => CreateWorkerAdCubit(
    createWorkerUseCase,
    updateWorkerProfileUseCase,
    getMyWorkerProfileUseCase,
    getUserProfileUseCase,
    enumStorage,
  );

  // ============================================
  // FEATURE PELATIHAN CUBITS & DOMAIN/DATA
  // ============================================

  /// TrainingRemoteDataSource
  @lazySingleton
  TrainingRemoteDataSource trainingRemoteDataSource(DioClient dioClient) =>
      TrainingRemoteDataSourceImpl(dioClient);

  /// TrainingRepository
  @LazySingleton(as: TrainingRepository)
  TrainingRepositoryImpl trainingRepository(
    TrainingRemoteDataSource remoteDataSource,
  ) => TrainingRepositoryImpl(remoteDataSource);

  /// GetMyTrainingEnrollmentsUseCase
  @lazySingleton
  GetMyTrainingEnrollmentsUseCase getMyTrainingEnrollmentsUseCase(TrainingRepository repository) =>
      GetMyTrainingEnrollmentsUseCase(repository);

  /// GetTrainingDetailUseCase
  @lazySingleton
  GetTrainingDetailUseCase getTrainingDetailUseCase(TrainingRepository repository) =>
      GetTrainingDetailUseCase(repository);

  /// GetTrainingsUseCase - untuk daftar pelatihan publik
  @lazySingleton
  GetTrainingsUseCase getTrainingsUseCase(TrainingRepository repository) =>
      GetTrainingsUseCase(repository);

  /// GetMyTrainingsUseCase - untuk daftar pelatihan milik user
  @lazySingleton
  GetMyTrainingsUseCase getMyTrainingsUseCase(TrainingRepository repository) =>
      GetMyTrainingsUseCase(repository);

  /// CreateTrainingUseCase - untuk membuat iklan pelatihan
  @lazySingleton
  CreateTrainingUseCase createTrainingUseCase(TrainingRepository repository) =>
      CreateTrainingUseCase(repository);

  /// EnrollTrainingUseCase - untuk mendaftar pelatihan
  @lazySingleton
  EnrollTrainingUseCase enrollTrainingUseCase(TrainingRepository repository) =>
      EnrollTrainingUseCase(repository);

  /// UploadPaymentProofUseCase - untuk upload bukti pembayaran
  @lazySingleton
  UploadPaymentProofUseCase uploadPaymentProofUseCase(TrainingRepository repository) =>
      UploadPaymentProofUseCase(repository);

  /// GetEnrollmentsByTrainingUseCase - untuk daftar pendaftar pelatihan milik user
  @lazySingleton
  GetEnrollmentsByTrainingUseCase getEnrollmentsByTrainingUseCase(TrainingRepository repository) =>
      GetEnrollmentsByTrainingUseCase(repository);

  /// SubmitTrainingBadgeUseCase - untuk upload badge pelatihan
  @lazySingleton
  SubmitTrainingBadgeUseCase submitTrainingBadgeUseCase(TrainingRepository repository) =>
      SubmitTrainingBadgeUseCase(repository);

  /// HistoryPelatihanCubit
  @factoryMethod
  HistoryPelatihanCubit historyPelatihanCubit(GetMyTrainingEnrollmentsUseCase useCase) =>
      HistoryPelatihanCubit(useCase);

  /// TrainingListingCubit - untuk halaman daftar pelatihan
  @factoryMethod
  TrainingListingCubit trainingListingCubit(GetTrainingsUseCase getTrainingsUseCase) =>
      TrainingListingCubit(getTrainingsUseCase);

  /// CreateTrainingAdCubit - untuk membuat iklan pelatihan (form only, navigates to preview)
  @factoryMethod
  CreateTrainingAdCubit createTrainingAdCubit() => CreateTrainingAdCubit();

  /// SubmitTrainingAdCubit - untuk preview dan submit iklan pelatihan ke API
  @factoryMethod
  SubmitTrainingAdCubit submitTrainingAdCubit(
    CreateTrainingUseCase createTrainingUseCase,
  ) => SubmitTrainingAdCubit(createTrainingUseCase);

  /// TrainingDetailCubit - untuk halaman detail pelatihan
  @factoryMethod
  TrainingDetailCubit trainingDetailCubit(
    GetTrainingDetailUseCase getTrainingDetailUseCase,
    EnrollTrainingUseCase enrollTrainingUseCase,
    SessionStorage sessionStorage,
  ) => TrainingDetailCubit(getTrainingDetailUseCase, enrollTrainingUseCase, sessionStorage);

  /// PaymentCubit - untuk halaman pembayaran pelatihan
  @factoryMethod
  PaymentCubit paymentCubit(UploadPaymentProofUseCase uploadPaymentProofUseCase) =>
      PaymentCubit(uploadPaymentProofUseCase);

  /// DaftarPendaftarCubit - untuk halaman daftar pendaftar pelatihan
  @factoryMethod
  DaftarPendaftarCubit daftarPendaftarCubit(
    GetEnrollmentsByTrainingUseCase getEnrollmentsByTrainingUseCase,
  ) => DaftarPendaftarCubit(getEnrollmentsByTrainingUseCase);

  /// BadgeUploadCubit - untuk halaman upload badge pelatihan
  @factoryMethod
  BadgeUploadCubit badgeUploadCubit(SubmitTrainingBadgeUseCase submitTrainingBadgeUseCase) =>
      BadgeUploadCubit(submitTrainingBadgeUseCase);

  // ============================================
  // SECONDHAND DATA LAYER
  // ============================================

  /// SecondhandRemoteDataSource - untuk fetch secondhand data dari API
  @lazySingleton
  SecondhandRemoteDataSource secondhandRemoteDataSource(DioClient dioClient) =>
      SecondhandRemoteDataSourceImpl(dioClient);

  /// SecondhandMutationDataSource - untuk POST secondhand
  @lazySingleton
  SecondhandMutationDataSource secondhandMutationDataSource(
    DioClient dioClient,
  ) => SecondhandMutationDataSourceImpl(dio: dioClient.dio);

  /// SecondhandRepository - implementation untuk secondhand repository
  @LazySingleton(as: SecondhandRepository)
  SecondhandRepositoryImpl secondhandRepository(
    SecondhandRemoteDataSource remoteDataSource,
  ) => SecondhandRepositoryImpl(remoteDataSource);

  /// SecondhandMutationRepository - implementation untuk secondhand mutations
  @LazySingleton(as: SecondhandMutationRepository)
  SecondhandMutationRepositoryImpl secondhandMutationRepository(
    SecondhandMutationDataSource dataSource,
  ) => SecondhandMutationRepositoryImpl(dataSource);

  // ============================================
  // SECONDHAND USE CASES
  // ============================================

  /// GetSecondhandsUseCase - untuk mendapatkan daftar secondhand
  @lazySingleton
  GetSecondhandsUseCase getSecondhandsUseCase(
    SecondhandRepository repository,
  ) => GetSecondhandsUseCase(repository);

  /// CreateSecondhandUseCase - untuk membuat iklan secondhand
  @lazySingleton
  CreateSecondhandUseCase createSecondhandUseCase(
    SecondhandMutationRepository repository,
  ) => CreateSecondhandUseCase(repository);

  /// GetSecondhandByIdUseCase - untuk mendapatkan detail secondhand by ID
  @lazySingleton
  GetSecondhandByIdUseCase getSecondhandByIdUseCase(
    SecondhandRepository repository,
  ) => GetSecondhandByIdUseCase(repository);

  /// ClaimSecondhandUseCase - untuk mengambil barang bekas
  @lazySingleton
  ClaimSecondhandUseCase claimSecondhandUseCase(
    SecondhandMutationRepository repository,
  ) =>
      ClaimSecondhandUseCase(repository);

  /// GetMyClaimedSecondhandsUseCase - untuk mendapatkan daftar barang bekas yang di-claim user
  @lazySingleton
  GetMyClaimedSecondhandsUseCase getMyClaimedSecondhandsUseCase(
    SecondhandRepository repository,
  ) =>
      GetMyClaimedSecondhandsUseCase(repository);

  /// GetUserProfileUseCase - untuk mendapatkan profil user (radius filter)
  @lazySingleton
  GetUserProfileUseCase getUserProfileUseCase(ProfileRepository repository) =>
      GetUserProfileUseCase(repository);

  /// GetUserSummaryUseCase - untuk mendapatkan ringkasan profil + statistik iklan
  /// Digunakan oleh [ProfileCubit] pada halaman Profile.
  @lazySingleton
  GetUserSummaryUseCase getUserSummaryUseCase(ProfileRepository repository) =>
      GetUserSummaryUseCase(repository);

  /// UploadProfilePhotoUseCase - untuk upload/update foto profil
  /// Digunakan oleh [ProfileCubit] pada halaman Profile.
  @lazySingleton
  UploadProfilePhotoUseCase uploadProfilePhotoUseCase(
    ProfileRepository repository,
  ) =>
      UploadProfilePhotoUseCase(repository);

  /// GetUserFullProfileUseCase - untuk mengambil profil lengkap dari GET /users/profile
  /// Digunakan oleh [PersonalInfoCubit] pada halaman Informasi Pribadi.
  @lazySingleton
  GetUserFullProfileUseCase getUserFullProfileUseCase(
    ProfileRepository repository,
  ) =>
      GetUserFullProfileUseCase(repository);

  /// UpdateWorkingHoursUseCase - untuk update jam kerja via PUT /users/working-hours
  /// Digunakan oleh [PersonalInfoCubit].
  @lazySingleton
  UpdateWorkingHoursUseCase updateWorkingHoursUseCase(
    ProfileRepository repository,
  ) =>
      UpdateWorkingHoursUseCase(repository);

  /// UpdatePhoneVisibilityUseCase - untuk toggle visibilitas telepon
  /// via PUT /users/phone-visibility. Digunakan oleh [PersonalInfoCubit].
  @lazySingleton
  UpdatePhoneVisibilityUseCase updatePhoneVisibilityUseCase(
    ProfileRepository repository,
  ) =>
      UpdatePhoneVisibilityUseCase(repository);

  /// PersonalInfoCubit - untuk halaman Informasi Pribadi
  ///
  /// Mengelola load profil lengkap, update jam kerja, dan toggle visibilitas
  /// nomor telepon dengan pola auto-refresh setelah setiap PUT sukses.
  @factoryMethod
  PersonalInfoCubit personalInfoCubit(
    GetUserFullProfileUseCase getFullProfile,
    UpdateWorkingHoursUseCase updateWorkingHours,
    UpdatePhoneVisibilityUseCase updatePhoneVisibility,
  ) =>
      PersonalInfoCubit(getFullProfile, updateWorkingHours, updatePhoneVisibility);

  // ============================================
  // FEATURE BARANG BEKAS CUBITS
  // ============================================

  /// SearchUsedGoodsAdCubit - untuk halaman cari barang bekas
  @factoryMethod
  SearchUsedGoodsAdCubit searchUsedGoodsAdCubit(
    GetSecondhandsUseCase getSecondhandsUseCase,
    GetUserProfileUseCase getUserProfileUseCase,
  ) => SearchUsedGoodsAdCubit(getSecondhandsUseCase, getUserProfileUseCase);

  /// CreateUsedGoodsAdCubit - untuk membuat iklan barang bekas
  @factoryMethod
  CreateUsedGoodsAdCubit createUsedGoodsAdCubit(
    CreateSecondhandUseCase createSecondhandUseCase,
  ) => CreateUsedGoodsAdCubit(createSecondhandUseCase);

  /// DetailUsedGoodsAdCubit - untuk halaman detail barang bekas
  @factoryMethod
  DetailUsedGoodsAdCubit detailUsedGoodsAdCubit(
    GetSecondhandByIdUseCase getSecondhandByIdUseCase,
  ) => DetailUsedGoodsAdCubit(getSecondhandByIdUseCase);

  /// ClaimSecondhandCubit - untuk mengambil barang bekas
  @factoryMethod
  ClaimSecondhandCubit claimSecondhandCubit(
    ClaimSecondhandUseCase claimSecondhandUseCase,
  ) => ClaimSecondhandCubit(claimSecondhandUseCase);

  /// LocationBloc - for cascading location selection (Pelatihan)
  @factoryMethod
  pelatihan_loc.LocationBloc locationBlocPelatihan(
    GetProvincesUseCase getProvincesUseCase,
    GetRegenciesUseCase getRegenciesUseCase,
    GetDistrictsUseCase getDistrictsUseCase,
    GetVillagesUseCase getVillagesUseCase,
  ) => pelatihan_loc.LocationBloc(
    getProvincesUseCase: getProvincesUseCase,
    getRegenciesUseCase: getRegenciesUseCase,
    getDistrictsUseCase: getDistrictsUseCase,
    getVillagesUseCase: getVillagesUseCase,
  );

  /// LocationBloc - for cascading location selection (BarangBekas)
  @factoryMethod
  barangbekas_loc.LocationBloc locationBlocBarangBekas(
    GetProvincesUseCase getProvincesUseCase,
    GetRegenciesUseCase getRegenciesUseCase,
    GetDistrictsUseCase getDistrictsUseCase,
    GetVillagesUseCase getVillagesUseCase,
  ) => barangbekas_loc.LocationBloc(
    getProvincesUseCase: getProvincesUseCase,
    getRegenciesUseCase: getRegenciesUseCase,
    getDistrictsUseCase: getDistrictsUseCase,
    getVillagesUseCase: getVillagesUseCase,
  );

  // ============================================
  // FEATURE NOTIFICATION DATA/DOMAIN/CUBIT
  // ============================================

  @lazySingleton
  NotificationRemoteDataSource notificationRemoteDataSource(DioClient dioClient) =>
      NotificationRemoteDataSourceImpl(dioClient);

  @LazySingleton(as: NotificationRepository)
  NotificationRepositoryImpl notificationRepository(
    NotificationRemoteDataSource remoteDataSource,
  ) => NotificationRepositoryImpl(remoteDataSource);

  @lazySingleton
  GetNotificationsUseCase getNotificationsUseCase(NotificationRepository repository) =>
      GetNotificationsUseCase(repository);

  @lazySingleton
  MarkNotificationReadUseCase markNotificationReadUseCase(NotificationRepository repository) =>
      MarkNotificationReadUseCase(repository);

  @lazySingleton
  MarkAllNotificationsReadUseCase markAllNotificationsReadUseCase(NotificationRepository repository) =>
      MarkAllNotificationsReadUseCase(repository);

  @lazySingleton
  GetUnreadCountUseCase getUnreadCountUseCase(NotificationRepository repository) =>
      GetUnreadCountUseCase(repository);

  @lazySingleton
  RegisterDeviceTokenUseCase registerDeviceTokenUseCase(NotificationRepository repository) =>
      RegisterDeviceTokenUseCase(repository);

  @lazySingleton
  NotificationCubit notificationCubit(
    GetNotificationsUseCase getNotificationsUseCase,
    MarkNotificationReadUseCase markNotificationReadUseCase,
    MarkAllNotificationsReadUseCase markAllNotificationsReadUseCase,
    GetUnreadCountUseCase getUnreadCountUseCase,
  ) => NotificationCubit(
    getNotificationsUseCase,
    markNotificationReadUseCase,
    markAllNotificationsReadUseCase,
    getUnreadCountUseCase,
  );

  /// HistoryCubit - untuk halaman riwayat
  @factoryMethod
  HistoryCubit historyCubit() => HistoryCubit();

  /// HistoryPekerjaanCubit - untuk tab pekerjaan di halaman riwayat
  @factoryMethod
  HistoryPekerjaanCubit historyPekerjaanCubit(
    GetMyBidsUseCase getMyBidsUseCase,
    UpdateBidStatusUseCase updateBidStatusUseCase,
    CreateJobReviewUseCase createJobReviewUseCase,
  ) =>
      HistoryPekerjaanCubit(
        getMyBidsUseCase,
        updateBidStatusUseCase,
        createJobReviewUseCase,
      );

  /// HistoryPekerjaCubit - untuk tab pekerja di halaman riwayat
  @factoryMethod
  HistoryPekerjaCubit historyPekerjaCubit(
    GetWorkerContactsUseCase getWorkerContactsUseCase,
    SubmitWorkerReviewUseCase submitWorkerReviewUseCase,
  ) =>
      HistoryPekerjaCubit(
        getWorkerContactsUseCase,
        submitWorkerReviewUseCase,
      );

  /// HistoryBarangBekasCubit - untuk tab barang bekas di halaman riwayat
  @factoryMethod
  HistoryBarangBekasCubit historyBarangBekasCubit(
    GetMyClaimedSecondhandsUseCase getMyClaimedSecondhandsUseCase,
  ) =>
      HistoryBarangBekasCubit(getMyClaimedSecondhandsUseCase);

  /// DaftarPelamarCubit - untuk halaman daftar pelamar iklan pekerjaan
  @factoryMethod
  DaftarPelamarCubit daftarPelamarCubit(
    GetIncomingBidsUseCase getIncomingBidsUseCase,
    UpdateBidStatusUseCase updateBidStatusUseCase,
    OwnerCompleteJobUseCase ownerCompleteJobUseCase,
    OwnerConfirmBidUseCase ownerConfirmBidUseCase,
  ) =>
      DaftarPelamarCubit(
        getIncomingBidsUseCase,
        updateBidStatusUseCase,
        ownerCompleteJobUseCase,
        ownerConfirmBidUseCase,
      );

  /// HistoryIklanPekerjaanCubit - untuk tab Iklan Saya di halaman riwayat
  @factoryMethod
  HistoryIklanPekerjaanCubit historyIklanPekerjaanCubit(
    GetMyJobsUseCase getMyJobsUseCase,
  ) =>
      HistoryIklanPekerjaanCubit(getMyJobsUseCase);

  /// HistoryIklanPekerjaCubit - untuk tab Iklan Saya > Pekerja di halaman riwayat
  @factoryMethod
  HistoryIklanPekerjaCubit historyIklanPekerjaCubit(
    GetMyWorkerProfileUseCase getMyWorkerProfileUseCase,
  ) =>
      HistoryIklanPekerjaCubit(getMyWorkerProfileUseCase);

  /// HistoryIklanPelatihanCubit - untuk tab Iklan Saya > Pelatihan di halaman riwayat
  @factoryMethod
  HistoryIklanPelatihanCubit historyIklanPelatihanCubit(
    GetMyTrainingsUseCase getMyTrainingsUseCase,
  ) =>
      HistoryIklanPelatihanCubit(getMyTrainingsUseCase);

  /// ContactRequestCubit - untuk halaman permintaan kontak masuk ke profil pekerja
  @factoryMethod
  ContactRequestCubit contactRequestCubit(
    GetIncomingContactsUseCase getIncomingContactsUseCase,
    UpdateWorkerContactStatusUseCase updateWorkerContactStatusUseCase,
  ) =>
      ContactRequestCubit(
        getIncomingContactsUseCase,
        updateWorkerContactStatusUseCase,
      );

  /// Configuration should prefer @injectable on source classes.
}
