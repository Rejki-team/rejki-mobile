// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bider_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiderEntity {

 String get id; String get iklanId; String get peminatId; String get status; bool get sudahMenghubungi; DateTime get createdAt;// Enrichment sisi pemilik iklan (list_bider) — nama/lokasi/jarak peminat.
 String? get peminatNama; String? get kelurahan; String? get kecamatan; double? get jarakKm;// Enrichment sisi peminat (list_bider_saya) — konteks iklan.
 String? get iklanJudul; String? get iklanDeskripsi; String? get iklanJenisBarang; int? get iklanJumlah; String? get iklanLokasiPengambilan; List<String> get iklanFotoUrls; String? get iklanAvailabilityStatus;
/// Create a copy of BiderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiderEntityCopyWith<BiderEntity> get copyWith => _$BiderEntityCopyWithImpl<BiderEntity>(this as BiderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.peminatId, peminatId) || other.peminatId == peminatId)&&(identical(other.status, status) || other.status == status)&&(identical(other.sudahMenghubungi, sudahMenghubungi) || other.sudahMenghubungi == sudahMenghubungi)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peminatNama, peminatNama) || other.peminatNama == peminatNama)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.jarakKm, jarakKm) || other.jarakKm == jarakKm)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanDeskripsi, iklanDeskripsi) || other.iklanDeskripsi == iklanDeskripsi)&&(identical(other.iklanJenisBarang, iklanJenisBarang) || other.iklanJenisBarang == iklanJenisBarang)&&(identical(other.iklanJumlah, iklanJumlah) || other.iklanJumlah == iklanJumlah)&&(identical(other.iklanLokasiPengambilan, iklanLokasiPengambilan) || other.iklanLokasiPengambilan == iklanLokasiPengambilan)&&const DeepCollectionEquality().equals(other.iklanFotoUrls, iklanFotoUrls)&&(identical(other.iklanAvailabilityStatus, iklanAvailabilityStatus) || other.iklanAvailabilityStatus == iklanAvailabilityStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,iklanId,peminatId,status,sudahMenghubungi,createdAt,peminatNama,kelurahan,kecamatan,jarakKm,iklanJudul,iklanDeskripsi,iklanJenisBarang,iklanJumlah,iklanLokasiPengambilan,const DeepCollectionEquality().hash(iklanFotoUrls),iklanAvailabilityStatus);

@override
String toString() {
  return 'BiderEntity(id: $id, iklanId: $iklanId, peminatId: $peminatId, status: $status, sudahMenghubungi: $sudahMenghubungi, createdAt: $createdAt, peminatNama: $peminatNama, kelurahan: $kelurahan, kecamatan: $kecamatan, jarakKm: $jarakKm, iklanJudul: $iklanJudul, iklanDeskripsi: $iklanDeskripsi, iklanJenisBarang: $iklanJenisBarang, iklanJumlah: $iklanJumlah, iklanLokasiPengambilan: $iklanLokasiPengambilan, iklanFotoUrls: $iklanFotoUrls, iklanAvailabilityStatus: $iklanAvailabilityStatus)';
}


}

