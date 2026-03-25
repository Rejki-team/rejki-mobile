// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_training_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitTrainingAdState {

 bool get isRequesting; bool get isSuccess; String? get errorMessage;
/// Create a copy of SubmitTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitTrainingAdStateCopyWith<SubmitTrainingAdState> get copyWith => _$SubmitTrainingAdStateCopyWithImpl<SubmitTrainingAdState>(this as SubmitTrainingAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitTrainingAdState&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isRequesting,isSuccess,errorMessage);

@override
String toString() {
  return 'SubmitTrainingAdState(isRequesting: $isRequesting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SubmitTrainingAdStateCopyWith<$Res>  {
  factory $SubmitTrainingAdStateCopyWith(SubmitTrainingAdState value, $Res Function(SubmitTrainingAdState) _then) = _$SubmitTrainingAdStateCopyWithImpl;
@useResult
$Res call({
 bool isRequesting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$SubmitTrainingAdStateCopyWithImpl<$Res>
    implements $SubmitTrainingAdStateCopyWith<$Res> {
  _$SubmitTrainingAdStateCopyWithImpl(this._self, this._then);

  final SubmitTrainingAdState _self;
  final $Res Function(SubmitTrainingAdState) _then;

/// Create a copy of SubmitTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRequesting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitTrainingAdState].
extension SubmitTrainingAdStatePatterns on SubmitTrainingAdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitTrainingAdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitTrainingAdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitTrainingAdState value)  $default,){
final _that = this;
switch (_that) {
case _SubmitTrainingAdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitTrainingAdState value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitTrainingAdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isRequesting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitTrainingAdState() when $default != null:
return $default(_that.isRequesting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isRequesting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SubmitTrainingAdState():
return $default(_that.isRequesting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isRequesting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SubmitTrainingAdState() when $default != null:
return $default(_that.isRequesting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SubmitTrainingAdState implements SubmitTrainingAdState {
  const _SubmitTrainingAdState({this.isRequesting = false, this.isSuccess = false, this.errorMessage});
  

@override@JsonKey() final  bool isRequesting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of SubmitTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitTrainingAdStateCopyWith<_SubmitTrainingAdState> get copyWith => __$SubmitTrainingAdStateCopyWithImpl<_SubmitTrainingAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitTrainingAdState&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isRequesting,isSuccess,errorMessage);

@override
String toString() {
  return 'SubmitTrainingAdState(isRequesting: $isRequesting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SubmitTrainingAdStateCopyWith<$Res> implements $SubmitTrainingAdStateCopyWith<$Res> {
  factory _$SubmitTrainingAdStateCopyWith(_SubmitTrainingAdState value, $Res Function(_SubmitTrainingAdState) _then) = __$SubmitTrainingAdStateCopyWithImpl;
@override @useResult
$Res call({
 bool isRequesting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$SubmitTrainingAdStateCopyWithImpl<$Res>
    implements _$SubmitTrainingAdStateCopyWith<$Res> {
  __$SubmitTrainingAdStateCopyWithImpl(this._self, this._then);

  final _SubmitTrainingAdState _self;
  final $Res Function(_SubmitTrainingAdState) _then;

/// Create a copy of SubmitTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRequesting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_SubmitTrainingAdState(
isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
