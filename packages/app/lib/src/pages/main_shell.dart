import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import '../router/app_routes.dart';

/// Bottom Navigation indices
///
/// Sesuai dengan urutan di AppBottomNavBar:
/// Home, News, Chat, History, Profile
enum NavTab { home, news, chat, history, profile }

/// Main Shell dengan Bottom Navigation
///
/// Widget ini membungkus semua tab utama dengan AppBottomNavBar
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  /// Custom nav items sesuai dengan routes yang ada
  static const List<BottomNavItem> _navItems = [
    BottomNavItem(
      activeIcon: AppAssets.iconHomeFilled,
      inactiveIcon: AppAssets.iconHomeOutlined,
      label: 'Home',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconTodoFilled,
      inactiveIcon: AppAssets.iconTodoOutlined,
      label: 'News',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconMessageFilled,
      inactiveIcon: AppAssets.iconMessageOutlined,
      label: 'Chat',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconPaperFilled,
      inactiveIcon: AppAssets.iconPaperOutlined,
      label: 'History',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconProfileFilled,
      inactiveIcon: AppAssets.iconProfileOutlined,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _calculateSelectedIndex(context),
        items: _navItems,
        onItemSelected: (index) => _onItemTapped(context, index),
      ),
    );
  }

  /// Menentukan index yang aktif berdasarkan route saat ini
  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;

    if (location.startsWith(AppRoutes.home)) {
      return NavTab.home.index;
    }
    if (location.startsWith(AppRoutes.news)) {
      return NavTab.news.index;
    }
    if (location.startsWith(AppRoutes.chat)) {
      return NavTab.chat.index;
    }
    if (location.startsWith(AppRoutes.history)) {
      return NavTab.history.index;
    }
    if (location.startsWith(AppRoutes.profile)) {
      return NavTab.profile.index;
    }

    return NavTab.home.index;
  }

  /// Handle tap pada navigation item
  void _onItemTapped(BuildContext context, int index) {
    switch (NavTab.values[index]) {
      case NavTab.home:
        context.go(AppRoutes.home);
      case NavTab.news:
        // Navigate to news (nested under home atau separate route)
        context.go(AppRoutes.news);
      case NavTab.chat:
        context.go(AppRoutes.chat);
      case NavTab.history:
        // Navigate to history (nested under profile atau separate route)
        context.go(AppRoutes.history);
      case NavTab.profile:
        context.go(AppRoutes.profile);
    }
  }
}
