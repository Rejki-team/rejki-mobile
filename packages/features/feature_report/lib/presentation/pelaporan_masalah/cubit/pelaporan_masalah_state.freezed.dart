// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pelaporan_masalah_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PelaporanMasalahState {

 File? get buktiImage; String get deskripsi; bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of PelaporanMasalahState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PelaporanMasalahStateCopyWith<PelaporanMasalahState> get copyWith => _$PelaporanMasalahStateCopyWithImpl<PelaporanMasalahState>(this as PelaporanMasalahState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PelaporanMasalahState&&(identical(other.buktiImage, buktiImage) || other.buktiImage == buktiImage)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,buktiImage,deskripsi,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'PelaporanMasalahState(buktiImage: $buktiImage, deskripsi: $deskripsi, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PelaporanMasalahStateCopyWith<$Res>  {
  factory $PelaporanMasalahStateCopyWith(PelaporanMasalahState value, $Res Function(PelaporanMasalahState) _then) = _$PelaporanMasalahStateCopyWithImpl;
@useResult
$Res call({
 File? buktiImage, String deskripsi, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$PelaporanMasalahStateCopyWithImpl<$Res>
    implements $PelaporanMasalahStateCopyWith<$Res> {
  _$PelaporanMasalahStateCopyWithImpl(this._self, this._then);

  final PelaporanMasalahState _self;
  final $Res Function(PelaporanMasalahState) _then;

/// Create a copy of PelaporanMasalahState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buktiImage = freezed,Object? deskripsi = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
buktiImage: freezed == buktiImage ? _self.buktiImage : buktiImage // ignore: cast_nullable_to_non_nullable
as File?,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PelaporanMasalahState].
extension PelaporanMasalahStatePatterns on PelaporanMasalahState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PelaporanMasalahState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PelaporanMasalahState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PelaporanMasalahState value)  $default,){
final _that = this;
switch (_that) {
case _PelaporanMasalahState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PelaporanMasalahState value)?  $default,){
final _that = this;
switch (_that) {
case _PelaporanMasalahState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File? buktiImage,  String deskripsi,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PelaporanMasalahState() when $default != null:
return $default(_that.buktiImage,_that.deskripsi,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File? buktiImage,  String deskripsi,  bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PelaporanMasalahState():
return $default(_that.buktiImage,_that.deskripsi,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File? buktiImage,  String deskripsi,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PelaporanMasalahState() when $default != null:
return $default(_that.buktiImage,_that.deskripsi,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PelaporanMasalahState implements PelaporanMasalahState {
  const _PelaporanMasalahState({this.buktiImage, this.deskripsi = '', this.isSubmitting = false, this.isSuccess = false, this.errorMessage});
  

@override final  File? buktiImage;
@override@JsonKey() final  String deskripsi;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of PelaporanMasalahState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PelaporanMasalahStateCopyWith<_PelaporanMasalahState> get copyWith => __$PelaporanMasalahStateCopyWithImpl<_PelaporanMasalahState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PelaporanMasalahState&&(identical(other.buktiImage, buktiImage) || other.buktiImage == buktiImage)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,buktiImage,deskripsi,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'PelaporanMasalahState(buktiImage: $buktiImage, deskripsi: $deskripsi, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PelaporanMasalahStateCopyWith<$Res> implements $PelaporanMasalahStateCopyWith<$Res> {
  factory _$PelaporanMasalahStateCopyWith(_PelaporanMasalahState value, $Res Function(_PelaporanMasalahState) _then) = __$PelaporanMasalahStateCopyWithImpl;
@override @useResult
$Res call({
 File? buktiImage, String deskripsi, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$PelaporanMasalahStateCopyWithImpl<$Res>
    implements _$PelaporanMasalahStateCopyWith<$Res> {
  __$PelaporanMasalahStateCopyWithImpl(this._self, this._then);

  final _PelaporanMasalahState _self;
  final $Res Function(_PelaporanMasalahState) _then;

/// Create a copy of PelaporanMasalahState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buktiImage = freezed,Object? deskripsi = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_PelaporanMasalahState(
buktiImage: freezed == buktiImage ? _self.buktiImage : buktiImage // ignore: cast_nullable_to_non_nullable
as File?,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
