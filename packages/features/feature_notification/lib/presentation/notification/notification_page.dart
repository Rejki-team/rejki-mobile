import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/notification_cubit.dart';
import 'cubit/notification_state.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().loadNotifications(refresh: true);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<NotificationCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.buttonGradientEnd,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(context),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state.status == NotificationStatus.loading) {
              return const AppCustomShimmerList(
                style: ShimmerCardStyle.textOnly,
              );
            }
            if (state.status == NotificationStatus.failure &&
                state.notifications.isEmpty) {
              return AppErrorState(
                description: state.errorMessage ?? 'Gagal memuat notifikasi.',
                onRetry: () => context
                    .read<NotificationCubit>()
                    .loadNotifications(refresh: true),
              );
            }
            if (state.status == NotificationStatus.success &&
                state.notifications.isEmpty) {
              return const AppEmptyState(
                title: 'Belum Ada Notifikasi',
                description: 'Notifikasi akan muncul di sini.',
              );
            }
            return RefreshIndicator(
              onRefresh: () => context
                  .read<NotificationCubit>()
                  .loadNotifications(refresh: true),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.lg,
                ),
                itemCount: state.notifications.length + (state.hasNext ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.notifications.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final notification = state.notifications[index];
                  return NotificationCard(
                    title: notification.title,
                    description: notification.body,
                    timeText: _formatTime(notification.createdAt),
                    type: notificationTypeFromString(notification.type),
                    isUnread: !notification.isRead,
                    onTap: () => context.read<NotificationCubit>().markAsRead(
                      notification.id,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'Notifikasi',
        style: AppTypography.titleMedium.copyWith(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        BlocSelector<NotificationCubit, NotificationState, int>(
          selector: (state) => state.unreadCount,
          builder: (context, unreadCount) {
            if (unreadCount == 0) return const SizedBox.shrink();
            return TextButton(
              onPressed: () =>
                  context.read<NotificationCubit>().markAllAsRead(),
              child: Text(
                'Tandai Semua',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m lalu';
    if (diff.inHours < 24) return '${diff.inHours}j lalu';
    return '${diff.inDays}h lalu';
  }
}
