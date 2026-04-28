// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daftar_pendaftar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DaftarPendaftarState {
  List<TrainingEnrollmentEntity> get enrollments;
  bool get isLoading;
  bool get isFailure;
  String? get errorMessage;

  /// Create a copy of DaftarPendaftarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DaftarPendaftarStateCopyWith<DaftarPendaftarState> get copyWith =>
      _$DaftarPendaftarStateCopyWithImpl<DaftarPendaftarState>(
          this as DaftarPendaftarState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DaftarPendaftarState &&
            const DeepCollectionEquality()
                .equals(other.enrollments, enrollments) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(enrollments),
      isLoading,
      isFailure,
      errorMessage);

  @override
  String toString() {
    return 'DaftarPendaftarState(enrollments: $enrollments, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $DaftarPendaftarStateCopyWith<$Res> {
  factory $DaftarPendaftarStateCopyWith(DaftarPendaftarState value,
          $Res Function(DaftarPendaftarState) _then) =
      _$DaftarPendaftarStateCopyWithImpl;

  @useResult
  $Res call({
    List<TrainingEnrollmentEntity> enrollments,
    bool isLoading,
    bool isFailure,
    String? errorMessage,
  });
}

/// @nodoc
class _$DaftarPendaftarStateCopyWithImpl<$Res>
    implements $DaftarPendaftarStateCopyWith<$Res> {
  _$DaftarPendaftarStateCopyWithImpl(this._self, this._then);

  final DaftarPendaftarState _self;
  final $Res Function(DaftarPendaftarState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollments = null,
    Object? isLoading = null,
    Object? isFailure = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      enrollments: null == enrollments
          ? _self.enrollments
          : enrollments as List<TrainingEnrollmentEntity>,
      isLoading: null == isLoading ? _self.isLoading : isLoading as bool,
      isFailure: null == isFailure ? _self.isFailure : isFailure as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

/// @nodoc
class _DaftarPendaftarState implements DaftarPendaftarState {
  const _DaftarPendaftarState({
    final List<TrainingEnrollmentEntity> enrollments = const [],
    this.isLoading = false,
    this.isFailure = false,
    this.errorMessage,
  }) : _enrollments = enrollments;

  final List<TrainingEnrollmentEntity> _enrollments;

  @override
  @JsonKey()
  List<TrainingEnrollmentEntity> get enrollments {
    if (_enrollments is EqualUnmodifiableListView) return _enrollments;
    return EqualUnmodifiableListView(_enrollments);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFailure;
  @override
  final String? errorMessage;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DaftarPendaftarStateCopyWith<_DaftarPendaftarState> get copyWith =>
      __$DaftarPendaftarStateCopyWithImpl<_DaftarPendaftarState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DaftarPendaftarState &&
            const DeepCollectionEquality()
                .equals(other._enrollments, _enrollments) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_enrollments),
      isLoading,
      isFailure,
      errorMessage);

  @override
  String toString() {
    return 'DaftarPendaftarState(enrollments: $enrollments, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$DaftarPendaftarStateCopyWith<$Res>
    implements $DaftarPendaftarStateCopyWith<$Res> {
  factory _$DaftarPendaftarStateCopyWith(_DaftarPendaftarState value,
          $Res Function(_DaftarPendaftarState) _then) =
      __$DaftarPendaftarStateCopyWithImpl;

  @override
  @useResult
  $Res call({
    List<TrainingEnrollmentEntity> enrollments,
    bool isLoading,
    bool isFailure,
    String? errorMessage,
  });
}

/// @nodoc
class __$DaftarPendaftarStateCopyWithImpl<$Res>
    implements _$DaftarPendaftarStateCopyWith<$Res> {
  __$DaftarPendaftarStateCopyWithImpl(this._self, this._then);

  final _DaftarPendaftarState _self;
  final $Res Function(_DaftarPendaftarState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollments = null,
    Object? isLoading = null,
    Object? isFailure = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_DaftarPendaftarState(
      enrollments: null == enrollments
          ? _self._enrollments
          : enrollments as List<TrainingEnrollmentEntity>,
      isLoading: null == isLoading ? _self.isLoading : isLoading as bool,
      isFailure: null == isFailure ? _self.isFailure : isFailure as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

// dart format on
