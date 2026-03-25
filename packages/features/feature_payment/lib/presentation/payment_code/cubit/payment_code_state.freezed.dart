// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentCodeState {

 bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of PaymentCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCodeStateCopyWith<PaymentCodeState> get copyWith => _$PaymentCodeStateCopyWithImpl<PaymentCodeState>(this as PaymentCodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCodeState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'PaymentCodeState(isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentCodeStateCopyWith<$Res>  {
  factory $PaymentCodeStateCopyWith(PaymentCodeState value, $Res Function(PaymentCodeState) _then) = _$PaymentCodeStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$PaymentCodeStateCopyWithImpl<$Res>
    implements $PaymentCodeStateCopyWith<$Res> {
  _$PaymentCodeStateCopyWithImpl(this._self, this._then);

  final PaymentCodeState _self;
  final $Res Function(PaymentCodeState) _then;

/// Create a copy of PaymentCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCodeState].
extension PaymentCodeStatePatterns on PaymentCodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCodeState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCodeState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCodeState() when $default != null:
return $default(_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PaymentCodeState():
return $default(_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCodeState() when $default != null:
return $default(_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentCodeState implements PaymentCodeState {
  const _PaymentCodeState({this.isSubmitting = false, this.isSuccess = false, this.errorMessage});
  

@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of PaymentCodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCodeStateCopyWith<_PaymentCodeState> get copyWith => __$PaymentCodeStateCopyWithImpl<_PaymentCodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCodeState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'PaymentCodeState(isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentCodeStateCopyWith<$Res> implements $PaymentCodeStateCopyWith<$Res> {
  factory _$PaymentCodeStateCopyWith(_PaymentCodeState value, $Res Function(_PaymentCodeState) _then) = __$PaymentCodeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$PaymentCodeStateCopyWithImpl<$Res>
    implements _$PaymentCodeStateCopyWith<$Res> {
  __$PaymentCodeStateCopyWithImpl(this._self, this._then);

  final _PaymentCodeState _self;
  final $Res Function(_PaymentCodeState) _then;

/// Create a copy of PaymentCodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_PaymentCodeState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
