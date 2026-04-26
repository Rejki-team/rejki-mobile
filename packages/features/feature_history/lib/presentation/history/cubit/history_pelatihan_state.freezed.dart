// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_pelatihan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryPelatihanState {

 HistoryPelatihanStatus get status; List<TrainingEnrollmentEntity> get enrollments; bool get hasNext; int get currentPage; String? get errorMessage;
/// Create a copy of HistoryPelatihanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryPelatihanStateCopyWith<HistoryPelatihanState> get copyWith => _$HistoryPelatihanStateCopyWithImpl<HistoryPelatihanState>(this as HistoryPelatihanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryPelatihanState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.enrollments, enrollments)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(enrollments),hasNext,currentPage,errorMessage);

@override
String toString() {
  return 'HistoryPelatihanState(status: $status, enrollments: $enrollments, hasNext: $hasNext, currentPage: $currentPage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryPelatihanStateCopyWith<$Res>  {
  factory $HistoryPelatihanStateCopyWith(HistoryPelatihanState value, $Res Function(HistoryPelatihanState) _then) = _$HistoryPelatihanStateCopyWithImpl;
@useResult
$Res call({
 HistoryPelatihanStatus status, List<TrainingEnrollmentEntity> enrollments, bool hasNext, int currentPage, String? errorMessage
});




}
/// @nodoc
class _$HistoryPelatihanStateCopyWithImpl<$Res>
    implements $HistoryPelatihanStateCopyWith<$Res> {
  _$HistoryPelatihanStateCopyWithImpl(this._self, this._then);

  final HistoryPelatihanState _self;
  final $Res Function(HistoryPelatihanState) _then;

/// Create a copy of HistoryPelatihanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? enrollments = null,Object? hasNext = null,Object? currentPage = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryPelatihanStatus,enrollments: null == enrollments ? _self.enrollments : enrollments // ignore: cast_nullable_to_non_nullable
as List<TrainingEnrollmentEntity>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryPelatihanState].
extension HistoryPelatihanStatePatterns on HistoryPelatihanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryPelatihanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryPelatihanState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryPelatihanState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryPelatihanState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryPelatihanState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryPelatihanState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryPelatihanStatus status,  List<TrainingEnrollmentEntity> enrollments,  bool hasNext,  int currentPage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryPelatihanState() when $default != null:
return $default(_that.status,_that.enrollments,_that.hasNext,_that.currentPage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryPelatihanStatus status,  List<TrainingEnrollmentEntity> enrollments,  bool hasNext,  int currentPage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryPelatihanState():
return $default(_that.status,_that.enrollments,_that.hasNext,_that.currentPage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryPelatihanStatus status,  List<TrainingEnrollmentEntity> enrollments,  bool hasNext,  int currentPage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryPelatihanState() when $default != null:
return $default(_that.status,_that.enrollments,_that.hasNext,_that.currentPage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryPelatihanState implements HistoryPelatihanState {
  const _HistoryPelatihanState({this.status = HistoryPelatihanStatus.initial, final  List<TrainingEnrollmentEntity> enrollments = const [], this.hasNext = false, this.currentPage = 1, this.errorMessage}): _enrollments = enrollments;
  

@override@JsonKey() final  HistoryPelatihanStatus status;
 final  List<TrainingEnrollmentEntity> _enrollments;
@override@JsonKey() List<TrainingEnrollmentEntity> get enrollments {
  if (_enrollments is EqualUnmodifiableListView) return _enrollments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enrollments);
}

@override@JsonKey() final  bool hasNext;
@override@JsonKey() final  int currentPage;
@override final  String? errorMessage;

/// Create a copy of HistoryPelatihanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryPelatihanStateCopyWith<_HistoryPelatihanState> get copyWith => __$HistoryPelatihanStateCopyWithImpl<_HistoryPelatihanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryPelatihanState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._enrollments, _enrollments)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_enrollments),hasNext,currentPage,errorMessage);

@override
String toString() {
  return 'HistoryPelatihanState(status: $status, enrollments: $enrollments, hasNext: $hasNext, currentPage: $currentPage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryPelatihanStateCopyWith<$Res> implements $HistoryPelatihanStateCopyWith<$Res> {
  factory _$HistoryPelatihanStateCopyWith(_HistoryPelatihanState value, $Res Function(_HistoryPelatihanState) _then) = __$HistoryPelatihanStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryPelatihanStatus status, List<TrainingEnrollmentEntity> enrollments, bool hasNext, int currentPage, String? errorMessage
});




}
/// @nodoc
class __$HistoryPelatihanStateCopyWithImpl<$Res>
    implements _$HistoryPelatihanStateCopyWith<$Res> {
  __$HistoryPelatihanStateCopyWithImpl(this._self, this._then);

  final _HistoryPelatihanState _self;
  final $Res Function(_HistoryPelatihanState) _then;

/// Create a copy of HistoryPelatihanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? enrollments = null,Object? hasNext = null,Object? currentPage = null,Object? errorMessage = freezed,}) {
  return _then(_HistoryPelatihanState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryPelatihanStatus,enrollments: null == enrollments ? _self._enrollments : enrollments // ignore: cast_nullable_to_non_nullable
as List<TrainingEnrollmentEntity>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
