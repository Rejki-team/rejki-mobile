import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'notification_state.dart';

@lazySingleton
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotifications;
  final MarkNotificationReadUseCase _markAsRead;
  final MarkAllNotificationsReadUseCase _markAllAsRead;
  final GetUnreadCountUseCase _getUnreadCount;

  NotificationCubit(
    this._getNotifications,
    this._markAsRead,
    this._markAllAsRead,
    this._getUnreadCount,
  ) : super(const NotificationState());

  Future<void> loadNotifications({bool refresh = false}) async {
    if (state.status == NotificationStatus.loading ||
        state.status == NotificationStatus.loadingMore) {
      return;
    }

    final isRefresh = refresh || state.status == NotificationStatus.initial;
    final nextPage = isRefresh ? 1 : state.page + 1;

    emit(state.copyWith(
      status: isRefresh ? NotificationStatus.loading : NotificationStatus.loadingMore,
      errorMessage: null,
    ));

    final result = await _getNotifications(page: nextPage);

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        status: NotificationStatus.failure,
        errorMessage: failure.when(
          serverError: (msg) => msg ?? 'Gagal memuat notifikasi.',
          networkError: () => 'Tidak ada koneksi internet.',
          unauthorized: () => 'Sesi berakhir, silakan login kembali.',
          notFound: () => 'Data tidak ditemukan.',
          unknown: () => 'Terjadi kesalahan tidak diketahui.',
        ),
      )),
      (result) => emit(state.copyWith(
        status: NotificationStatus.success,
        notifications: isRefresh
            ? result.notifications
            : [...state.notifications, ...result.notifications],
        unreadCount: result.unreadCount,
        page: result.page,
        hasNext: result.hasNext,
      )),
    );
  }

  Future<void> loadMore() async {
    if (!state.hasNext) return;
    await loadNotifications(refresh: false);
  }

  Future<void> markAsRead(String id) async {
    final result = await _markAsRead(id);
    if (isClosed) return;
    result.fold(
      (_) => null,
      (_) {
        final updated = state.notifications
            .map((n) => n.id == id ? NotificationEntity(
                  id: n.id,
                  type: n.type,
                  title: n.title,
                  body: n.body,
                  isRead: true,
                  createdAt: n.createdAt,
                ) : n)
            .toList();
        emit(state.copyWith(
          notifications: updated,
          unreadCount: (state.unreadCount - 1).clamp(0, state.unreadCount),
        ));
      },
    );
  }

  Future<void> markAllAsRead() async {
    final result = await _markAllAsRead();
    if (isClosed) return;
    result.fold(
      (_) => null,
      (_) {
        final updated = state.notifications
            .map((n) => NotificationEntity(
                  id: n.id,
                  type: n.type,
                  title: n.title,
                  body: n.body,
                  isRead: true,
                  createdAt: n.createdAt,
                ))
            .toList();
        emit(state.copyWith(notifications: updated, unreadCount: 0));
      },
    );
  }

  Future<void> refreshUnreadCount() async {
    final result = await _getUnreadCount();
    if (isClosed) return;
    result.fold(
      (_) => null,
      (count) => emit(state.copyWith(unreadCount: count)),
    );
  }
}
