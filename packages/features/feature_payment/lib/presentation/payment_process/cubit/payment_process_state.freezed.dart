// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_process_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentProcessState {

 File? get proofImage; bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of PaymentProcessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentProcessStateCopyWith<PaymentProcessState> get copyWith => _$PaymentProcessStateCopyWithImpl<PaymentProcessState>(this as PaymentProcessState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentProcessState&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,proofImage,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'PaymentProcessState(proofImage: $proofImage, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentProcessStateCopyWith<$Res>  {
  factory $PaymentProcessStateCopyWith(PaymentProcessState value, $Res Function(PaymentProcessState) _then) = _$PaymentProcessStateCopyWithImpl;
@useResult
$Res call({
 File? proofImage, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$PaymentProcessStateCopyWithImpl<$Res>
    implements $PaymentProcessStateCopyWith<$Res> {
  _$PaymentProcessStateCopyWithImpl(this._self, this._then);

  final PaymentProcessState _self;
  final $Res Function(PaymentProcessState) _then;

/// Create a copy of PaymentProcessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? proofImage = freezed,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as File?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentProcessState].
extension PaymentProcessStatePatterns on PaymentProcessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentProcessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentProcessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentProcessState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentProcessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentProcessState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentProcessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File? proofImage,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentProcessState() when $default != null:
return $default(_that.proofImage,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File? proofImage,  bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PaymentProcessState():
return $default(_that.proofImage,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File? proofImage,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaymentProcessState() when $default != null:
return $default(_that.proofImage,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentProcessState implements PaymentProcessState {
  const _PaymentProcessState({this.proofImage, this.isSubmitting = false, this.isSuccess = false, this.errorMessage});
  

@override final  File? proofImage;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of PaymentProcessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentProcessStateCopyWith<_PaymentProcessState> get copyWith => __$PaymentProcessStateCopyWithImpl<_PaymentProcessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentProcessState&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,proofImage,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'PaymentProcessState(proofImage: $proofImage, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentProcessStateCopyWith<$Res> implements $PaymentProcessStateCopyWith<$Res> {
  factory _$PaymentProcessStateCopyWith(_PaymentProcessState value, $Res Function(_PaymentProcessState) _then) = __$PaymentProcessStateCopyWithImpl;
@override @useResult
$Res call({
 File? proofImage, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$PaymentProcessStateCopyWithImpl<$Res>
    implements _$PaymentProcessStateCopyWith<$Res> {
  __$PaymentProcessStateCopyWithImpl(this._self, this._then);

  final _PaymentProcessState _self;
  final $Res Function(_PaymentProcessState) _then;

/// Create a copy of PaymentProcessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? proofImage = freezed,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_PaymentProcessState(
proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as File?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
