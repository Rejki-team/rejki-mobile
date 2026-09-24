// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobDetailState {

/// Current job data
 JobEntity? get job;/// Loading state
 bool get isLoading;/// Error message if any
 String? get errorMessage;/// Agregasi rating pemberi kerja (F-17, PRD §5.15) — `null` selagi belum
/// selesai fetch atau `job.userId` kosong; tidak memblokir `isSuccess`.
 RatingAggregateEntity? get employerRating;
/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDetailStateCopyWith<JobDetailState> get copyWith => _$JobDetailStateCopyWithImpl<JobDetailState>(this as JobDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDetailState&&(identical(other.job, job) || other.job == job)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.employerRating, employerRating) || other.employerRating == employerRating));
}


@override
int get hashCode => Object.hash(runtimeType,job,isLoading,errorMessage,employerRating);

@override
String toString() {
  return 'JobDetailState(job: $job, isLoading: $isLoading, errorMessage: $errorMessage, employerRating: $employerRating)';
}


}

/// @nodoc
abstract mixin class $JobDetailStateCopyWith<$Res>  {
  factory $JobDetailStateCopyWith(JobDetailState value, $Res Function(JobDetailState) _then) = _$JobDetailStateCopyWithImpl;
@useResult
$Res call({
 JobEntity? job, bool isLoading, String? errorMessage, RatingAggregateEntity? employerRating
});


$JobEntityCopyWith<$Res>? get job;$RatingAggregateEntityCopyWith<$Res>? get employerRating;

}
/// @nodoc
class _$JobDetailStateCopyWithImpl<$Res>
    implements $JobDetailStateCopyWith<$Res> {
  _$JobDetailStateCopyWithImpl(this._self, this._then);

  final JobDetailState _self;
  final $Res Function(JobDetailState) _then;

/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? job = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? employerRating = freezed,}) {
  return _then(_self.copyWith(
job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,employerRating: freezed == employerRating ? _self.employerRating : employerRating // ignore: cast_nullable_to_non_nullable
as RatingAggregateEntity?,
  ));
}
/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEntityCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobEntityCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingAggregateEntityCopyWith<$Res>? get employerRating {
    if (_self.employerRating == null) {
    return null;
  }

  return $RatingAggregateEntityCopyWith<$Res>(_self.employerRating!, (value) {
    return _then(_self.copyWith(employerRating: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobDetailState].
extension JobDetailStatePatterns on JobDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobDetailState value)  $default,){
final _that = this;
switch (_that) {
case _JobDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _JobDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JobEntity? job,  bool isLoading,  String? errorMessage,  RatingAggregateEntity? employerRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobDetailState() when $default != null:
return $default(_that.job,_that.isLoading,_that.errorMessage,_that.employerRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JobEntity? job,  bool isLoading,  String? errorMessage,  RatingAggregateEntity? employerRating)  $default,) {final _that = this;
switch (_that) {
case _JobDetailState():
return $default(_that.job,_that.isLoading,_that.errorMessage,_that.employerRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JobEntity? job,  bool isLoading,  String? errorMessage,  RatingAggregateEntity? employerRating)?  $default,) {final _that = this;
switch (_that) {
case _JobDetailState() when $default != null:
return $default(_that.job,_that.isLoading,_that.errorMessage,_that.employerRating);case _:
  return null;

}
}

}

/// @nodoc


class _JobDetailState extends JobDetailState {
  const _JobDetailState({this.job, this.isLoading = false, this.errorMessage, this.employerRating}): super._();
  

/// Current job data
@override final  JobEntity? job;
/// Loading state
@override@JsonKey() final  bool isLoading;
/// Error message if any
@override final  String? errorMessage;
/// Agregasi rating pemberi kerja (F-17, PRD §5.15) — `null` selagi belum
/// selesai fetch atau `job.userId` kosong; tidak memblokir `isSuccess`.
@override final  RatingAggregateEntity? employerRating;

/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobDetailStateCopyWith<_JobDetailState> get copyWith => __$JobDetailStateCopyWithImpl<_JobDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobDetailState&&(identical(other.job, job) || other.job == job)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.employerRating, employerRating) || other.employerRating == employerRating));
}


@override
int get hashCode => Object.hash(runtimeType,job,isLoading,errorMessage,employerRating);

@override
String toString() {
  return 'JobDetailState(job: $job, isLoading: $isLoading, errorMessage: $errorMessage, employerRating: $employerRating)';
}


}

/// @nodoc
abstract mixin class _$JobDetailStateCopyWith<$Res> implements $JobDetailStateCopyWith<$Res> {
  factory _$JobDetailStateCopyWith(_JobDetailState value, $Res Function(_JobDetailState) _then) = __$JobDetailStateCopyWithImpl;
@override @useResult
$Res call({
 JobEntity? job, bool isLoading, String? errorMessage, RatingAggregateEntity? employerRating
});


@override $JobEntityCopyWith<$Res>? get job;@override $RatingAggregateEntityCopyWith<$Res>? get employerRating;

}
/// @nodoc
class __$JobDetailStateCopyWithImpl<$Res>
    implements _$JobDetailStateCopyWith<$Res> {
  __$JobDetailStateCopyWithImpl(this._self, this._then);

  final _JobDetailState _self;
  final $Res Function(_JobDetailState) _then;

/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? job = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? employerRating = freezed,}) {
  return _then(_JobDetailState(
job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,employerRating: freezed == employerRating ? _self.employerRating : employerRating // ignore: cast_nullable_to_non_nullable
as RatingAggregateEntity?,
  ));
}

/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEntityCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobEntityCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of JobDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingAggregateEntityCopyWith<$Res>? get employerRating {
    if (_self.employerRating == null) {
    return null;
  }

  return $RatingAggregateEntityCopyWith<$Res>(_self.employerRating!, (value) {
    return _then(_self.copyWith(employerRating: value));
  });
}
}

// dart format on
