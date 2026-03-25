// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerDetailState {

 bool get isLoading; bool get isFailure; String? get errorMessage; WorkerDetailModel? get worker;
/// Create a copy of WorkerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerDetailStateCopyWith<WorkerDetailState> get copyWith => _$WorkerDetailStateCopyWithImpl<WorkerDetailState>(this as WorkerDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.worker, worker) || other.worker == worker));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFailure,errorMessage,worker);

@override
String toString() {
  return 'WorkerDetailState(isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, worker: $worker)';
}


}

/// @nodoc
abstract mixin class $WorkerDetailStateCopyWith<$Res>  {
  factory $WorkerDetailStateCopyWith(WorkerDetailState value, $Res Function(WorkerDetailState) _then) = _$WorkerDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isFailure, String? errorMessage, WorkerDetailModel? worker
});


$WorkerDetailModelCopyWith<$Res>? get worker;

}
/// @nodoc
class _$WorkerDetailStateCopyWithImpl<$Res>
    implements $WorkerDetailStateCopyWith<$Res> {
  _$WorkerDetailStateCopyWithImpl(this._self, this._then);

  final WorkerDetailState _self;
  final $Res Function(WorkerDetailState) _then;

/// Create a copy of WorkerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? worker = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,worker: freezed == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as WorkerDetailModel?,
  ));
}
/// Create a copy of WorkerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerDetailModelCopyWith<$Res>? get worker {
    if (_self.worker == null) {
    return null;
  }

  return $WorkerDetailModelCopyWith<$Res>(_self.worker!, (value) {
    return _then(_self.copyWith(worker: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkerDetailState].
extension WorkerDetailStatePatterns on WorkerDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerDetailState value)  $default,){
final _that = this;
switch (_that) {
case _WorkerDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isFailure,  String? errorMessage,  WorkerDetailModel? worker)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerDetailState() when $default != null:
return $default(_that.isLoading,_that.isFailure,_that.errorMessage,_that.worker);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isFailure,  String? errorMessage,  WorkerDetailModel? worker)  $default,) {final _that = this;
switch (_that) {
case _WorkerDetailState():
return $default(_that.isLoading,_that.isFailure,_that.errorMessage,_that.worker);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isFailure,  String? errorMessage,  WorkerDetailModel? worker)?  $default,) {final _that = this;
switch (_that) {
case _WorkerDetailState() when $default != null:
return $default(_that.isLoading,_that.isFailure,_that.errorMessage,_that.worker);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerDetailState implements WorkerDetailState {
  const _WorkerDetailState({this.isLoading = true, this.isFailure = false, this.errorMessage, this.worker});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFailure;
@override final  String? errorMessage;
@override final  WorkerDetailModel? worker;

/// Create a copy of WorkerDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerDetailStateCopyWith<_WorkerDetailState> get copyWith => __$WorkerDetailStateCopyWithImpl<_WorkerDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.worker, worker) || other.worker == worker));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFailure,errorMessage,worker);

@override
String toString() {
  return 'WorkerDetailState(isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, worker: $worker)';
}


}

/// @nodoc
abstract mixin class _$WorkerDetailStateCopyWith<$Res> implements $WorkerDetailStateCopyWith<$Res> {
  factory _$WorkerDetailStateCopyWith(_WorkerDetailState value, $Res Function(_WorkerDetailState) _then) = __$WorkerDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isFailure, String? errorMessage, WorkerDetailModel? worker
});


@override $WorkerDetailModelCopyWith<$Res>? get worker;

}
/// @nodoc
class __$WorkerDetailStateCopyWithImpl<$Res>
    implements _$WorkerDetailStateCopyWith<$Res> {
  __$WorkerDetailStateCopyWithImpl(this._self, this._then);

  final _WorkerDetailState _self;
  final $Res Function(_WorkerDetailState) _then;

/// Create a copy of WorkerDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? worker = freezed,}) {
  return _then(_WorkerDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,worker: freezed == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as WorkerDetailModel?,
  ));
}

/// Create a copy of WorkerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerDetailModelCopyWith<$Res>? get worker {
    if (_self.worker == null) {
    return null;
  }

  return $WorkerDetailModelCopyWith<$Res>(_self.worker!, (value) {
    return _then(_self.copyWith(worker: value));
  });
}
}

// dart format on
