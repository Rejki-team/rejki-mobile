import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/notification_cubit.dart';
import 'cubit/notification_state.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NotificationView();
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

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
        appBar: _buildAppBar(),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
            }
            if (state.errorMessage != null) {
              return AppErrorState(
                description: state.errorMessage!,
                onRetry: () {}, // Cubit method for reload isn't apparent in View
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.lg,
              ),
              children: [
                NotificationCard(
                  title: 'Lamaran baru di terima',
                  description:
                      'Rizki mengambil pekerjaan dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.applicationAccepted, // Purple user
                  isUnread: true,
                  onTap: () {},
                ),
                NotificationCard(
                  title: 'Lamaran baru di terima',
                  description:
                      'Rizki mengambil pekerjaan dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.jobApplication, // Green briefcase
                  isUnread: true,
                  onTap: () {},
                ),
                NotificationCard(
                  title: 'Barang Bekas',
                  description:
                      'Rizki mengikuti pekerjaan dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.usedGoods, // Pink/purple archive
                  isUnread: false,
                  onTap: () {},
                ),
                NotificationCard(
                  title: 'Pelatihan terbaru',
                  description:
                      'Rizki mengambil pekerjaan dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.training, // Blue document
                  isUnread: false,
                  onTap: () {},
                ),
                NotificationCard(
                  title: 'Lamaran baru di terima',
                  description:
                      'Rizki mengambil pekerjaan dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.jobApplication,
                  isUnread: false,
                  onTap: () {},
                ),
                NotificationCard(
                  title: 'Pekerja',
                  description:
                      'Rizki merekrut pekerja dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.worker,
                  isUnread: false,
                  onTap: () {},
                ),
                NotificationCard(
                  title: 'Pekerja',
                  description:
                      'Rizki merekrut pekerja dari id iklan 24/11/2024/023 323111',
                  timeText: '04:00-11:00',
                  type: NotificationType.worker,
                  isUnread: false,
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'Notifikasi', // Changed from News to Notifikasi based on user feedback
        style: AppTypography.titleMedium.copyWith(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