/// @nodoc
abstract mixin class $BiderEntityCopyWith<$Res>  {
  factory $BiderEntityCopyWith(BiderEntity value, $Res Function(BiderEntity) _then) = _$BiderEntityCopyWithImpl;
@useResult
$Res call({
 String id, String iklanId, String peminatId, String status, bool sudahMenghubungi, DateTime createdAt, String? peminatNama, String? kelurahan, String? kecamatan, double? jarakKm, String? iklanJudul, String? iklanDeskripsi, String? iklanJenisBarang, int? iklanJumlah, String? iklanLokasiPengambilan, List<String> iklanFotoUrls, String? iklanAvailabilityStatus
});




}
/// @nodoc
class _$BiderEntityCopyWithImpl<$Res>
    implements $BiderEntityCopyWith<$Res> {
  _$BiderEntityCopyWithImpl(this._self, this._then);

  final BiderEntity _self;
  final $Res Function(BiderEntity) _then;

/// Create a copy of BiderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? iklanId = null,Object? peminatId = null,Object? status = null,Object? sudahMenghubungi = null,Object? createdAt = null,Object? peminatNama = freezed,Object? kelurahan = freezed,Object? kecamatan = freezed,Object? jarakKm = freezed,Object? iklanJudul = freezed,Object? iklanDeskripsi = freezed,Object? iklanJenisBarang = freezed,Object? iklanJumlah = freezed,Object? iklanLokasiPengambilan = freezed,Object? iklanFotoUrls = null,Object? iklanAvailabilityStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,peminatId: null == peminatId ? _self.peminatId : peminatId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sudahMenghubungi: null == sudahMenghubungi ? _self.sudahMenghubungi : sudahMenghubungi // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,peminatNama: freezed == peminatNama ? _self.peminatNama : peminatNama // ignore: cast_nullable_to_non_nullable
as String?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,kecamatan: freezed == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String?,jarakKm: freezed == jarakKm ? _self.jarakKm : jarakKm // ignore: cast_nullable_to_non_nullable
as double?,iklanJudul: freezed == iklanJudul ? _self.iklanJudul : iklanJudul // ignore: cast_nullable_to_non_nullable
as String?,iklanDeskripsi: freezed == iklanDeskripsi ? _self.iklanDeskripsi : iklanDeskripsi // ignore: cast_nullable_to_non_nullable
as String?,iklanJenisBarang: freezed == iklanJenisBarang ? _self.iklanJenisBarang : iklanJenisBarang // ignore: cast_nullable_to_non_nullable
as String?,iklanJumlah: freezed == iklanJumlah ? _self.iklanJumlah : iklanJumlah // ignore: cast_nullable_to_non_nullable
as int?,iklanLokasiPengambilan: freezed == iklanLokasiPengambilan ? _self.iklanLokasiPengambilan : iklanLokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String?,iklanFotoUrls: null == iklanFotoUrls ? _self.iklanFotoUrls : iklanFotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,iklanAvailabilityStatus: freezed == iklanAvailabilityStatus ? _self.iklanAvailabilityStatus : iklanAvailabilityStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiderEntity].
extension BiderEntityPatterns on BiderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiderEntity value)  $default,){
final _that = this;
switch (_that) {
case _BiderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BiderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String iklanId,  String peminatId,  String status,  bool sudahMenghubungi,  DateTime createdAt,  String? peminatNama,  String? kelurahan,  String? kecamatan,  double? jarakKm,  String? iklanJudul,  String? iklanDeskripsi,  String? iklanJenisBarang,  int? iklanJumlah,  String? iklanLokasiPengambilan,  List<String> iklanFotoUrls,  String? iklanAvailabilityStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiderEntity() when $default != null:
return $default(_that.id,_that.iklanId,_that.peminatId,_that.status,_that.sudahMenghubungi,_that.createdAt,_that.peminatNama,_that.kelurahan,_that.kecamatan,_that.jarakKm,_that.iklanJudul,_that.iklanDeskripsi,_that.iklanJenisBarang,_that.iklanJumlah,_that.iklanLokasiPengambilan,_that.iklanFotoUrls,_that.iklanAvailabilityStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String iklanId,  String peminatId,  String status,  bool sudahMenghubungi,  DateTime createdAt,  String? peminatNama,  String? kelurahan,  String? kecamatan,  double? jarakKm,  String? iklanJudul,  String? iklanDeskripsi,  String? iklanJenisBarang,  int? iklanJumlah,  String? iklanLokasiPengambilan,  List<String> iklanFotoUrls,  String? iklanAvailabilityStatus)  $default,) {final _that = this;
switch (_that) {
case _BiderEntity():
return $default(_that.id,_that.iklanId,_that.peminatId,_that.status,_that.sudahMenghubungi,_that.createdAt,_that.peminatNama,_that.kelurahan,_that.kecamatan,_that.jarakKm,_that.iklanJudul,_that.iklanDeskripsi,_that.iklanJenisBarang,_that.iklanJumlah,_that.iklanLokasiPengambilan,_that.iklanFotoUrls,_that.iklanAvailabilityStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String iklanId,  String peminatId,  String status,  bool sudahMenghubungi,  DateTime createdAt,  String? peminatNama,  String? kelurahan,  String? kecamatan,  double? jarakKm,  String? iklanJudul,  String? iklanDeskripsi,  String? iklanJenisBarang,  int? iklanJumlah,  String? iklanLokasiPengambilan,  List<String> iklanFotoUrls,  String? iklanAvailabilityStatus)?  $default,) {final _that = this;
switch (_that) {
case _BiderEntity() when $default != null:
return $default(_that.id,_that.iklanId,_that.peminatId,_that.status,_that.sudahMenghubungi,_that.createdAt,_that.peminatNama,_that.kelurahan,_that.kecamatan,_that.jarakKm,_that.iklanJudul,_that.iklanDeskripsi,_that.iklanJenisBarang,_that.iklanJumlah,_that.iklanLokasiPengambilan,_that.iklanFotoUrls,_that.iklanAvailabilityStatus);case _:
  return null;

}
}

}

/// @nodoc


class _BiderEntity extends BiderEntity {
  const _BiderEntity({required this.id, required this.iklanId, required this.peminatId, required this.status, this.sudahMenghubungi = false, required this.createdAt, this.peminatNama, this.kelurahan, this.kecamatan, this.jarakKm, this.iklanJudul, this.iklanDeskripsi, this.iklanJenisBarang, this.iklanJumlah, this.iklanLokasiPengambilan, final  List<String> iklanFotoUrls = const [], this.iklanAvailabilityStatus}): _iklanFotoUrls = iklanFotoUrls,super._();
  

@override final  String id;
@override final  String iklanId;
@override final  String peminatId;
@override final  String status;
@override@JsonKey() final  bool sudahMenghubungi;
@override final  DateTime createdAt;
// Enrichment sisi pemilik iklan (list_bider) — nama/lokasi/jarak peminat.
@override final  String? peminatNama;
@override final  String? kelurahan;
@override final  String? kecamatan;
@override final  double? jarakKm;
// Enrichment sisi peminat (list_bider_saya) — konteks iklan.
@override final  String? iklanJudul;
@override final  String? iklanDeskripsi;
@override final  String? iklanJenisBarang;
@override final  int? iklanJumlah;
@override final  String? iklanLokasiPengambilan;
 final  List<String> _iklanFotoUrls;
@override@JsonKey() List<String> get iklanFotoUrls {
  if (_iklanFotoUrls is EqualUnmodifiableListView) return _iklanFotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_iklanFotoUrls);
}

@override final  String? iklanAvailabilityStatus;

/// Create a copy of BiderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiderEntityCopyWith<_BiderEntity> get copyWith => __$BiderEntityCopyWithImpl<_BiderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.peminatId, peminatId) || other.peminatId == peminatId)&&(identical(other.status, status) || other.status == status)&&(identical(other.sudahMenghubungi, sudahMenghubungi) || other.sudahMenghubungi == sudahMenghubungi)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peminatNama, peminatNama) || other.peminatNama == peminatNama)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.jarakKm, jarakKm) || other.jarakKm == jarakKm)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanDeskripsi, iklanDeskripsi) || other.iklanDeskripsi == iklanDeskripsi)&&(identical(other.iklanJenisBarang, iklanJenisBarang) || other.iklanJenisBarang == iklanJenisBarang)&&(identical(other.iklanJumlah, iklanJumlah) || other.iklanJumlah == iklanJumlah)&&(identical(other.iklanLokasiPengambilan, iklanLokasiPengambilan) || other.iklanLokasiPengambilan == iklanLokasiPengambilan)&&const DeepCollectionEquality().equals(other._iklanFotoUrls, _iklanFotoUrls)&&(identical(other.iklanAvailabilityStatus, iklanAvailabilityStatus) || other.iklanAvailabilityStatus == iklanAvailabilityStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,iklanId,peminatId,status,sudahMenghubungi,createdAt,peminatNama,kelurahan,kecamatan,jarakKm,iklanJudul,iklanDeskripsi,iklanJenisBarang,iklanJumlah,iklanLokasiPengambilan,const DeepCollectionEquality().hash(_iklanFotoUrls),iklanAvailabilityStatus);

@override
String toString() {
  return 'BiderEntity(id: $id, iklanId: $iklanId, peminatId: $peminatId, status: $status, sudahMenghubungi: $sudahMenghubungi, createdAt: $createdAt, peminatNama: $peminatNama, kelurahan: $kelurahan, kecamatan: $kecamatan, jarakKm: $jarakKm, iklanJudul: $iklanJudul, iklanDeskripsi: $iklanDeskripsi, iklanJenisBarang: $iklanJenisBarang, iklanJumlah: $iklanJumlah, iklanLokasiPengambilan: $iklanLokasiPengambilan, iklanFotoUrls: $iklanFotoUrls, iklanAvailabilityStatus: $iklanAvailabilityStatus)';
}


}

