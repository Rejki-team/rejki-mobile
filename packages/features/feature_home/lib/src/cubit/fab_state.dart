import 'package:freezed_annotation/freezed_annotation.dart';

part 'fab_state.freezed.dart';

/// FAB (Floating Action Button) State
///
/// Manages the state of the FAB menu (open/closed)
@freezed
abstract class FabState with _$FabState {
  const FabState._();

  const factory FabState({
    /// Whether the menu is currently open
    @Default(false) bool isMenuOpen,
  }) = _FabState;

  /// Initial state - menu closed
  factory FabState.initial() => const FabState();
}
