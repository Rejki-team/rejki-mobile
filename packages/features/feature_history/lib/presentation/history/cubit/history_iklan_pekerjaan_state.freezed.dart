// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_iklan_pekerjaan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryIklanPekerjaanState {

 HistoryIklanPekerjaanStatus get status; List<JobEntity> get jobs; int get page; bool get hasNext; String? get errorMessage;
/// Create a copy of HistoryIklanPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryIklanPekerjaanStateCopyWith<HistoryIklanPekerjaanState> get copyWith => _$HistoryIklanPekerjaanStateCopyWithImpl<HistoryIklanPekerjaanState>(this as HistoryIklanPekerjaanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryIklanPekerjaanState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.jobs, jobs)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(jobs),page,hasNext,errorMessage);

@override
String toString() {
  return 'HistoryIklanPekerjaanState(status: $status, jobs: $jobs, page: $page, hasNext: $hasNext, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryIklanPekerjaanStateCopyWith<$Res>  {
  factory $HistoryIklanPekerjaanStateCopyWith(HistoryIklanPekerjaanState value, $Res Function(HistoryIklanPekerjaanState) _then) = _$HistoryIklanPekerjaanStateCopyWithImpl;
@useResult
$Res call({
 HistoryIklanPekerjaanStatus status, List<JobEntity> jobs, int page, bool hasNext, String? errorMessage
});




}
/// @nodoc
class _$HistoryIklanPekerjaanStateCopyWithImpl<$Res>
    implements $HistoryIklanPekerjaanStateCopyWith<$Res> {
  _$HistoryIklanPekerjaanStateCopyWithImpl(this._self, this._then);

  final HistoryIklanPekerjaanState _self;
  final $Res Function(HistoryIklanPekerjaanState) _then;

/// Create a copy of HistoryIklanPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? jobs = null,Object? page = null,Object? hasNext = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryIklanPekerjaanStatus,jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryIklanPekerjaanState].
extension HistoryIklanPekerjaanStatePatterns on HistoryIklanPekerjaanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryIklanPekerjaanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryIklanPekerjaanState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryIklanPekerjaanState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryIklanPekerjaanState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryIklanPekerjaanState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryIklanPekerjaanState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryIklanPekerjaanStatus status,  List<JobEntity> jobs,  int page,  bool hasNext,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryIklanPekerjaanState() when $default != null:
return $default(_that.status,_that.jobs,_that.page,_that.hasNext,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryIklanPekerjaanStatus status,  List<JobEntity> jobs,  int page,  bool hasNext,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryIklanPekerjaanState():
return $default(_that.status,_that.jobs,_that.page,_that.hasNext,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryIklanPekerjaanStatus status,  List<JobEntity> jobs,  int page,  bool hasNext,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryIklanPekerjaanState() when $default != null:
return $default(_that.status,_that.jobs,_that.page,_that.hasNext,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryIklanPekerjaanState implements HistoryIklanPekerjaanState {
  const _HistoryIklanPekerjaanState({this.status = HistoryIklanPekerjaanStatus.initial, final  List<JobEntity> jobs = const [], this.page = 1, this.hasNext = true, this.errorMessage}): _jobs = jobs;
  

@override@JsonKey() final  HistoryIklanPekerjaanStatus status;
 final  List<JobEntity> _jobs;
@override@JsonKey() List<JobEntity> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasNext;
@override final  String? errorMessage;

/// Create a copy of HistoryIklanPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryIklanPekerjaanStateCopyWith<_HistoryIklanPekerjaanState> get copyWith => __$HistoryIklanPekerjaanStateCopyWithImpl<_HistoryIklanPekerjaanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryIklanPekerjaanState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_jobs),page,hasNext,errorMessage);

@override
String toString() {
  return 'HistoryIklanPekerjaanState(status: $status, jobs: $jobs, page: $page, hasNext: $hasNext, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryIklanPekerjaanStateCopyWith<$Res> implements $HistoryIklanPekerjaanStateCopyWith<$Res> {
  factory _$HistoryIklanPekerjaanStateCopyWith(_HistoryIklanPekerjaanState value, $Res Function(_HistoryIklanPekerjaanState) _then) = __$HistoryIklanPekerjaanStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryIklanPekerjaanStatus status, List<JobEntity> jobs, int page, bool hasNext, String? errorMessage
});




}
/// @nodoc
class __$HistoryIklanPekerjaanStateCopyWithImpl<$Res>
    implements _$HistoryIklanPekerjaanStateCopyWith<$Res> {
  __$HistoryIklanPekerjaanStateCopyWithImpl(this._self, this._then);

  final _HistoryIklanPekerjaanState _self;
  final $Res Function(_HistoryIklanPekerjaanState) _then;

/// Create a copy of HistoryIklanPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? jobs = null,Object? page = null,Object? hasNext = null,Object? errorMessage = freezed,}) {
  return _then(_HistoryIklanPekerjaanState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryIklanPekerjaanStatus,jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