/// @nodoc
abstract mixin class _$BiderEntityCopyWith<$Res> implements $BiderEntityCopyWith<$Res> {
  factory _$BiderEntityCopyWith(_BiderEntity value, $Res Function(_BiderEntity) _then) = __$BiderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String iklanId, String peminatId, String status, bool sudahMenghubungi, DateTime createdAt, String? peminatNama, String? kelurahan, String? kecamatan, double? jarakKm, String? iklanJudul, String? iklanDeskripsi, String? iklanJenisBarang, int? iklanJumlah, String? iklanLokasiPengambilan, List<String> iklanFotoUrls, String? iklanAvailabilityStatus
});




}
/// @nodoc
class __$BiderEntityCopyWithImpl<$Res>
    implements _$BiderEntityCopyWith<$Res> {
  __$BiderEntityCopyWithImpl(this._self, this._then);

  final _BiderEntity _self;
  final $Res Function(_BiderEntity) _then;

/// Create a copy of BiderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? iklanId = null,Object? peminatId = null,Object? status = null,Object? sudahMenghubungi = null,Object? createdAt = null,Object? peminatNama = freezed,Object? kelurahan = freezed,Object? kecamatan = freezed,Object? jarakKm = freezed,Object? iklanJudul = freezed,Object? iklanDeskripsi = freezed,Object? iklanJenisBarang = freezed,Object? iklanJumlah = freezed,Object? iklanLokasiPengambilan = freezed,Object? iklanFotoUrls = null,Object? iklanAvailabilityStatus = freezed,}) {
  return _then(_BiderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,peminatId: null == peminatId ? _self.peminatId : peminatId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sudahMenghubungi: null == sudahMenghubungi ? _self.sudahMenghubungi : sudahMenghubungi // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,peminatNama: freezed == peminatNama ? _self.peminatNama : peminatNama // ignore: cast_nullable_to_non_nullable
as String?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,kecamatan: freezed == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String?,jarakKm: freezed == jarakKm ? _self.jarakKm : jarakKm // ignore: cast_nullable_to_non_nullable
as double?,iklanJudul: freezed == iklanJudul ? _self.iklanJudul : iklanJudul // ignore: cast_nullable_to_non_nullable
as String?,iklanDeskripsi: freezed == iklanDeskripsi ? _self.iklanDeskripsi : iklanDeskripsi // ignore: cast_nullable_to_non_nullable
as String?,iklanJenisBarang: freezed == iklanJenisBarang ? _self.iklanJenisBarang : iklanJenisBarang // ignore: cast_nullable_to_non_nullable
as String?,iklanJumlah: freezed == iklanJumlah ? _self.iklanJumlah : iklanJumlah // ignore: cast_nullable_to_non_nullable
as int?,iklanLokasiPengambilan: freezed == iklanLokasiPengambilan ? _self.iklanLokasiPengambilan : iklanLokasiPengambilan // ignore: cast_nullable_to_non_nullable
as String?,iklanFotoUrls: null == iklanFotoUrls ? _self._iklanFotoUrls : iklanFotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,iklanAvailabilityStatus: freezed == iklanAvailabilityStatus ? _self.iklanAvailabilityStatus : iklanAvailabilityStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
