// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_iklan_pelatihan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryIklanPelatihanState {
  HistoryIklanPelatihanStatus get status;
  List<TrainingEntity> get trainings;
  int get page;
  bool get hasNext;
  String? get errorMessage;

  /// Create a copy of HistoryIklanPelatihanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryIklanPelatihanStateCopyWith<HistoryIklanPelatihanState> get copyWith =>
      _$HistoryIklanPelatihanStateCopyWithImpl<HistoryIklanPelatihanState>(
          this as HistoryIklanPelatihanState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryIklanPelatihanState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.trainings, trainings) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(trainings), page, hasNext, errorMessage);

  @override
  String toString() {
    return 'HistoryIklanPelatihanState(status: $status, trainings: $trainings, page: $page, hasNext: $hasNext, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $HistoryIklanPelatihanStateCopyWith<$Res> {
  factory $HistoryIklanPelatihanStateCopyWith(HistoryIklanPelatihanState value,
          $Res Function(HistoryIklanPelatihanState) _then) =
      _$HistoryIklanPelatihanStateCopyWithImpl;

  @useResult
  $Res call({
    HistoryIklanPelatihanStatus status,
    List<TrainingEntity> trainings,
    int page,
    bool hasNext,
    String? errorMessage,
  });
}

/// @nodoc
class _$HistoryIklanPelatihanStateCopyWithImpl<$Res>
    implements $HistoryIklanPelatihanStateCopyWith<$Res> {
  _$HistoryIklanPelatihanStateCopyWithImpl(this._self, this._then);

  final HistoryIklanPelatihanState _self;
  final $Res Function(HistoryIklanPelatihanState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainings = null,
    Object? page = null,
    Object? hasNext = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status as HistoryIklanPelatihanStatus,
      trainings: null == trainings
          ? _self.trainings
          : trainings as List<TrainingEntity>,
      page: null == page ? _self.page : page as int,
      hasNext: null == hasNext ? _self.hasNext : hasNext as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

/// @nodoc
class _HistoryIklanPelatihanState implements HistoryIklanPelatihanState {
  const _HistoryIklanPelatihanState({
    this.status = HistoryIklanPelatihanStatus.initial,
    final List<TrainingEntity> trainings = const [],
    this.page = 1,
    this.hasNext = true,
    this.errorMessage,
  }) : _trainings = trainings;

  @override
  @JsonKey()
  final HistoryIklanPelatihanStatus status;
  final List<TrainingEntity> _trainings;

  @override
  @JsonKey()
  List<TrainingEntity> get trainings {
    if (_trainings is EqualUnmodifiableListView) return _trainings;
    return EqualUnmodifiableListView(_trainings);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasNext;
  @override
  final String? errorMessage;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryIklanPelatihanStateCopyWith<_HistoryIklanPelatihanState>
      get copyWith =>
          __$HistoryIklanPelatihanStateCopyWithImpl<_HistoryIklanPelatihanState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryIklanPelatihanState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._trainings, _trainings) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_trainings), page, hasNext, errorMessage);

  @override
  String toString() {
    return 'HistoryIklanPelatihanState(status: $status, trainings: $trainings, page: $page, hasNext: $hasNext, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$HistoryIklanPelatihanStateCopyWith<$Res>
    implements $HistoryIklanPelatihanStateCopyWith<$Res> {
  factory _$HistoryIklanPelatihanStateCopyWith(_HistoryIklanPelatihanState value,
          $Res Function(_HistoryIklanPelatihanState) _then) =
      __$HistoryIklanPelatihanStateCopyWithImpl;

  @override
  @useResult
  $Res call({
    HistoryIklanPelatihanStatus status,
    List<TrainingEntity> trainings,
    int page,
    bool hasNext,
    String? errorMessage,
  });
}

/// @nodoc
class __$HistoryIklanPelatihanStateCopyWithImpl<$Res>
    implements _$HistoryIklanPelatihanStateCopyWith<$Res> {
  __$HistoryIklanPelatihanStateCopyWithImpl(this._self, this._then);

  final _HistoryIklanPelatihanState _self;
  final $Res Function(_HistoryIklanPelatihanState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? trainings = null,
    Object? page = null,
    Object? hasNext = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_HistoryIklanPelatihanState(
      status: null == status
          ? _self.status
          : status as HistoryIklanPelatihanStatus,
      trainings: null == trainings
          ? _self._trainings
          : trainings as List<TrainingEntity>,
      page: null == page ? _self.page : page as int,
      hasNext: null == hasNext ? _self.hasNext : hasNext as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

// dart format on
