import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'profile_state.freezed.dart';

/// Status lifecycle untuk [ProfileCubit].
enum ProfileStatus { initial, loading, success, failure }

/// State immutable untuk halaman Profile.
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.initial) ProfileStatus status,
    UserProfileSummary? summary,
    String? errorMessage,

    /// True saat upload foto profil sedang berlangsung.
    /// Digunakan untuk menampilkan loading overlay pada avatar.
    @Default(false) bool isUploadingPhoto,

    /// Pesan error saat upload foto gagal (null jika tidak ada error).
    String? uploadPhotoError,
  }) = _ProfileState;

  const ProfileState._();
}

extension ProfileStateX on ProfileState {
  bool get isLoading => status == ProfileStatus.loading;
  bool get isSuccess => status == ProfileStatus.success;
  bool get isFailure => status == ProfileStatus.failure;
}
