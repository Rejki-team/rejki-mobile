// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_job_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BidJobParams {

/// The ID of the job being bid on
 String get jobId;/// The ID of the worker taking the job
 String get workerId;/// The agreed or default date/time for the job
/// Format: "2025-12-01 10:00:00"
 String get dateOfJob;
/// Create a copy of BidJobParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidJobParamsCopyWith<BidJobParams> get copyWith => _$BidJobParamsCopyWithImpl<BidJobParams>(this as BidJobParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidJobParams&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob));
}


@override
int get hashCode => Object.hash(runtimeType,jobId,workerId,dateOfJob);

@override
String toString() {
  return 'BidJobParams(jobId: $jobId, workerId: $workerId, dateOfJob: $dateOfJob)';
}


}

/// @nodoc
abstract mixin class $BidJobParamsCopyWith<$Res>  {
  factory $BidJobParamsCopyWith(BidJobParams value, $Res Function(BidJobParams) _then) = _$BidJobParamsCopyWithImpl;
@useResult
$Res call({
 String jobId, String workerId, String dateOfJob
});




}
/// @nodoc
class _$BidJobParamsCopyWithImpl<$Res>
    implements $BidJobParamsCopyWith<$Res> {
  _$BidJobParamsCopyWithImpl(this._self, this._then);

  final BidJobParams _self;
  final $Res Function(BidJobParams) _then;

/// Create a copy of BidJobParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? workerId = null,Object? dateOfJob = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BidJobParams].
extension BidJobParamsPatterns on BidJobParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BidJobParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BidJobParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BidJobParams value)  $default,){
final _that = this;
switch (_that) {
case _BidJobParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BidJobParams value)?  $default,){
final _that = this;
switch (_that) {
case _BidJobParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  String workerId,  String dateOfJob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BidJobParams() when $default != null:
return $default(_that.jobId,_that.workerId,_that.dateOfJob);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  String workerId,  String dateOfJob)  $default,) {final _that = this;
switch (_that) {
case _BidJobParams():
return $default(_that.jobId,_that.workerId,_that.dateOfJob);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  String workerId,  String dateOfJob)?  $default,) {final _that = this;
switch (_that) {
case _BidJobParams() when $default != null:
return $default(_that.jobId,_that.workerId,_that.dateOfJob);case _:
  return null;

}
}

}

/// @nodoc


class _BidJobParams implements BidJobParams {
  const _BidJobParams({required this.jobId, required this.workerId, required this.dateOfJob});
  

/// The ID of the job being bid on
@override final  String jobId;
/// The ID of the worker taking the job
@override final  String workerId;
/// The agreed or default date/time for the job
/// Format: "2025-12-01 10:00:00"
@override final  String dateOfJob;

/// Create a copy of BidJobParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BidJobParamsCopyWith<_BidJobParams> get copyWith => __$BidJobParamsCopyWithImpl<_BidJobParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BidJobParams&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob));
}


@override
int get hashCode => Object.hash(runtimeType,jobId,workerId,dateOfJob);

@override
String toString() {
  return 'BidJobParams(jobId: $jobId, workerId: $workerId, dateOfJob: $dateOfJob)';
}


}

/// @nodoc
abstract mixin class _$BidJobParamsCopyWith<$Res> implements $BidJobParamsCopyWith<$Res> {
  factory _$BidJobParamsCopyWith(_BidJobParams value, $Res Function(_BidJobParams) _then) = __$BidJobParamsCopyWithImpl;
@override @useResult
$Res call({
 String jobId, String workerId, String dateOfJob
});




}
/// @nodoc
class __$BidJobParamsCopyWithImpl<$Res>
    implements _$BidJobParamsCopyWith<$Res> {
  __$BidJobParamsCopyWithImpl(this._self, this._then);

  final _BidJobParams _self;
  final $Res Function(_BidJobParams) _then;

/// Create a copy of BidJobParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? workerId = null,Object? dateOfJob = null,}) {
  return _then(_BidJobParams(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
