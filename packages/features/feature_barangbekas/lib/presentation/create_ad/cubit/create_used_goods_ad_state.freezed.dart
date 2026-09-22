// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_used_goods_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateUsedGoodsAdState {

 String get judul; String get deskripsi;/// "bekas" | "baru" — dinormalisasi (lowercase+trim) sebelum submit.
 String get jenisBarang; String get jumlah; String get lokasiPengambilan;/// Region id kelurahan (dari cascading location picker) — dipakai backend
/// untuk geocoding server-side (opsional).
 String? get regionId; bool get isRequesting; bool get isSuccess; String? get errorMessage;
/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUsedGoodsAdStateCopyWith<CreateUsedGoodsAdState> get copyWith => _$CreateUsedGoodsAdStateCopyWithImpl<CreateUsedGoodsAdState>(this as CreateUsedGoodsAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUsedGoodsAdState&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,regionId,isRequesting,isSuccess,errorMessage);

@override
String toString() {
  return 'CreateUsedGoodsAdState(judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, regionId: $regionId, isRequesting: $isRequesting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CreateUsedGoodsAdStateCopyWith<$Res>  {
  factory $CreateUsedGoodsAdStateCopyWith(CreateUsedGoodsAdState value, $Res Function(CreateUsedGoodsAdState) _then) = _$CreateUsedGoodsAdStateCopyWithImpl;
@useResult
$Res call({
 String judul, String deskripsi, String jenisBarang, String jumlah, String lokasiPengambilan, String? regionId, bool isRequesting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$CreateUsedGoodsAdStateCopyWithImpl<$Res>
    implements $CreateUsedGoodsAdStateCopyWith<$Res> {
  _$CreateUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final CreateUsedGoodsAdState _self;
  final $Res Function(CreateUsedGoodsAdState) _then;

/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? regionId = freezed,Object? isRequesting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,jenisBarang: null == jenisBarang ? _self.jenisBarang : jenisBarang // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as String,lokasiPengambilan: null == lokasiPengambilan ? _self.lokasiPengambilan : lokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUsedGoodsAdState].
extension CreateUsedGoodsAdStatePatterns on CreateUsedGoodsAdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUsedGoodsAdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUsedGoodsAdState value)  $default,){
final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUsedGoodsAdState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String judul,  String deskripsi,  String jenisBarang,  String jumlah,  String lokasiPengambilan,  String? regionId,  bool isRequesting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
return $default(_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.regionId,_that.isRequesting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String judul,  String deskripsi,  String jenisBarang,  String jumlah,  String lokasiPengambilan,  String? regionId,  bool isRequesting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState():
return $default(_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.regionId,_that.isRequesting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String judul,  String deskripsi,  String jenisBarang,  String jumlah,  String lokasiPengambilan,  String? regionId,  bool isRequesting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
return $default(_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.regionId,_that.isRequesting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CreateUsedGoodsAdState extends CreateUsedGoodsAdState {
  const _CreateUsedGoodsAdState({this.judul = '', this.deskripsi = '', this.jenisBarang = '', this.jumlah = '', this.lokasiPengambilan = '', this.regionId, this.isRequesting = false, this.isSuccess = false, this.errorMessage}): super._();
  

@override@JsonKey() final  String judul;
@override@JsonKey() final  String deskripsi;
/// "bekas" | "baru" — dinormalisasi (lowercase+trim) sebelum submit.
@override@JsonKey() final  String jenisBarang;
@override@JsonKey() final  String jumlah;
@override@JsonKey() final  String lokasiPengambilan;
/// Region id kelurahan (dari cascading location picker) — dipakai backend
/// untuk geocoding server-side (opsional).
@override final  String? regionId;
@override@JsonKey() final  bool isRequesting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUsedGoodsAdStateCopyWith<_CreateUsedGoodsAdState> get copyWith => __$CreateUsedGoodsAdStateCopyWithImpl<_CreateUsedGoodsAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUsedGoodsAdState&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,regionId,isRequesting,isSuccess,errorMessage);

@override
String toString() {
  return 'CreateUsedGoodsAdState(judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, regionId: $regionId, isRequesting: $isRequesting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CreateUsedGoodsAdStateCopyWith<$Res> implements $CreateUsedGoodsAdStateCopyWith<$Res> {
  factory _$CreateUsedGoodsAdStateCopyWith(_CreateUsedGoodsAdState value, $Res Function(_CreateUsedGoodsAdState) _then) = __$CreateUsedGoodsAdStateCopyWithImpl;
@override @useResult
$Res call({
 String judul, String deskripsi, String jenisBarang, String jumlah, String lokasiPengambilan, String? regionId, bool isRequesting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$CreateUsedGoodsAdStateCopyWithImpl<$Res>
    implements _$CreateUsedGoodsAdStateCopyWith<$Res> {
  __$CreateUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final _CreateUsedGoodsAdState _self;
  final $Res Function(_CreateUsedGoodsAdState) _then;

/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? regionId = freezed,Object? isRequesting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_CreateUsedGoodsAdState(
judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,jenisBarang: null == jenisBarang ? _self.jenisBarang : jenisBarang // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as String,lokasiPengambilan: null == lokasiPengambilan ? _self.lokasiPengambilan : lokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
