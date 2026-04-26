// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_iklan_pekerja_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryIklanPekerjaState {

 HistoryIklanPekerjaStatus get status; WorkerEntity? get workerProfile; String? get errorMessage;
/// Create a copy of HistoryIklanPekerjaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryIklanPekerjaStateCopyWith<HistoryIklanPekerjaState> get copyWith => _$HistoryIklanPekerjaStateCopyWithImpl<HistoryIklanPekerjaState>(this as HistoryIklanPekerjaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryIklanPekerjaState&&(identical(other.status, status) || other.status == status)&&(identical(other.workerProfile, workerProfile) || other.workerProfile == workerProfile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,workerProfile,errorMessage);

@override
String toString() {
  return 'HistoryIklanPekerjaState(status: $status, workerProfile: $workerProfile, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryIklanPekerjaStateCopyWith<$Res>  {
  factory $HistoryIklanPekerjaStateCopyWith(HistoryIklanPekerjaState value, $Res Function(HistoryIklanPekerjaState) _then) = _$HistoryIklanPekerjaStateCopyWithImpl;
@useResult
$Res call({
 HistoryIklanPekerjaStatus status, WorkerEntity? workerProfile, String? errorMessage
});


$WorkerEntityCopyWith<$Res>? get workerProfile;

}
/// @nodoc
class _$HistoryIklanPekerjaStateCopyWithImpl<$Res>
    implements $HistoryIklanPekerjaStateCopyWith<$Res> {
  _$HistoryIklanPekerjaStateCopyWithImpl(this._self, this._then);

  final HistoryIklanPekerjaState _self;
  final $Res Function(HistoryIklanPekerjaState) _then;

/// Create a copy of HistoryIklanPekerjaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? workerProfile = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryIklanPekerjaStatus,workerProfile: freezed == workerProfile ? _self.workerProfile : workerProfile // ignore: cast_nullable_to_non_nullable
as WorkerEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HistoryIklanPekerjaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<$Res>? get workerProfile {
    if (_self.workerProfile == null) {
    return null;
  }

  return $WorkerEntityCopyWith<$Res>(_self.workerProfile!, (value) {
    return _then(_self.copyWith(workerProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryIklanPekerjaState].
extension HistoryIklanPekerjaStatePatterns on HistoryIklanPekerjaState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryIklanPekerjaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryIklanPekerjaState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryIklanPekerjaState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryIklanPekerjaState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryIklanPekerjaState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryIklanPekerjaState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryIklanPekerjaStatus status,  WorkerEntity? workerProfile,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryIklanPekerjaState() when $default != null:
return $default(_that.status,_that.workerProfile,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryIklanPekerjaStatus status,  WorkerEntity? workerProfile,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryIklanPekerjaState():
return $default(_that.status,_that.workerProfile,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryIklanPekerjaStatus status,  WorkerEntity? workerProfile,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryIklanPekerjaState() when $default != null:
return $default(_that.status,_that.workerProfile,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryIklanPekerjaState implements HistoryIklanPekerjaState {
  const _HistoryIklanPekerjaState({this.status = HistoryIklanPekerjaStatus.initial, this.workerProfile, this.errorMessage});
  

@override@JsonKey() final  HistoryIklanPekerjaStatus status;
@override final  WorkerEntity? workerProfile;
@override final  String? errorMessage;

/// Create a copy of HistoryIklanPekerjaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryIklanPekerjaStateCopyWith<_HistoryIklanPekerjaState> get copyWith => __$HistoryIklanPekerjaStateCopyWithImpl<_HistoryIklanPekerjaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryIklanPekerjaState&&(identical(other.status, status) || other.status == status)&&(identical(other.workerProfile, workerProfile) || other.workerProfile == workerProfile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,workerProfile,errorMessage);

@override
String toString() {
  return 'HistoryIklanPekerjaState(status: $status, workerProfile: $workerProfile, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryIklanPekerjaStateCopyWith<$Res> implements $HistoryIklanPekerjaStateCopyWith<$Res> {
  factory _$HistoryIklanPekerjaStateCopyWith(_HistoryIklanPekerjaState value, $Res Function(_HistoryIklanPekerjaState) _then) = __$HistoryIklanPekerjaStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryIklanPekerjaStatus status, WorkerEntity? workerProfile, String? errorMessage
});


@override $WorkerEntityCopyWith<$Res>? get workerProfile;

}
/// @nodoc
class __$HistoryIklanPekerjaStateCopyWithImpl<$Res>
    implements _$HistoryIklanPekerjaStateCopyWith<$Res> {
  __$HistoryIklanPekerjaStateCopyWithImpl(this._self, this._then);

  final _HistoryIklanPekerjaState _self;
  final $Res Function(_HistoryIklanPekerjaState) _then;

/// Create a copy of HistoryIklanPekerjaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? workerProfile = freezed,Object? errorMessage = freezed,}) {
  return _then(_HistoryIklanPekerjaState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryIklanPekerjaStatus,workerProfile: freezed == workerProfile ? _self.workerProfile : workerProfile // ignore: cast_nullable_to_non_nullable
as WorkerEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HistoryIklanPekerjaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<$Res>? get workerProfile {
    if (_self.workerProfile == null) {
    return null;
  }

  return $WorkerEntityCopyWith<$Res>(_self.workerProfile!, (value) {
    return _then(_self.copyWith(workerProfile: value));
  });
}
}

// dart format on
