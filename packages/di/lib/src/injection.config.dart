// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:feature_barangbekas/feature_barangbekas.dart' as _i685;
import 'package:feature_history/feature_history.dart' as _i674;
import 'package:feature_home/feature_home.dart' as _i545;
import 'package:feature_notification/feature_notification.dart' as _i884;
import 'package:feature_pekerja/feature_pekerja.dart' as _i950;
import 'package:feature_pekerja/presentation/location/bloc/location_bloc.dart'
    as _i991;
import 'package:feature_pekerjaan/feature_pekerjaan.dart' as _i10;
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_cubit.dart'
    as _i806;
import 'package:feature_pelatihan/feature_pelatihan.dart' as _i216;
import 'package:feature_profile/feature_profile.dart' as _i1070;
import 'package:feature_profile/src/location/bloc/location_bloc.dart' as _i1018;
import 'package:feature_register/feature_register.dart' as _i473;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local/local.dart' as _i960;
import 'package:network/network.dart' as _i372;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i216.CreateTrainingAdCubit>(
      () => registerModule.createTrainingAdCubit(),
    );
    gh.factory<_i674.HistoryCubit>(() => registerModule.historyCubit());
    gh.singleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i372.ConnectivityUtil>(
      () => registerModule.connectivityUtil,
    );
    gh.lazySingleton<_i960.SessionStorage>(
      () => registerModule.sessionStorage(
        gh<_i558.FlutterSecureStorage>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i372.DioClient>(
      () => registerModule.dioClient(gh<_i960.SessionStorage>()),
    );
    gh.lazySingleton<_i437.AuthRemoteDataSource>(
      () => registerModule.authRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.JobRemoteDataSource>(
      () => registerModule.jobRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.BidJobDataSource>(
      () => registerModule.bidJobDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.JobMutationDataSource>(
      () => registerModule.jobMutationDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.LocationRemoteDataSource>(
      () => registerModule.locationRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.HelperRemoteDataSource>(
      () => registerModule.helperRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.WorkerRemoteDataSource>(
      () => registerModule.workerRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.TrainingRemoteDataSource>(
      () => registerModule.trainingRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.SecondhandRemoteDataSource>(
      () => registerModule.secondhandRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.SecondhandMutationDataSource>(
      () => registerModule.secondhandMutationDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.NotificationRemoteDataSource>(
      () => registerModule.notificationRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i437.ProfileRemoteDataSource>(
      () => registerModule.profileRemoteDataSource(gh<_i372.DioClient>()),
    );
    gh.lazySingleton<_i494.TrainingRepository>(
      () => registerModule.trainingRepository(
        gh<_i437.TrainingRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i494.LocationRepository>(
      () => registerModule.locationRepository(
        gh<_i437.LocationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i494.GetMyTrainingEnrollmentsUseCase>(
      () => registerModule.getMyTrainingEnrollmentsUseCase(
        gh<_i494.TrainingRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetTrainingDetailUseCase>(
      () => registerModule.getTrainingDetailUseCase(
        gh<_i494.TrainingRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetTrainingsUseCase>(
      () => registerModule.getTrainingsUseCase(gh<_i494.TrainingRepository>()),
    );
    gh.lazySingleton<_i494.GetMyTrainingsUseCase>(
      () =>
          registerModule.getMyTrainingsUseCase(gh<_i494.TrainingRepository>()),
    );
    gh.lazySingleton<_i494.CreateTrainingUseCase>(
      () =>
          registerModule.createTrainingUseCase(gh<_i494.TrainingRepository>()),
    );
    gh.lazySingleton<_i494.EnrollTrainingUseCase>(
      () =>
          registerModule.enrollTrainingUseCase(gh<_i494.TrainingRepository>()),
    );
    gh.lazySingleton<_i494.UploadPaymentProofUseCase>(
      () => registerModule.uploadPaymentProofUseCase(
        gh<_i494.TrainingRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetEnrollmentsByTrainingUseCase>(
      () => registerModule.getEnrollmentsByTrainingUseCase(
        gh<_i494.TrainingRepository>(),
      ),
    );
    gh.lazySingleton<_i494.SubmitTrainingBadgeUseCase>(
      () => registerModule.submitTrainingBadgeUseCase(
        gh<_i494.TrainingRepository>(),
      ),
    );
    gh.lazySingleton<_i494.ProfileRepository>(
      () => registerModule.profileRepository(
        gh<_i437.ProfileRemoteDataSource>(),
        gh<_i960.SessionStorage>(),
      ),
    );
    gh.factory<_i674.HistoryIklanPelatihanCubit>(
      () => registerModule.historyIklanPelatihanCubit(
        gh<_i494.GetMyTrainingsUseCase>(),
      ),
    );
    gh.lazySingleton<_i494.SecondhandRepository>(
      () => registerModule.secondhandRepository(
        gh<_i437.SecondhandRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i960.EnumStorage>(
      () => registerModule.enumStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i494.JobMutationRepository>(
      () => registerModule.jobMutationRepository(
        gh<_i437.JobMutationDataSource>(),
      ),
    );
    gh.factory<_i216.TrainingListingCubit>(
      () =>
          registerModule.trainingListingCubit(gh<_i494.GetTrainingsUseCase>()),
    );
    gh.factory<_i216.PaymentCubit>(
      () => registerModule.paymentCubit(gh<_i494.UploadPaymentProofUseCase>()),
    );
    gh.factory<_i216.TrainingDetailCubit>(
      () => registerModule.trainingDetailCubit(
        gh<_i494.GetTrainingDetailUseCase>(),
        gh<_i494.EnrollTrainingUseCase>(),
        gh<_i960.SessionStorage>(),
      ),
    );
    gh.lazySingleton<_i494.GetProvincesUseCase>(
      () => registerModule.getProvincesUseCase(gh<_i494.LocationRepository>()),
    );
    gh.lazySingleton<_i494.GetRegenciesUseCase>(
      () => registerModule.getRegenciesUseCase(gh<_i494.LocationRepository>()),
    );
    gh.lazySingleton<_i494.GetDistrictsUseCase>(
      () => registerModule.getDistrictsUseCase(gh<_i494.LocationRepository>()),
    );
    gh.lazySingleton<_i494.GetVillagesUseCase>(
      () => registerModule.getVillagesUseCase(gh<_i494.LocationRepository>()),
    );
    gh.lazySingleton<_i494.NotificationRepository>(
      () => registerModule.notificationRepository(
        gh<_i437.NotificationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i494.WorkerRepository>(
      () => registerModule.workerRepository(gh<_i437.WorkerRemoteDataSource>()),
    );
    gh.lazySingleton<_i494.GetSecondhandsUseCase>(
      () => registerModule.getSecondhandsUseCase(
        gh<_i494.SecondhandRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetSecondhandByIdUseCase>(
      () => registerModule.getSecondhandByIdUseCase(
        gh<_i494.SecondhandRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetMyClaimedSecondhandsUseCase>(
      () => registerModule.getMyClaimedSecondhandsUseCase(
        gh<_i494.SecondhandRepository>(),
      ),
    );
    gh.lazySingleton<_i494.AuthRepository>(
      () => registerModule.authRepository(
        gh<_i437.AuthRemoteDataSource>(),
        gh<_i960.SessionStorage>(),
      ),
    );
    gh.lazySingleton<_i494.CreateJobUseCase>(
      () => registerModule.createJobUseCase(gh<_i494.JobMutationRepository>()),
    );
    gh.lazySingleton<_i494.UpdateBidStatusUseCase>(
      () => registerModule.updateBidStatusUseCase(
        gh<_i494.JobMutationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.OwnerCompleteJobUseCase>(
      () => registerModule.ownerCompleteJobUseCase(
        gh<_i494.JobMutationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.OwnerConfirmBidUseCase>(
      () => registerModule.ownerConfirmBidUseCase(
        gh<_i494.JobMutationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.CreateJobReviewUseCase>(
      () => registerModule.createJobReviewUseCase(
        gh<_i494.JobMutationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.LoginUseCase>(
      () => registerModule.loginUseCase(gh<_i494.AuthRepository>()),
    );
    gh.lazySingleton<_i494.RegisterUseCase>(
      () => registerModule.registerUseCase(gh<_i494.AuthRepository>()),
    );
    gh.lazySingleton<_i494.GetWorkersUseCase>(
      () => registerModule.getWorkersUseCase(gh<_i494.WorkerRepository>()),
    );
    gh.lazySingleton<_i494.GetWorkerByIdUseCase>(
      () => registerModule.getWorkerByIdUseCaseWorker(
        gh<_i494.WorkerRepository>(),
      ),
    );
    gh.lazySingleton<_i494.CreateWorkerAdUseCase>(
      () => registerModule.createWorkerAdUseCase(gh<_i494.WorkerRepository>()),
    );
    gh.lazySingleton<_i494.GetMyWorkerProfileUseCase>(
      () => registerModule.getMyWorkerProfileUseCase(
        gh<_i494.WorkerRepository>(),
      ),
    );
    gh.lazySingleton<_i494.UpdateWorkerProfileUseCase>(
      () => registerModule.updateWorkerProfileUseCase(
        gh<_i494.WorkerRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetWorkerContactsUseCase>(
      () =>
          registerModule.getWorkerContactsUseCase(gh<_i494.WorkerRepository>()),
    );
    gh.lazySingleton<_i494.GetIncomingContactsUseCase>(
      () => registerModule.getIncomingContactsUseCase(
        gh<_i494.WorkerRepository>(),
      ),
    );
    gh.lazySingleton<_i494.UpdateWorkerContactStatusUseCase>(
      () => registerModule.updateWorkerContactStatusUseCase(
        gh<_i494.WorkerRepository>(),
      ),
    );
    gh.lazySingleton<_i494.SubmitWorkerReviewUseCase>(
      () => registerModule.submitWorkerReviewUseCase(
        gh<_i494.WorkerRepository>(),
      ),
    );
    gh.factory<_i216.DaftarPendaftarCubit>(
      () => registerModule.daftarPendaftarCubit(
        gh<_i494.GetEnrollmentsByTrainingUseCase>(),
      ),
    );
    gh.lazySingleton<_i494.UpdateProfileUseCase>(
      () => registerModule.updateProfileUseCase(gh<_i494.ProfileRepository>()),
    );
    gh.lazySingleton<_i494.GetUserProfileUseCase>(
      () => registerModule.getUserProfileUseCase(gh<_i494.ProfileRepository>()),
    );
    gh.lazySingleton<_i494.GetUserSummaryUseCase>(
      () => registerModule.getUserSummaryUseCase(gh<_i494.ProfileRepository>()),
    );
    gh.lazySingleton<_i494.UploadProfilePhotoUseCase>(
      () => registerModule.uploadProfilePhotoUseCase(
        gh<_i494.ProfileRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetUserFullProfileUseCase>(
      () => registerModule.getUserFullProfileUseCase(
        gh<_i494.ProfileRepository>(),
      ),
    );
    gh.lazySingleton<_i494.UpdateWorkingHoursUseCase>(
      () => registerModule.updateWorkingHoursUseCase(
        gh<_i494.ProfileRepository>(),
      ),
    );
    gh.lazySingleton<_i494.UpdatePhoneVisibilityUseCase>(
      () => registerModule.updatePhoneVisibilityUseCase(
        gh<_i494.ProfileRepository>(),
      ),
    );
    gh.lazySingleton<_i494.SecondhandMutationRepository>(
      () => registerModule.secondhandMutationRepository(
        gh<_i437.SecondhandMutationDataSource>(),
      ),
    );
    gh.lazySingleton<_i494.JobRepository>(
      () => registerModule.jobRepository(
        gh<_i437.JobRemoteDataSource>(),
        gh<_i437.BidJobDataSource>(),
      ),
    );
    gh.factory<_i674.HistoryIklanPekerjaCubit>(
      () => registerModule.historyIklanPekerjaCubit(
        gh<_i494.GetMyWorkerProfileUseCase>(),
      ),
    );
    gh.factory<_i674.HistoryPelatihanCubit>(
      () => registerModule.historyPelatihanCubit(
        gh<_i494.GetMyTrainingEnrollmentsUseCase>(),
      ),
    );
    gh.factory<_i216.BadgeUploadCubit>(
      () => registerModule.badgeUploadCubit(
        gh<_i494.SubmitTrainingBadgeUseCase>(),
      ),
    );
    gh.factory<_i10.LocationBloc>(
      () => registerModule.locationBloc(
        gh<_i494.GetProvincesUseCase>(),
        gh<_i494.GetRegenciesUseCase>(),
        gh<_i494.GetDistrictsUseCase>(),
        gh<_i494.GetVillagesUseCase>(),
      ),
    );
    gh.factory<_i991.LocationBloc>(
      () => registerModule.locationBlocPekerja(
        gh<_i494.GetProvincesUseCase>(),
        gh<_i494.GetRegenciesUseCase>(),
        gh<_i494.GetDistrictsUseCase>(),
        gh<_i494.GetVillagesUseCase>(),
      ),
    );
    gh.factory<_i1018.LocationBloc>(
      () => registerModule.locationBlocProfile(
        gh<_i494.GetProvincesUseCase>(),
        gh<_i494.GetRegenciesUseCase>(),
        gh<_i494.GetDistrictsUseCase>(),
        gh<_i494.GetVillagesUseCase>(),
      ),
    );
    gh.factory<_i216.LocationBloc>(
      () => registerModule.locationBlocPelatihan(
        gh<_i494.GetProvincesUseCase>(),
        gh<_i494.GetRegenciesUseCase>(),
        gh<_i494.GetDistrictsUseCase>(),
        gh<_i494.GetVillagesUseCase>(),
      ),
    );
    gh.factory<_i685.LocationBloc>(
      () => registerModule.locationBlocBarangBekas(
        gh<_i494.GetProvincesUseCase>(),
        gh<_i494.GetRegenciesUseCase>(),
        gh<_i494.GetDistrictsUseCase>(),
        gh<_i494.GetVillagesUseCase>(),
      ),
    );
    gh.factory<_i216.SubmitTrainingAdCubit>(
      () => registerModule.submitTrainingAdCubit(
        gh<_i494.CreateTrainingUseCase>(),
      ),
    );
    gh.factory<_i950.ContactRequestCubit>(
      () => registerModule.contactRequestCubit(
        gh<_i494.GetIncomingContactsUseCase>(),
        gh<_i494.UpdateWorkerContactStatusUseCase>(),
      ),
    );
    gh.factory<_i950.CreateWorkerAdCubit>(
      () => registerModule.createWorkerAdCubit(
        gh<_i494.CreateWorkerAdUseCase>(),
        gh<_i494.UpdateWorkerProfileUseCase>(),
        gh<_i494.GetMyWorkerProfileUseCase>(),
        gh<_i494.GetUserProfileUseCase>(),
        gh<_i960.EnumStorage>(),
      ),
    );
    gh.lazySingleton<_i494.HelperRepository>(
      () => registerModule.helperRepository(
        gh<_i437.HelperRemoteDataSource>(),
        gh<_i960.EnumStorage>(),
      ),
    );
    gh.factory<_i473.RegisterCubit>(
      () => registerModule.registerCubit(gh<_i494.RegisterUseCase>()),
    );
    gh.lazySingleton<_i494.GetLatestJobsUseCase>(
      () => registerModule.getLatestJobsUseCase(gh<_i494.JobRepository>()),
    );
    gh.lazySingleton<_i494.GetJobsUseCase>(
      () => registerModule.getJobsUseCase(gh<_i494.JobRepository>()),
    );
    gh.lazySingleton<_i494.GetJobByIdUseCase>(
      () => registerModule.getJobByIdUseCase(gh<_i494.JobRepository>()),
    );
    gh.lazySingleton<_i494.BidJobUseCase>(
      () => registerModule.bidJobUseCase(gh<_i494.JobRepository>()),
    );
    gh.lazySingleton<_i494.GetMyBidsUseCase>(
      () => registerModule.getMyBidsUseCase(gh<_i494.JobRepository>()),
    );
    gh.lazySingleton<_i494.GetIncomingBidsUseCase>(
      () => registerModule.getIncomingBidsUseCase(gh<_i494.JobRepository>()),
    );
    gh.lazySingleton<_i494.GetMyJobsUseCase>(
      () => registerModule.getMyJobsUseCase(gh<_i494.JobRepository>()),
    );
    gh.factory<_i950.WorkerListingCubit>(
      () => registerModule.workerListingCubit(gh<_i494.GetWorkersUseCase>()),
    );
    gh.factory<_i10.DaftarPelamarCubit>(
      () => registerModule.daftarPelamarCubit(
        gh<_i494.GetIncomingBidsUseCase>(),
        gh<_i494.UpdateBidStatusUseCase>(),
        gh<_i494.OwnerCompleteJobUseCase>(),
        gh<_i494.OwnerConfirmBidUseCase>(),
      ),
    );
    gh.lazySingleton<_i494.GetNotificationsUseCase>(
      () => registerModule.getNotificationsUseCase(
        gh<_i494.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.MarkNotificationReadUseCase>(
      () => registerModule.markNotificationReadUseCase(
        gh<_i494.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.MarkAllNotificationsReadUseCase>(
      () => registerModule.markAllNotificationsReadUseCase(
        gh<_i494.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.GetUnreadCountUseCase>(
      () => registerModule.getUnreadCountUseCase(
        gh<_i494.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.RegisterDeviceTokenUseCase>(
      () => registerModule.registerDeviceTokenUseCase(
        gh<_i494.NotificationRepository>(),
      ),
    );
    gh.factory<_i10.CreateJobBloc>(
      () => registerModule.createJobBloc(gh<_i494.CreateJobUseCase>()),
    );
    gh.factory<_i806.TakeJobCubit>(
      () => registerModule.takeJobCubit(
        gh<_i494.BidJobUseCase>(),
        gh<_i494.GetMyWorkerProfileUseCase>(),
      ),
    );
    gh.factory<_i685.DetailUsedGoodsAdCubit>(
      () => registerModule.detailUsedGoodsAdCubit(
        gh<_i494.GetSecondhandByIdUseCase>(),
      ),
    );
    gh.lazySingleton<_i494.SyncEnumsUseCase>(
      () => registerModule.syncEnumsUseCase(gh<_i494.HelperRepository>()),
    );
    gh.factory<_i1070.ProfileCubit>(
      () => registerModule.profileCubit(
        gh<_i494.GetUserSummaryUseCase>(),
        gh<_i494.UploadProfilePhotoUseCase>(),
        gh<_i960.SessionStorage>(),
      ),
    );
    gh.factory<_i1070.PersonalInfoCubit>(
      () => registerModule.personalInfoCubit(
        gh<_i494.GetUserFullProfileUseCase>(),
        gh<_i494.UpdateWorkingHoursUseCase>(),
        gh<_i494.UpdatePhoneVisibilityUseCase>(),
      ),
    );
    gh.factory<_i674.HistoryBarangBekasCubit>(
      () => registerModule.historyBarangBekasCubit(
        gh<_i494.GetMyClaimedSecondhandsUseCase>(),
      ),
    );
    gh.factory<_i674.HistoryPekerjaCubit>(
      () => registerModule.historyPekerjaCubit(
        gh<_i494.GetWorkerContactsUseCase>(),
        gh<_i494.SubmitWorkerReviewUseCase>(),
      ),
    );
    gh.factory<_i545.HomeBloc>(
      () => registerModule.homeBloc(
        gh<_i494.GetLatestJobsUseCase>(),
        gh<_i494.GetUserFullProfileUseCase>(),
      ),
    );
    gh.factory<_i674.HistoryPekerjaanCubit>(
      () => registerModule.historyPekerjaanCubit(
        gh<_i494.GetMyBidsUseCase>(),
        gh<_i494.UpdateBidStatusUseCase>(),
        gh<_i494.CreateJobReviewUseCase>(),
      ),
    );
    gh.lazySingleton<_i494.CreateSecondhandUseCase>(
      () => registerModule.createSecondhandUseCase(
        gh<_i494.SecondhandMutationRepository>(),
      ),
    );
    gh.lazySingleton<_i494.ClaimSecondhandUseCase>(
      () => registerModule.claimSecondhandUseCase(
        gh<_i494.SecondhandMutationRepository>(),
      ),
    );
    gh.factory<_i685.CreateUsedGoodsAdCubit>(
      () => registerModule.createUsedGoodsAdCubit(
        gh<_i494.CreateSecondhandUseCase>(),
      ),
    );
    gh.factory<_i1070.EditProfileCubit>(
      () => registerModule.editProfileCubit(gh<_i494.UpdateProfileUseCase>()),
    );
    gh.factory<_i685.SearchUsedGoodsAdCubit>(
      () => registerModule.searchUsedGoodsAdCubit(
        gh<_i494.GetSecondhandsUseCase>(),
        gh<_i494.GetUserProfileUseCase>(),
      ),
    );
    gh.factory<_i950.WorkerDetailCubit>(
      () => registerModule.workerDetailCubit(gh<_i494.GetWorkerByIdUseCase>()),
    );
    gh.factory<_i674.HistoryIklanPekerjaanCubit>(
      () => registerModule.historyIklanPekerjaanCubit(
        gh<_i494.GetMyJobsUseCase>(),
      ),
    );
    gh.factory<_i685.ClaimSecondhandCubit>(
      () => registerModule.claimSecondhandCubit(
        gh<_i494.ClaimSecondhandUseCase>(),
      ),
    );
    gh.factory<_i10.JobDetailCubit>(
      () => registerModule.jobDetailCubit(gh<_i494.GetJobByIdUseCase>()),
    );
    gh.factory<_i10.JobListingCubit>(
      () => registerModule.jobListingCubit(
        gh<_i494.GetJobsUseCase>(),
        gh<_i494.SyncEnumsUseCase>(),
      ),
    );
    gh.lazySingleton<_i884.NotificationCubit>(
      () => registerModule.notificationCubit(
        gh<_i494.GetNotificationsUseCase>(),
        gh<_i494.MarkNotificationReadUseCase>(),
        gh<_i494.MarkAllNotificationsReadUseCase>(),
        gh<_i494.GetUnreadCountUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
