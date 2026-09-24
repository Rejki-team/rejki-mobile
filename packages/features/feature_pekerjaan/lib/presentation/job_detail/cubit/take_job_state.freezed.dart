// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'take_job_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TakeJobState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakeJobState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakeJobState()';
}


}

/// @nodoc
class $TakeJobStateCopyWith<$Res>  {
$TakeJobStateCopyWith(TakeJobState _, $Res Function(TakeJobState) __);
}


/// Adds pattern-matching-related methods to [TakeJobState].
extension TakeJobStatePatterns on TakeJobState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _CheckingWorkerProfile value)?  checkingWorkerProfile,TResult Function( _WorkerProfileNotFound value)?  workerProfileNotFound,TResult Function( _WorkerProfileFound value)?  workerProfileFound,TResult Function( _Submitting value)?  submitting,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _CheckingWorkerProfile() when checkingWorkerProfile != null:
return checkingWorkerProfile(_that);case _WorkerProfileNotFound() when workerProfileNotFound != null:
return workerProfileNotFound(_that);case _WorkerProfileFound() when workerProfileFound != null:
return workerProfileFound(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _CheckingWorkerProfile value)  checkingWorkerProfile,required TResult Function( _WorkerProfileNotFound value)  workerProfileNotFound,required TResult Function( _WorkerProfileFound value)  workerProfileFound,required TResult Function( _Submitting value)  submitting,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _CheckingWorkerProfile():
return checkingWorkerProfile(_that);case _WorkerProfileNotFound():
return workerProfileNotFound(_that);case _WorkerProfileFound():
return workerProfileFound(_that);case _Submitting():
return submitting(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _CheckingWorkerProfile value)?  checkingWorkerProfile,TResult? Function( _WorkerProfileNotFound value)?  workerProfileNotFound,TResult? Function( _WorkerProfileFound value)?  workerProfileFound,TResult? Function( _Submitting value)?  submitting,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _CheckingWorkerProfile() when checkingWorkerProfile != null:
return checkingWorkerProfile(_that);case _WorkerProfileNotFound() when workerProfileNotFound != null:
return workerProfileNotFound(_that);case _WorkerProfileFound() when workerProfileFound != null:
return workerProfileFound(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  checkingWorkerProfile,TResult Function()?  workerProfileNotFound,TResult Function( DateTime? defaultDateTime)?  workerProfileFound,TResult Function()?  submitting,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _CheckingWorkerProfile() when checkingWorkerProfile != null:
return checkingWorkerProfile();case _WorkerProfileNotFound() when workerProfileNotFound != null:
return workerProfileNotFound();case _WorkerProfileFound() when workerProfileFound != null:
return workerProfileFound(_that.defaultDateTime);case _Submitting() when submitting != null:
return submitting();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  checkingWorkerProfile,required TResult Function()  workerProfileNotFound,required TResult Function( DateTime? defaultDateTime)  workerProfileFound,required TResult Function()  submitting,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _CheckingWorkerProfile():
return checkingWorkerProfile();case _WorkerProfileNotFound():
return workerProfileNotFound();case _WorkerProfileFound():
return workerProfileFound(_that.defaultDateTime);case _Submitting():
return submitting();case _Success():
return success();case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  checkingWorkerProfile,TResult? Function()?  workerProfileNotFound,TResult? Function( DateTime? defaultDateTime)?  workerProfileFound,TResult? Function()?  submitting,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _CheckingWorkerProfile() when checkingWorkerProfile != null:
return checkingWorkerProfile();case _WorkerProfileNotFound() when workerProfileNotFound != null:
return workerProfileNotFound();case _WorkerProfileFound() when workerProfileFound != null:
return workerProfileFound(_that.defaultDateTime);case _Submitting() when submitting != null:
return submitting();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TakeJobState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakeJobState.initial()';
}


}




/// @nodoc


class _CheckingWorkerProfile implements TakeJobState {
  const _CheckingWorkerProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckingWorkerProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakeJobState.checkingWorkerProfile()';
}


}




/// @nodoc


class _WorkerProfileNotFound implements TakeJobState {
  const _WorkerProfileNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerProfileNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakeJobState.workerProfileNotFound()';
}


}




/// @nodoc


class _WorkerProfileFound implements TakeJobState {
  const _WorkerProfileFound({required this.defaultDateTime});
  

 final  DateTime? defaultDateTime;

/// Create a copy of TakeJobState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerProfileFoundCopyWith<_WorkerProfileFound> get copyWith => __$WorkerProfileFoundCopyWithImpl<_WorkerProfileFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerProfileFound&&(identical(other.defaultDateTime, defaultDateTime) || other.defaultDateTime == defaultDateTime));
}


@override
int get hashCode => Object.hash(runtimeType,defaultDateTime);

@override
String toString() {
  return 'TakeJobState.workerProfileFound(defaultDateTime: $defaultDateTime)';
}


}

/// @nodoc
abstract mixin class _$WorkerProfileFoundCopyWith<$Res> implements $TakeJobStateCopyWith<$Res> {
  factory _$WorkerProfileFoundCopyWith(_WorkerProfileFound value, $Res Function(_WorkerProfileFound) _then) = __$WorkerProfileFoundCopyWithImpl;
@useResult
$Res call({
 DateTime? defaultDateTime
});




}
/// @nodoc
class __$WorkerProfileFoundCopyWithImpl<$Res>
    implements _$WorkerProfileFoundCopyWith<$Res> {
  __$WorkerProfileFoundCopyWithImpl(this._self, this._then);

  final _WorkerProfileFound _self;
  final $Res Function(_WorkerProfileFound) _then;

/// Create a copy of TakeJobState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? defaultDateTime = freezed,}) {
  return _then(_WorkerProfileFound(
defaultDateTime: freezed == defaultDateTime ? _self.defaultDateTime : defaultDateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _Submitting implements TakeJobState {
  const _Submitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakeJobState.submitting()';
}


}




/// @nodoc


class _Success implements TakeJobState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakeJobState.success()';
}


}




/// @nodoc


class _Failure implements TakeJobState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of TakeJobState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TakeJobState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $TakeJobStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of TakeJobState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
