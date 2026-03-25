import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/validators/validators.dart';
import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:injectable/injectable.dart';
import 'create_job_event.dart';
import 'create_job_state.dart';
import '../models/salary_type.dart';

@injectable
class CreateJobBloc extends Bloc<CreateJobEvent, CreateJobState> {
  final CreateJobUseCase createJobUseCase;

  CreateJobBloc({required this.createJobUseCase})
    : super(const CreateJobState()) {
    on<TitleChanged>(_onTitleChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<RequirementsChanged>(_onRequirementsChanged);
    on<ImagesChanged>(_onImagesChanged);
    on<SalaryTypeChanged>(_onSalaryTypeChanged);
    on<SalaryAmountChanged>(_onSalaryAmountChanged);
    on<WorkerCountChanged>(_onWorkerCountChanged);
    on<DateChanged>(_onDateChanged);
    on<TimeChanged>(_onTimeChanged);
    on<AddressChanged>(_onAddressChanged);
    on<ProvinceChanged>(_onProvinceChanged);
    on<CityChanged>(_onCityChanged);
    on<DistrictChanged>(_onDistrictChanged);
    on<WardChanged>(_onWardChanged);
    on<VillageChanged>(_onVillageChanged);
    on<LocationCoordinatesChanged>(_onLocationCoordinatesChanged);
    on<SubmitJob>(_onSubmitJob);
  }

  void _onTitleChanged(TitleChanged event, Emitter<CreateJobState> emit) {
    final title = TextInput.dirty(event.value, minLength: 10, maxLength: 100);
    emit(state.copyWith(title: title));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<CreateJobState> emit,
  ) {
    final description = TextInput.dirty(
      event.value,
      minLength: 10,
      maxLength: 500,
    );
    emit(state.copyWith(description: description));
  }

  void _onImagesChanged(ImagesChanged event, Emitter<CreateJobState> emit) {
    emit(state.copyWith(images: event.images));
  }

  void _onRequirementsChanged(
    RequirementsChanged event,
    Emitter<CreateJobState> emit,
  ) {
    final requirements = TextInput.dirty(
      event.value,
      minLength: 10,
      maxLength: 500,
    );
    emit(state.copyWith(requirements: requirements));
  }

  void _onSalaryTypeChanged(
    SalaryTypeChanged event,
    Emitter<CreateJobState> emit,
  ) {
    emit(state.copyWith(salaryType: event.value));
  }

  void _onSalaryAmountChanged(
    SalaryAmountChanged event,
    Emitter<CreateJobState> emit,
  ) {
    emit(state.copyWith(salaryAmount: event.value));
  }

  void _onWorkerCountChanged(
    WorkerCountChanged event,
    Emitter<CreateJobState> emit,
  ) {
    emit(state.copyWith(workerCount: event.value));
  }

  void _onDateChanged(DateChanged event, Emitter<CreateJobState> emit) {
    emit(state.copyWith(selectedDate: event.date));
  }

  void _onTimeChanged(TimeChanged event, Emitter<CreateJobState> emit) {
    emit(state.copyWith(selectedTime: event.time));
  }

  void _onAddressChanged(AddressChanged event, Emitter<CreateJobState> emit) {
    final address = TextInput.dirty(event.value, maxLength: 150);
    emit(state.copyWith(address: address));
  }

  void _onProvinceChanged(ProvinceChanged event, Emitter<CreateJobState> emit) {
    emit(
      state.copyWith(
        selectedProvince: event.province,
        selectedCity: null,
        selectedDistrict: null,
        selectedWard: null,
      ),
    );
  }

  void _onCityChanged(CityChanged event, Emitter<CreateJobState> emit) {
    emit(
      state.copyWith(
        selectedCity: event.city,
        selectedDistrict: null,
        selectedWard: null,
      ),
    );
  }

  void _onDistrictChanged(DistrictChanged event, Emitter<CreateJobState> emit) {
    emit(state.copyWith(selectedDistrict: event.district, selectedWard: null));
  }

  void _onWardChanged(WardChanged event, Emitter<CreateJobState> emit) {
    emit(state.copyWith(selectedWard: event.ward));
  }

  void _onVillageChanged(VillageChanged event, Emitter<CreateJobState> emit) {
    final village = TextInput.dirty(event.value, maxLength: 100);
    emit(state.copyWith(village: village));
  }

  /// Stores GPS coordinates dispatched from the page after geolocator resolves.
  ///
  /// Both fields are nullable — GPS may be unavailable (permission denied,
  /// airplane mode, etc.). A missing coordinate does not block form submission.
  void _onLocationCoordinatesChanged(
    LocationCoordinatesChanged event,
    Emitter<CreateJobState> emit,
  ) {
    emit(state.copyWith(
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  Future<void> _onSubmitJob(
    SubmitJob event,
    Emitter<CreateJobState> emit,
  ) async {
    if (!state.isValid) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: const JobFailure.serverError(
            'Mohon lengkapi semua field yang wajib diisi',
          ),
        ),
      );
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final dateTimeString =
        '${DateFormat('yyyy-MM-dd').format(state.selectedDate!)} '
        '${state.selectedTime!.hour.toString().padLeft(2, '0')}:'
        '${state.selectedTime!.minute.toString().padLeft(2, '0')}:00';

    final salaryInt = int.parse(state.salaryAmount.replaceAll('.', ''));
    final workerCountInt = int.parse(state.workerCount);

    // Map salary display label → server API value.
    // SalaryType.fromDisplayLabel returns null for unrecognised labels:
    // we fall back to the raw label so that unexpected values surface
    // clearly in API logs rather than being silently swapped.
    final salaryApiValue =
        SalaryType.fromDisplayLabel(state.salaryType)?.apiValue ??
        state.salaryType;

    final params = CreateJobParams(
      title: state.title.value,
      jobDesc: state.description.value,
      requirements: state.requirements.value,
      salary: salaryInt,
      salaryOfWorker: salaryApiValue,
      numberOfWorker: workerCountInt,
      dateOfJob: dateTimeString,
      address: state.address.value,
      province: state.selectedProvince!,
      city: state.selectedCity!,
      subdistrict: state.selectedDistrict!,
      ward: state.selectedWard!,
      village: state.village.value,
      images: state.images,
      latitude: state.latitude,
      longitude: state.longitude,
    );

    debugPrint('📤 [CreateJobBloc] ward: ${params.ward}');
    debugPrint('📤 [CreateJobBloc] village: ${params.village}');
    debugPrint('📤 [CreateJobBloc] Calling createJobUseCase...');
    final result = await createJobUseCase(params);
    debugPrint('📦 [CreateJobBloc] Result received: $result');

    result.fold(
      (failure) {
        debugPrint('❌ [CreateJobBloc] Failure: $failure');
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            failure: failure,
          ),
        );
      },
      (job) {
        debugPrint('✅ [CreateJobBloc] Success! Job ID: ${job.id}');
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      },
    );
  }
}
