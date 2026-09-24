// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_secondhand_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateSecondhandParams {

 String get judul; String get deskripsi;/// "bekas" | "baru"
 String get jenisBarang; int get jumlah;/// Alamat pengambilan barang (wajib)
 String get lokasiPengambilan;/// Teks lokasi bebas untuk geocoding server-side (opsional)
 String? get lokasi; String? get regionId;
/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSecondhandParamsCopyWith<CreateSecondhandParams> get copyWith => _$CreateSecondhandParamsCopyWithImpl<CreateSecondhandParams>(this as CreateSecondhandParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSecondhandParams&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.regionId, regionId) || other.regionId == regionId));
}


@override
int get hashCode => Object.hash(runtimeType,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,lokasi,regionId);

@override
String toString() {
  return 'CreateSecondhandParams(judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, lokasi: $lokasi, regionId: $regionId)';
}


}

/// @nodoc
abstract mixin class $CreateSecondhandParamsCopyWith<$Res>  {
  factory $CreateSecondhandParamsCopyWith(CreateSecondhandParams value, $Res Function(CreateSecondhandParams) _then) = _$CreateSecondhandParamsCopyWithImpl;
@useResult
$Res call({
 String judul, String deskripsi, String jenisBarang, int jumlah, String lokasiPengambilan, String? lokasi, String? regionId
});




}
/// @nodoc
class _$CreateSecondhandParamsCopyWithImpl<$Res>
    implements $CreateSecondhandParamsCopyWith<$Res> {
  _$CreateSecondhandParamsCopyWithImpl(this._self, this._then);

  final CreateSecondhandParams _self;
  final $Res Function(CreateSecondhandParams) _then;

/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? lokasi = freezed,Object? regionId = freezed,}) {
  return _then(_self.copyWith(
judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,jenisBarang: null == jenisBarang ? _self.jenisBarang : jenisBarang // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as int,lokasiPengambilan: null == lokasiPengambilan ? _self.lokasiPengambilan : lokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String,lokasi: freezed == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSecondhandParams].
extension CreateSecondhandParamsPatterns on CreateSecondhandParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSecondhandParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSecondhandParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateSecondhandParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSecondhandParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String judul,  String deskripsi,  String jenisBarang,  int jumlah,  String lokasiPengambilan,  String? lokasi,  String? regionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
return $default(_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String judul,  String deskripsi,  String jenisBarang,  int jumlah,  String lokasiPengambilan,  String? lokasi,  String? regionId)  $default,) {final _that = this;
switch (_that) {
case _CreateSecondhandParams():
return $default(_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String judul,  String deskripsi,  String jenisBarang,  int jumlah,  String lokasiPengambilan,  String? lokasi,  String? regionId)?  $default,) {final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
return $default(_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSecondhandParams implements CreateSecondhandParams {
  const _CreateSecondhandParams({required this.judul, required this.deskripsi, required this.jenisBarang, required this.jumlah, required this.lokasiPengambilan, this.lokasi, this.regionId});
  

@override final  String judul;
@override final  String deskripsi;
/// "bekas" | "baru"
@override final  String jenisBarang;
@override final  int jumlah;
/// Alamat pengambilan barang (wajib)
@override final  String lokasiPengambilan;
/// Teks lokasi bebas untuk geocoding server-side (opsional)
@override final  String? lokasi;
@override final  String? regionId;

/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSecondhandParamsCopyWith<_CreateSecondhandParams> get copyWith => __$CreateSecondhandParamsCopyWithImpl<_CreateSecondhandParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSecondhandParams&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.regionId, regionId) || other.regionId == regionId));
}


@override
int get hashCode => Object.hash(runtimeType,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,lokasi,regionId);

@override
String toString() {
  return 'CreateSecondhandParams(judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, lokasi: $lokasi, regionId: $regionId)';
}


}

/// @nodoc
abstract mixin class _$CreateSecondhandParamsCopyWith<$Res> implements $CreateSecondhandParamsCopyWith<$Res> {
  factory _$CreateSecondhandParamsCopyWith(_CreateSecondhandParams value, $Res Function(_CreateSecondhandParams) _then) = __$CreateSecondhandParamsCopyWithImpl;
@override @useResult
$Res call({
 String judul, String deskripsi, String jenisBarang, int jumlah, String lokasiPengambilan, String? lokasi, String? regionId
});




}
/// @nodoc
class __$CreateSecondhandParamsCopyWithImpl<$Res>
    implements _$CreateSecondhandParamsCopyWith<$Res> {
  __$CreateSecondhandParamsCopyWithImpl(this._self, this._then);

  final _CreateSecondhandParams _self;
  final $Res Function(_CreateSecondhandParams) _then;

/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? lokasi = freezed,Object? regionId = freezed,}) {
  return _then(_CreateSecondhandParams(
judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,jenisBarang: null == jenisBarang ? _self.jenisBarang : jenisBarang // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as int,lokasiPengambilan: null == lokasiPengambilan ? _self.lokasiPengambilan : lokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String,lokasi: freezed == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
