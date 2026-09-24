import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';
import 'package:designsystems/designsystems.dart';

import 'training_detail_state.dart';
import '../models/training_detail_model.dart';

@injectable
class TrainingDetailCubit extends Cubit<TrainingDetailState> {
  final GetTrainingDetailUseCase _getTrainingDetailUseCase;
  final EnrollTrainingUseCase _enrollTrainingUseCase;
  final SessionStorage _sessionStorage;

  TrainingDetailCubit(
    this._getTrainingDetailUseCase,
    this._enrollTrainingUseCase,
    this._sessionStorage,
  ) : super(const TrainingDetailState());

  Future<void> loadTraining(String id) async {
    emit(state.copyWith(isLoading: true, isFailure: false, errorMessage: null));

    final result = await _getTrainingDetailUseCase(id);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: failure.maybeWhen(
            serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
            orElse: () => 'Gagal memuat detail pelatihan.',
          ),
        ),
      ),
      (entity) {
        final currentUserId = _sessionStorage.getUserId();
        final isOwner = currentUserId != null && entity.userId == currentUserId;
        emit(
          state.copyWith(
            isLoading: false,
            training: _entityToModel(entity),
            isOwner: isOwner,
          ),
        );
      },
    );
  }

  Future<void> registerTraining() async {
    if (state.isRegistering || state.training == null) return;
    emit(state.copyWith(isRegistering: true));

    final result = await _enrollTrainingUseCase(state.training!.id);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isRegistering: false,
          errorMessage: failure.maybeWhen(
            serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
            orElse: () => 'Gagal mendaftar pelatihan.',
          ),
        ),
      ),
      (_) => emit(
        state.copyWith(isRegistering: false, isRegistrationSuccess: true),
      ),
    );
  }

  TrainingDetailModel _entityToModel(TrainingEntity entity) {
    final imageUrl = entity.images.isNotEmpty
        ? ApiConfig.buildImageUrl(entity.images.first.uriPath)
        : null;

    final facilities = entity.facilities
        .map(
          (f) =>
              TrainingFacilityModel(iconAsset: AppAssets.iconPaper, label: f),
        )
        .toList();

    final regionParts = <String>[
      if (entity.village != null && entity.village!.isNotEmpty) entity.village!,
      if (entity.district != null && entity.district!.isNotEmpty)
        entity.district!,
      if (entity.city != null && entity.city!.isNotEmpty) entity.city!,
      if (entity.province != null && entity.province!.isNotEmpty)
        entity.province!,
    ];
    final region = regionParts.isNotEmpty ? regionParts.join(', ') : null;

    return TrainingDetailModel(
      id: entity.id,
      imageUrl: imageUrl,
      title: entity.title,
      badge:
          entity.certificate ??
          (entity.feePerPerson == 0 ? 'Gratis' : 'Berbayar'),
      description: entity.description,
      date: _formatDate(entity.dateOfTraining),
      time: _formatTime(entity.dateOfTraining),
      location: entity.locationAddress,
      facilities: facilities,
      requirements: const [],
      fee: entity.formattedFee,
      feeNotice: entity.feePerPerson == 0 ? 'Pelatihan 100% Gratis!' : '',
      companyName: entity.companyName,
      status: entity.status,
      adCode: entity.adCode,
      rejectionReason: entity.rejectionReason,
      totalApprovedEnrollees: entity.totalApprovedEnrollees,
      contactEmail: entity.email,
      contactRole: entity.role,
      region: region,
      bankName: entity.bankName.isEmpty ? null : entity.bankName,
      bankAccountNumber: entity.bankAccountNumber.isEmpty
          ? null
          : entity.bankAccountNumber,
      bankAccountHolderName: entity.bankAccountHolderName.isEmpty
          ? null
          : entity.bankAccountHolderName,
    );
  }

  static String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw);
      const months = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
      ];
      return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
    } catch (_) {
      return raw;
    }
  }

  static String _formatTime(String raw) {
    try {
      final dt = DateTime.parse(raw);
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m';
    } catch (_) {
      return '';
    }
  }
}
