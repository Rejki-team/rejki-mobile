// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecondhandEntity {

 String get id; String get sellerId; String get judul; String get deskripsi;/// "bekas" | "baru"
 String get jenisBarang; int get jumlah;/// Alamat pengambilan barang (wajib diisi pemilik)
 String get lokasiPengambilan;/// Teks lokasi bebas dipakai untuk geocoding (opsional)
 String? get lokasi; String? get regionId; List<String> get fotoUrls;/// "tersedia" | "sudah_diambil"
 String get availabilityStatus; String get moderationStatus; DateTime get createdAt;
/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandEntityCopyWith<SecondhandEntity> get copyWith => _$SecondhandEntityCopyWithImpl<SecondhandEntity>(this as SecondhandEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&const DeepCollectionEquality().equals(other.fotoUrls, fotoUrls)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus)&&(identical(other.moderationStatus, moderationStatus) || other.moderationStatus == moderationStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,sellerId,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,lokasi,regionId,const DeepCollectionEquality().hash(fotoUrls),availabilityStatus,moderationStatus,createdAt);

@override
String toString() {
  return 'SecondhandEntity(id: $id, sellerId: $sellerId, judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, lokasi: $lokasi, regionId: $regionId, fotoUrls: $fotoUrls, availabilityStatus: $availabilityStatus, moderationStatus: $moderationStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SecondhandEntityCopyWith<$Res>  {
  factory $SecondhandEntityCopyWith(SecondhandEntity value, $Res Function(SecondhandEntity) _then) = _$SecondhandEntityCopyWithImpl;
@useResult
$Res call({
 String id, String sellerId, String judul, String deskripsi, String jenisBarang, int jumlah, String lokasiPengambilan, String? lokasi, String? regionId, List<String> fotoUrls, String availabilityStatus, String moderationStatus, DateTime createdAt
});




}
/// @nodoc
class _$SecondhandEntityCopyWithImpl<$Res>
    implements $SecondhandEntityCopyWith<$Res> {
  _$SecondhandEntityCopyWithImpl(this._self, this._then);

  final SecondhandEntity _self;
  final $Res Function(SecondhandEntity) _then;

/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sellerId = null,Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? lokasi = freezed,Object? regionId = freezed,Object? fotoUrls = null,Object? availabilityStatus = null,Object? moderationStatus = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,jenisBarang: null == jenisBarang ? _self.jenisBarang : jenisBarang // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as int,lokasiPengambilan: null == lokasiPengambilan ? _self.lokasiPengambilan : lokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String,lokasi: freezed == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,fotoUrls: null == fotoUrls ? _self.fotoUrls : fotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,availabilityStatus: null == availabilityStatus ? _self.availabilityStatus : availabilityStatus // ignore: cast_nullable_to_non_nullable
as String,moderationStatus: null == moderationStatus ? _self.moderationStatus : moderationStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandEntity].
extension SecondhandEntityPatterns on SecondhandEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandEntity value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sellerId,  String judul,  String deskripsi,  String jenisBarang,  int jumlah,  String lokasiPengambilan,  String? lokasi,  String? regionId,  List<String> fotoUrls,  String availabilityStatus,  String moderationStatus,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
return $default(_that.id,_that.sellerId,_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId,_that.fotoUrls,_that.availabilityStatus,_that.moderationStatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sellerId,  String judul,  String deskripsi,  String jenisBarang,  int jumlah,  String lokasiPengambilan,  String? lokasi,  String? regionId,  List<String> fotoUrls,  String availabilityStatus,  String moderationStatus,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SecondhandEntity():
return $default(_that.id,_that.sellerId,_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId,_that.fotoUrls,_that.availabilityStatus,_that.moderationStatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sellerId,  String judul,  String deskripsi,  String jenisBarang,  int jumlah,  String lokasiPengambilan,  String? lokasi,  String? regionId,  List<String> fotoUrls,  String availabilityStatus,  String moderationStatus,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
return $default(_that.id,_that.sellerId,_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId,_that.fotoUrls,_that.availabilityStatus,_that.moderationStatus,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _SecondhandEntity extends SecondhandEntity {
  const _SecondhandEntity({required this.id, required this.sellerId, required this.judul, required this.deskripsi, required this.jenisBarang, required this.jumlah, required this.lokasiPengambilan, this.lokasi, this.regionId, final  List<String> fotoUrls = const [], required this.availabilityStatus, required this.moderationStatus, required this.createdAt}): _fotoUrls = fotoUrls,super._();
  

@override final  String id;
@override final  String sellerId;
@override final  String judul;
@override final  String deskripsi;
/// "bekas" | "baru"
@override final  String jenisBarang;
@override final  int jumlah;
/// Alamat pengambilan barang (wajib diisi pemilik)
@override final  String lokasiPengambilan;
/// Teks lokasi bebas dipakai untuk geocoding (opsional)
@override final  String? lokasi;
@override final  String? regionId;
 final  List<String> _fotoUrls;
@override@JsonKey() List<String> get fotoUrls {
  if (_fotoUrls is EqualUnmodifiableListView) return _fotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fotoUrls);
}

/// "tersedia" | "sudah_diambil"
@override final  String availabilityStatus;
@override final  String moderationStatus;
@override final  DateTime createdAt;

/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandEntityCopyWith<_SecondhandEntity> get copyWith => __$SecondhandEntityCopyWithImpl<_SecondhandEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&const DeepCollectionEquality().equals(other._fotoUrls, _fotoUrls)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus)&&(identical(other.moderationStatus, moderationStatus) || other.moderationStatus == moderationStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,sellerId,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,lokasi,regionId,const DeepCollectionEquality().hash(_fotoUrls),availabilityStatus,moderationStatus,createdAt);

@override
String toString() {
  return 'SecondhandEntity(id: $id, sellerId: $sellerId, judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, lokasi: $lokasi, regionId: $regionId, fotoUrls: $fotoUrls, availabilityStatus: $availabilityStatus, moderationStatus: $moderationStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SecondhandEntityCopyWith<$Res> implements $SecondhandEntityCopyWith<$Res> {
  factory _$SecondhandEntityCopyWith(_SecondhandEntity value, $Res Function(_SecondhandEntity) _then) = __$SecondhandEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String sellerId, String judul, String deskripsi, String jenisBarang, int jumlah, String lokasiPengambilan, String? lokasi, String? regionId, List<String> fotoUrls, String availabilityStatus, String moderationStatus, DateTime createdAt
});




}
/// @nodoc
class __$SecondhandEntityCopyWithImpl<$Res>
    implements _$SecondhandEntityCopyWith<$Res> {
  __$SecondhandEntityCopyWithImpl(this._self, this._then);

  final _SecondhandEntity _self;
  final $Res Function(_SecondhandEntity) _then;

/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sellerId = null,Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? lokasi = freezed,Object? regionId = freezed,Object? fotoUrls = null,Object? availabilityStatus = null,Object? moderationStatus = null,Object? createdAt = null,}) {
  return _then(_SecondhandEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,jenisBarang: null == jenisBarang ? _self.jenisBarang : jenisBarang // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as int,lokasiPengambilan: null == lokasiPengambilan ? _self.lokasiPengambilan : lokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String,lokasi: freezed == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,fotoUrls: null == fotoUrls ? _self._fotoUrls : fotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,availabilityStatus: null == availabilityStatus ? _self.availabilityStatus : availabilityStatus // ignore: cast_nullable_to_non_nullable
as String,moderationStatus: null == moderationStatus ? _self.moderationStatus : moderationStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
