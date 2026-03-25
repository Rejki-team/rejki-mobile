import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'create_training_ad_state.dart';

@injectable
class CreateTrainingAdCubit extends Cubit<CreateTrainingAdState> {
  CreateTrainingAdCubit() : super(const CreateTrainingAdState());

  void emailChanged(String value) => emit(state.copyWith(email: value));
  void companyNameChanged(String value) =>
      emit(state.copyWith(companyName: value));
  void positionChanged(String value) => emit(state.copyWith(position: value));
  void titleChanged(String value) => emit(state.copyWith(title: value));
  void descriptionChanged(String value) =>
      emit(state.copyWith(description: value));
  void dateChanged(String value) => emit(state.copyWith(date: value));
  void timeChanged(String value) => emit(state.copyWith(time: value));
  void locationChanged(String value) => emit(state.copyWith(location: value));
  void countryChanged(String value) => emit(state.copyWith(country: value));
  void costChanged(String value) => emit(state.copyWith(cost: value));

  Future<void> submit() async {
    if (!state.isFormValid) return;

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      // simulate network request to prevent ANR and memory leak lock
      await Future.delayed(const Duration(seconds: 2));

      // prevent memory leak if closed while waiting
      if (isClosed) return;

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Gagal mengirim proposal. Silakan coba lagi.',
        ),
      );
    }
  }
}
