import 'dart:async';

import 'package:feature_notification/feature_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import '../router/app_routes.dart';
import '../services/fcm_notification_service.dart';

enum NavTab { home, news, chat, history, profile }

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late final NotificationCubit _notificationCubit;
  StreamSubscription<dynamic>? _fcmSubscription;

  @override
  void initState() {
    super.initState();
    _notificationCubit = GetIt.I<NotificationCubit>();
    _notificationCubit.refreshUnreadCount();

    // Listen foreground FCM messages → refresh unread count badge
    if (GetIt.I.isRegistered<FcmNotificationService>()) {
      _fcmSubscription = GetIt.I<FcmNotificationService>()
          .foregroundMessageStream
          .listen((_) => _notificationCubit.refreshUnreadCount());
    }
  }

  @override
  void dispose() {
    _fcmSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _notificationCubit,
      child: BlocSelector<NotificationCubit, NotificationState, int>(
        selector: (state) => state.unreadCount,
        builder: (context, unreadCount) {
          return Scaffold(
            body: widget.child,
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: _calculateSelectedIndex(context),
              items: [
                BottomNavItem(
                  activeIcon: AppAssets.iconHomeFilled,
                  inactiveIcon: AppAssets.iconHomeOutlined,
                  label: 'Home',
                  badgeCount: unreadCount,
                ),
                const BottomNavItem(
                  activeIcon: AppAssets.iconTodoFilled,
                  inactiveIcon: AppAssets.iconTodoOutlined,
                  label: 'News',
                ),
                const BottomNavItem(
                  activeIcon: AppAssets.iconMessageFilled,
                  inactiveIcon: AppAssets.iconMessageOutlined,
                  label: 'Chat',
                ),
                const BottomNavItem(
                  activeIcon: AppAssets.iconPaperFilled,
                  inactiveIcon: AppAssets.iconPaperOutlined,
                  label: 'History',
                ),
                const BottomNavItem(
                  activeIcon: AppAssets.iconProfileFilled,
                  inactiveIcon: AppAssets.iconProfileOutlined,
                  label: 'Profile',
                ),
              ],
              onItemSelected: (index) => _onItemTapped(context, index),
            ),
          );
        },
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.home)) return NavTab.home.index;
    if (location.startsWith(AppRoutes.news)) return NavTab.news.index;
    if (location.startsWith(AppRoutes.chat)) return NavTab.chat.index;
    if (location.startsWith(AppRoutes.history)) return NavTab.history.index;
    if (location.startsWith(AppRoutes.profile)) return NavTab.profile.index;
    return NavTab.home.index;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (NavTab.values[index]) {
      case NavTab.home:
        context.go(AppRoutes.home);
      case NavTab.news:
        context.go(AppRoutes.news);
      case NavTab.chat:
        context.go(AppRoutes.chat);
      case NavTab.history:
        context.go(AppRoutes.history);
      case NavTab.profile:
        context.go(AppRoutes.profile);
    }
  }
}
