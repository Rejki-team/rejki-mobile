import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'submit_training_ad_state.dart';

@injectable
class SubmitTrainingAdCubit extends Cubit<SubmitTrainingAdState> {
  final CreateTrainingUseCase _createTrainingUseCase;

  SubmitTrainingAdCubit(this._createTrainingUseCase)
      : super(const SubmitTrainingAdState());

  Future<void> submitRequest(CreateTrainingParams params) async {
    emit(
      state.copyWith(isRequesting: true, isSuccess: false, errorMessage: null),
    );

    final result = await _createTrainingUseCase(params);

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        isRequesting: false,
        errorMessage: failure.maybeWhen(
          serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
          orElse: () => 'Gagal mengirim proposal. Silakan coba lagi.',
        ),
      )),
      (_) => emit(state.copyWith(isRequesting: false, isSuccess: true)),
    );
  }
}
