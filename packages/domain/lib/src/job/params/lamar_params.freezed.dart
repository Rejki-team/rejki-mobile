// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lamar_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LamarParams {

 String get iklanId; DateTime get tanggal;/// Format "HH:mm:ss" — sama dengan wire format backend (`chrono::NaiveTime`).
 String get jamMulai; String get jamAkhir; int get kuotaDiambil;
/// Create a copy of LamarParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LamarParamsCopyWith<LamarParams> get copyWith => _$LamarParamsCopyWithImpl<LamarParams>(this as LamarParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LamarParams&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.jamMulai, jamMulai) || other.jamMulai == jamMulai)&&(identical(other.jamAkhir, jamAkhir) || other.jamAkhir == jamAkhir)&&(identical(other.kuotaDiambil, kuotaDiambil) || other.kuotaDiambil == kuotaDiambil));
}


@override
int get hashCode => Object.hash(runtimeType,iklanId,tanggal,jamMulai,jamAkhir,kuotaDiambil);

@override
String toString() {
  return 'LamarParams(iklanId: $iklanId, tanggal: $tanggal, jamMulai: $jamMulai, jamAkhir: $jamAkhir, kuotaDiambil: $kuotaDiambil)';
}


}

/// @nodoc
abstract mixin class $LamarParamsCopyWith<$Res>  {
  factory $LamarParamsCopyWith(LamarParams value, $Res Function(LamarParams) _then) = _$LamarParamsCopyWithImpl;
@useResult
$Res call({
 String iklanId, DateTime tanggal, String jamMulai, String jamAkhir, int kuotaDiambil
});




}
/// @nodoc
class _$LamarParamsCopyWithImpl<$Res>
    implements $LamarParamsCopyWith<$Res> {
  _$LamarParamsCopyWithImpl(this._self, this._then);

  final LamarParams _self;
  final $Res Function(LamarParams) _then;

/// Create a copy of LamarParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iklanId = null,Object? tanggal = null,Object? jamMulai = null,Object? jamAkhir = null,Object? kuotaDiambil = null,}) {
  return _then(_self.copyWith(
iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as DateTime,jamMulai: null == jamMulai ? _self.jamMulai : jamMulai // ignore: cast_nullable_to_non_nullable
as String,jamAkhir: null == jamAkhir ? _self.jamAkhir : jamAkhir // ignore: cast_nullable_to_non_nullable
as String,kuotaDiambil: null == kuotaDiambil ? _self.kuotaDiambil : kuotaDiambil // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LamarParams].
extension LamarParamsPatterns on LamarParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LamarParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LamarParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LamarParams value)  $default,){
final _that = this;
switch (_that) {
case _LamarParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LamarParams value)?  $default,){
final _that = this;
switch (_that) {
case _LamarParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String iklanId,  DateTime tanggal,  String jamMulai,  String jamAkhir,  int kuotaDiambil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LamarParams() when $default != null:
return $default(_that.iklanId,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String iklanId,  DateTime tanggal,  String jamMulai,  String jamAkhir,  int kuotaDiambil)  $default,) {final _that = this;
switch (_that) {
case _LamarParams():
return $default(_that.iklanId,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String iklanId,  DateTime tanggal,  String jamMulai,  String jamAkhir,  int kuotaDiambil)?  $default,) {final _that = this;
switch (_that) {
case _LamarParams() when $default != null:
return $default(_that.iklanId,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil);case _:
  return null;

}
}

}

/// @nodoc


class _LamarParams implements LamarParams {
  const _LamarParams({required this.iklanId, required this.tanggal, required this.jamMulai, required this.jamAkhir, this.kuotaDiambil = 1});
  

@override final  String iklanId;
@override final  DateTime tanggal;
/// Format "HH:mm:ss" — sama dengan wire format backend (`chrono::NaiveTime`).
@override final  String jamMulai;
@override final  String jamAkhir;
@override@JsonKey() final  int kuotaDiambil;

/// Create a copy of LamarParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LamarParamsCopyWith<_LamarParams> get copyWith => __$LamarParamsCopyWithImpl<_LamarParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LamarParams&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.jamMulai, jamMulai) || other.jamMulai == jamMulai)&&(identical(other.jamAkhir, jamAkhir) || other.jamAkhir == jamAkhir)&&(identical(other.kuotaDiambil, kuotaDiambil) || other.kuotaDiambil == kuotaDiambil));
}


@override
int get hashCode => Object.hash(runtimeType,iklanId,tanggal,jamMulai,jamAkhir,kuotaDiambil);

@override
String toString() {
  return 'LamarParams(iklanId: $iklanId, tanggal: $tanggal, jamMulai: $jamMulai, jamAkhir: $jamAkhir, kuotaDiambil: $kuotaDiambil)';
}


}

/// @nodoc
abstract mixin class _$LamarParamsCopyWith<$Res> implements $LamarParamsCopyWith<$Res> {
  factory _$LamarParamsCopyWith(_LamarParams value, $Res Function(_LamarParams) _then) = __$LamarParamsCopyWithImpl;
@override @useResult
$Res call({
 String iklanId, DateTime tanggal, String jamMulai, String jamAkhir, int kuotaDiambil
});




}
/// @nodoc
class __$LamarParamsCopyWithImpl<$Res>
    implements _$LamarParamsCopyWith<$Res> {
  __$LamarParamsCopyWithImpl(this._self, this._then);

  final _LamarParams _self;
  final $Res Function(_LamarParams) _then;

/// Create a copy of LamarParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iklanId = null,Object? tanggal = null,Object? jamMulai = null,Object? jamAkhir = null,Object? kuotaDiambil = null,}) {
  return _then(_LamarParams(
iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as DateTime,jamMulai: null == jamMulai ? _self.jamMulai : jamMulai // ignore: cast_nullable_to_non_nullable
as String,jamAkhir: null == jamAkhir ? _self.jamAkhir : jamAkhir // ignore: cast_nullable_to_non_nullable
as String,kuotaDiambil: null == kuotaDiambil ? _self.kuotaDiambil : kuotaDiambil // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
