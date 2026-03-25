import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

  Future<void> loadNotifications() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(const Duration(milliseconds: 600)); // Mock network

      if (isClosed) return;

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Gagal memuat notifikasi.',
        ),
      );
    }
  }
}
