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
import 'package:feature_pelatihan/feature_pelatihan.dart';
import 'package:feature_barangbekas/feature_barangbekas.dart' hide LocationBloc;
import 'package:feature_barangbekas/presentation/location/bloc/location_bloc.dart' as barangbekas_loc;
import 'package:feature_notification/feature_notification.dart';
import 'package:feature_register/feature_register.dart';
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_cubit.dart';
import 'package:feature_pekerja/presentation/location/bloc/location_bloc.dart' as worker_loc;
// ignore: implementation_imports
import 'package:feature_profile/src/location/bloc/location_bloc.dart' as profile_loc;
import 'package:feature_profile/feature_profile.dart' hide LocationBloc;

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
  @factoryMethod
  HomeBloc homeBloc(GetLatestJobsUseCase getLatestJobsUseCase) =>
      HomeBloc(getLatestJobsUseCase);

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

  /// CreateWorkerAdCubit - untuk membuat iklan pekerja
  @factoryMethod
  CreateWorkerAdCubit createWorkerAdCubit(
    CreateWorkerAdUseCase createWorkerUseCase,
    EnumStorage enumStorage,
  ) => CreateWorkerAdCubit(createWorkerUseCase, enumStorage);

  // ============================================
  // FEATURE PELATIHAN CUBITS
  // ============================================

  /// TrainingListingCubit - untuk halaman daftar pelatihan
  @factoryMethod
  TrainingListingCubit trainingListingCubit() => TrainingListingCubit();

  /// CreateTrainingAdCubit - untuk membuat iklan pelatihan
  @factoryMethod
  CreateTrainingAdCubit createTrainingAdCubit() => CreateTrainingAdCubit();

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
  ) => ClaimSecondhandUseCase(repository);

  /// GetUserProfileUseCase - untuk mendapatkan profil user (radius filter)
  @lazySingleton
  GetUserProfileUseCase getUserProfileUseCase(ProfileRepository repository) =>
      GetUserProfileUseCase(repository);

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
  // FEATURE NOTIFICATION CUBITS
  // ============================================

  /// NotificationCubit - untuk halaman notifikasi
  @factoryMethod
  NotificationCubit notificationCubit() => NotificationCubit();

  /// Configuration should prefer @injectable on source classes.
}
