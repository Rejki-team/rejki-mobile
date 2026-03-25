import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fab_state.dart';

/// FAB (Floating Action Button) Cubit
///
/// Handles FAB menu state management using MVI pattern
class FabCubit extends Cubit<FabState> {
  FabCubit() : super(FabState.initial());

  /// Toggle the menu open/closed state
  void toggleMenu() {
    final newState = !state.isMenuOpen;
    debugPrint(
      'FAB toggleMenu - changing from ${state.isMenuOpen} to $newState',
    );
    emit(state.copyWith(isMenuOpen: newState));
  }

  /// Close the menu
  void closeMenu() {
    if (state.isMenuOpen) {
      debugPrint('FAB closeMenu');
      emit(state.copyWith(isMenuOpen: false));
    }
  }

  /// Open the menu
  void openMenu() {
    if (!state.isMenuOpen) {
      debugPrint('FAB openMenu');
      emit(state.copyWith(isMenuOpen: true));
    }
  }
}
