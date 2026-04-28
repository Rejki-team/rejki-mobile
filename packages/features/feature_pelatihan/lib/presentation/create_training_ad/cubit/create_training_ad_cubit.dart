import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
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
  void bankNameChanged(String value) => emit(state.copyWith(bankName: value));
  void bankAccountNumberChanged(String value) =>
      emit(state.copyWith(bankAccountNumber: value));
  void bankAccountHolderNameChanged(String value) =>
      emit(state.copyWith(bankAccountHolderName: value));

  void facilityAdded(String facility) {
    final trimmed = facility.trim();
    if (trimmed.isEmpty || state.facilities.contains(trimmed)) return;
    emit(state.copyWith(facilities: [...state.facilities, trimmed]));
  }

  void facilityRemoved(int index) {
    final updated = [...state.facilities]..removeAt(index);
    emit(state.copyWith(facilities: updated));
  }

  CreateTrainingParams buildParams() {
    final dateOfTraining = _parseDateTime(state.date, state.time);
    final feePerPerson =
        int.tryParse(state.cost.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    return CreateTrainingParams(
      title: state.title,
      description: state.description,
      companyName: state.companyName,
      locationAddress: state.location,
      dateOfTraining: dateOfTraining,
      feePerPerson: feePerPerson,
      bankName: state.bankName,
      bankAccountNumber: state.bankAccountNumber,
      bankAccountHolderName: state.bankAccountHolderName,
      facilities: state.facilities,
    );
  }

  DateTime _parseDateTime(String date, String time) {
    try {
      final dateParts = date.split('/');
      final timeParts = time.split(':');
      return DateTime(
        int.parse(dateParts[2]),
        int.parse(dateParts[1]),
        int.parse(dateParts[0]),
        timeParts.isNotEmpty ? int.parse(timeParts[0]) : 0,
        timeParts.length > 1 ? int.parse(timeParts[1]) : 0,
      );
    } catch (_) {
      return DateTime.now().add(const Duration(days: 7));
    }
  }
}
