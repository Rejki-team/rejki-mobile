import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'contact_request_state.freezed.dart';

enum ContactRequestStatus { initial, loading, loadingMore, success, failure }

enum ContactRequestMutationStatus { initial, loading, success, failure }

@freezed
abstract class ContactRequestState with _$ContactRequestState {
  const factory ContactRequestState({
    // ── Tab Permintaan (status=request) ───────────────────────────────────────
    @Default(ContactRequestStatus.initial)
    ContactRequestStatus permintaanStatus,
    @Default([]) List<IncomingContactEntity> permintaanList,
    @Default(1) int permintaanPage,
    @Default(true) bool permintaanHasNext,
    String? permintaanError,

    // ── Tab Diterima (status=approve) ─────────────────────────────────────────
    @Default(ContactRequestStatus.initial)
    ContactRequestStatus diterimaStatus,
    @Default([]) List<IncomingContactEntity> diterimaList,
    @Default(1) int diterimaPage,
    @Default(true) bool diterimaHasNext,
    String? diterimaError,

    // ── Mutation (Terima / Tolak) ─────────────────────────────────────────────
    @Default(ContactRequestMutationStatus.initial)
    ContactRequestMutationStatus mutationStatus,
    String? mutationSuccessMessage,
    String? mutationErrorMessage,
  }) = _ContactRequestState;
}
