// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BiderModel {

 String get id;@JsonKey(name: 'iklan_id') String get iklanId;@JsonKey(name: 'peminat_id') String get peminatId; String get status;@JsonKey(name: 'sudah_menghubungi') bool get sudahMenghubungi;@JsonKey(name: 'created_at') String get createdAt;// Enrichment sisi pemilik (BiderResponse dari list_bider).
@JsonKey(name: 'peminat_nama') String? get peminatNama; String? get kelurahan; String? get kecamatan;@JsonKey(name: 'jarak_km') double? get jarakKm;// Enrichment sisi peminat (BiderWithIklanResponse dari list_bider_saya).
@JsonKey(name: 'iklan_judul') String? get iklanJudul;@JsonKey(name: 'iklan_deskripsi') String? get iklanDeskripsi;@JsonKey(name: 'iklan_jenis_barang') String? get iklanJenisBarang;@JsonKey(name: 'iklan_jumlah') int? get iklanJumlah;@JsonKey(name: 'iklan_lokasi_pengambilan') String? get iklanLokasiPengambilan;@JsonKey(name: 'iklan_foto_urls') List<String> get iklanFotoUrls;@JsonKey(name: 'iklan_availability_status') String? get iklanAvailabilityStatus;
/// Create a copy of BiderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiderModelCopyWith<BiderModel> get copyWith => _$BiderModelCopyWithImpl<BiderModel>(this as BiderModel, _$identity);

  /// Serializes this BiderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.peminatId, peminatId) || other.peminatId == peminatId)&&(identical(other.status, status) || other.status == status)&&(identical(other.sudahMenghubungi, sudahMenghubungi) || other.sudahMenghubungi == sudahMenghubungi)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peminatNama, peminatNama) || other.peminatNama == peminatNama)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.jarakKm, jarakKm) || other.jarakKm == jarakKm)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanDeskripsi, iklanDeskripsi) || other.iklanDeskripsi == iklanDeskripsi)&&(identical(other.iklanJenisBarang, iklanJenisBarang) || other.iklanJenisBarang == iklanJenisBarang)&&(identical(other.iklanJumlah, iklanJumlah) || other.iklanJumlah == iklanJumlah)&&(identical(other.iklanLokasiPengambilan, iklanLokasiPengambilan) || other.iklanLokasiPengambilan == iklanLokasiPengambilan)&&const DeepCollectionEquality().equals(other.iklanFotoUrls, iklanFotoUrls)&&(identical(other.iklanAvailabilityStatus, iklanAvailabilityStatus) || other.iklanAvailabilityStatus == iklanAvailabilityStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,iklanId,peminatId,status,sudahMenghubungi,createdAt,peminatNama,kelurahan,kecamatan,jarakKm,iklanJudul,iklanDeskripsi,iklanJenisBarang,iklanJumlah,iklanLokasiPengambilan,const DeepCollectionEquality().hash(iklanFotoUrls),iklanAvailabilityStatus);

@override
String toString() {
  return 'BiderModel(id: $id, iklanId: $iklanId, peminatId: $peminatId, status: $status, sudahMenghubungi: $sudahMenghubungi, createdAt: $createdAt, peminatNama: $peminatNama, kelurahan: $kelurahan, kecamatan: $kecamatan, jarakKm: $jarakKm, iklanJudul: $iklanJudul, iklanDeskripsi: $iklanDeskripsi, iklanJenisBarang: $iklanJenisBarang, iklanJumlah: $iklanJumlah, iklanLokasiPengambilan: $iklanLokasiPengambilan, iklanFotoUrls: $iklanFotoUrls, iklanAvailabilityStatus: $iklanAvailabilityStatus)';
}


}

/// @nodoc
abstract mixin class $BiderModelCopyWith<$Res>  {
  factory $BiderModelCopyWith(BiderModel value, $Res Function(BiderModel) _then) = _$BiderModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'iklan_id') String iklanId,@JsonKey(name: 'peminat_id') String peminatId, String status,@JsonKey(name: 'sudah_menghubungi') bool sudahMenghubungi,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'peminat_nama') String? peminatNama, String? kelurahan, String? kecamatan,@JsonKey(name: 'jarak_km') double? jarakKm,@JsonKey(name: 'iklan_judul') String? iklanJudul,@JsonKey(name: 'iklan_deskripsi') String? iklanDeskripsi,@JsonKey(name: 'iklan_jenis_barang') String? iklanJenisBarang,@JsonKey(name: 'iklan_jumlah') int? iklanJumlah,@JsonKey(name: 'iklan_lokasi_pengambilan') String? iklanLokasiPengambilan,@JsonKey(name: 'iklan_foto_urls') List<String> iklanFotoUrls,@JsonKey(name: 'iklan_availability_status') String? iklanAvailabilityStatus
});




}
/// @nodoc
class _$BiderModelCopyWithImpl<$Res>
    implements $BiderModelCopyWith<$Res> {
  _$BiderModelCopyWithImpl(this._self, this._then);

  final BiderModel _self;
  final $Res Function(BiderModel) _then;

/// Create a copy of BiderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? iklanId = null,Object? peminatId = null,Object? status = null,Object? sudahMenghubungi = null,Object? createdAt = null,Object? peminatNama = freezed,Object? kelurahan = freezed,Object? kecamatan = freezed,Object? jarakKm = freezed,Object? iklanJudul = freezed,Object? iklanDeskripsi = freezed,Object? iklanJenisBarang = freezed,Object? iklanJumlah = freezed,Object? iklanLokasiPengambilan = freezed,Object? iklanFotoUrls = null,Object? iklanAvailabilityStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,peminatId: null == peminatId ? _self.peminatId : peminatId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sudahMenghubungi: null == sudahMenghubungi ? _self.sudahMenghubungi : sudahMenghubungi // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,peminatNama: freezed == peminatNama ? _self.peminatNama : peminatNama // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [BiderModel].
extension BiderModelPatterns on BiderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiderModel value)  $default,){
final _that = this;
switch (_that) {
case _BiderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiderModel value)?  $default,){
final _that = this;
switch (_that) {
case _BiderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'iklan_id')  String iklanId, @JsonKey(name: 'peminat_id')  String peminatId,  String status, @JsonKey(name: 'sudah_menghubungi')  bool sudahMenghubungi, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'peminat_nama')  String? peminatNama,  String? kelurahan,  String? kecamatan, @JsonKey(name: 'jarak_km')  double? jarakKm, @JsonKey(name: 'iklan_judul')  String? iklanJudul, @JsonKey(name: 'iklan_deskripsi')  String? iklanDeskripsi, @JsonKey(name: 'iklan_jenis_barang')  String? iklanJenisBarang, @JsonKey(name: 'iklan_jumlah')  int? iklanJumlah, @JsonKey(name: 'iklan_lokasi_pengambilan')  String? iklanLokasiPengambilan, @JsonKey(name: 'iklan_foto_urls')  List<String> iklanFotoUrls, @JsonKey(name: 'iklan_availability_status')  String? iklanAvailabilityStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiderModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'iklan_id')  String iklanId, @JsonKey(name: 'peminat_id')  String peminatId,  String status, @JsonKey(name: 'sudah_menghubungi')  bool sudahMenghubungi, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'peminat_nama')  String? peminatNama,  String? kelurahan,  String? kecamatan, @JsonKey(name: 'jarak_km')  double? jarakKm, @JsonKey(name: 'iklan_judul')  String? iklanJudul, @JsonKey(name: 'iklan_deskripsi')  String? iklanDeskripsi, @JsonKey(name: 'iklan_jenis_barang')  String? iklanJenisBarang, @JsonKey(name: 'iklan_jumlah')  int? iklanJumlah, @JsonKey(name: 'iklan_lokasi_pengambilan')  String? iklanLokasiPengambilan, @JsonKey(name: 'iklan_foto_urls')  List<String> iklanFotoUrls, @JsonKey(name: 'iklan_availability_status')  String? iklanAvailabilityStatus)  $default,) {final _that = this;
switch (_that) {
case _BiderModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'iklan_id')  String iklanId, @JsonKey(name: 'peminat_id')  String peminatId,  String status, @JsonKey(name: 'sudah_menghubungi')  bool sudahMenghubungi, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'peminat_nama')  String? peminatNama,  String? kelurahan,  String? kecamatan, @JsonKey(name: 'jarak_km')  double? jarakKm, @JsonKey(name: 'iklan_judul')  String? iklanJudul, @JsonKey(name: 'iklan_deskripsi')  String? iklanDeskripsi, @JsonKey(name: 'iklan_jenis_barang')  String? iklanJenisBarang, @JsonKey(name: 'iklan_jumlah')  int? iklanJumlah, @JsonKey(name: 'iklan_lokasi_pengambilan')  String? iklanLokasiPengambilan, @JsonKey(name: 'iklan_foto_urls')  List<String> iklanFotoUrls, @JsonKey(name: 'iklan_availability_status')  String? iklanAvailabilityStatus)?  $default,) {final _that = this;
switch (_that) {
case _BiderModel() when $default != null:
return $default(_that.id,_that.iklanId,_that.peminatId,_that.status,_that.sudahMenghubungi,_that.createdAt,_that.peminatNama,_that.kelurahan,_that.kecamatan,_that.jarakKm,_that.iklanJudul,_that.iklanDeskripsi,_that.iklanJenisBarang,_that.iklanJumlah,_that.iklanLokasiPengambilan,_that.iklanFotoUrls,_that.iklanAvailabilityStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BiderModel extends BiderModel {
  const _BiderModel({required this.id, @JsonKey(name: 'iklan_id') required this.iklanId, @JsonKey(name: 'peminat_id') required this.peminatId, required this.status, @JsonKey(name: 'sudah_menghubungi') this.sudahMenghubungi = false, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'peminat_nama') this.peminatNama, this.kelurahan, this.kecamatan, @JsonKey(name: 'jarak_km') this.jarakKm, @JsonKey(name: 'iklan_judul') this.iklanJudul, @JsonKey(name: 'iklan_deskripsi') this.iklanDeskripsi, @JsonKey(name: 'iklan_jenis_barang') this.iklanJenisBarang, @JsonKey(name: 'iklan_jumlah') this.iklanJumlah, @JsonKey(name: 'iklan_lokasi_pengambilan') this.iklanLokasiPengambilan, @JsonKey(name: 'iklan_foto_urls') final  List<String> iklanFotoUrls = const [], @JsonKey(name: 'iklan_availability_status') this.iklanAvailabilityStatus}): _iklanFotoUrls = iklanFotoUrls,super._();
  factory _BiderModel.fromJson(Map<String, dynamic> json) => _$BiderModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'iklan_id') final  String iklanId;
@override@JsonKey(name: 'peminat_id') final  String peminatId;
@override final  String status;
@override@JsonKey(name: 'sudah_menghubungi') final  bool sudahMenghubungi;
@override@JsonKey(name: 'created_at') final  String createdAt;
// Enrichment sisi pemilik (BiderResponse dari list_bider).
@override@JsonKey(name: 'peminat_nama') final  String? peminatNama;
@override final  String? kelurahan;
@override final  String? kecamatan;
@override@JsonKey(name: 'jarak_km') final  double? jarakKm;
// Enrichment sisi peminat (BiderWithIklanResponse dari list_bider_saya).
@override@JsonKey(name: 'iklan_judul') final  String? iklanJudul;
@override@JsonKey(name: 'iklan_deskripsi') final  String? iklanDeskripsi;
@override@JsonKey(name: 'iklan_jenis_barang') final  String? iklanJenisBarang;
@override@JsonKey(name: 'iklan_jumlah') final  int? iklanJumlah;
@override@JsonKey(name: 'iklan_lokasi_pengambilan') final  String? iklanLokasiPengambilan;
 final  List<String> _iklanFotoUrls;
@override@JsonKey(name: 'iklan_foto_urls') List<String> get iklanFotoUrls {
  if (_iklanFotoUrls is EqualUnmodifiableListView) return _iklanFotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_iklanFotoUrls);
}

@override@JsonKey(name: 'iklan_availability_status') final  String? iklanAvailabilityStatus;

/// Create a copy of BiderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiderModelCopyWith<_BiderModel> get copyWith => __$BiderModelCopyWithImpl<_BiderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.peminatId, peminatId) || other.peminatId == peminatId)&&(identical(other.status, status) || other.status == status)&&(identical(other.sudahMenghubungi, sudahMenghubungi) || other.sudahMenghubungi == sudahMenghubungi)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.peminatNama, peminatNama) || other.peminatNama == peminatNama)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.jarakKm, jarakKm) || other.jarakKm == jarakKm)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanDeskripsi, iklanDeskripsi) || other.iklanDeskripsi == iklanDeskripsi)&&(identical(other.iklanJenisBarang, iklanJenisBarang) || other.iklanJenisBarang == iklanJenisBarang)&&(identical(other.iklanJumlah, iklanJumlah) || other.iklanJumlah == iklanJumlah)&&(identical(other.iklanLokasiPengambilan, iklanLokasiPengambilan) || other.iklanLokasiPengambilan == iklanLokasiPengambilan)&&const DeepCollectionEquality().equals(other._iklanFotoUrls, _iklanFotoUrls)&&(identical(other.iklanAvailabilityStatus, iklanAvailabilityStatus) || other.iklanAvailabilityStatus == iklanAvailabilityStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,iklanId,peminatId,status,sudahMenghubungi,createdAt,peminatNama,kelurahan,kecamatan,jarakKm,iklanJudul,iklanDeskripsi,iklanJenisBarang,iklanJumlah,iklanLokasiPengambilan,const DeepCollectionEquality().hash(_iklanFotoUrls),iklanAvailabilityStatus);

@override
String toString() {
  return 'BiderModel(id: $id, iklanId: $iklanId, peminatId: $peminatId, status: $status, sudahMenghubungi: $sudahMenghubungi, createdAt: $createdAt, peminatNama: $peminatNama, kelurahan: $kelurahan, kecamatan: $kecamatan, jarakKm: $jarakKm, iklanJudul: $iklanJudul, iklanDeskripsi: $iklanDeskripsi, iklanJenisBarang: $iklanJenisBarang, iklanJumlah: $iklanJumlah, iklanLokasiPengambilan: $iklanLokasiPengambilan, iklanFotoUrls: $iklanFotoUrls, iklanAvailabilityStatus: $iklanAvailabilityStatus)';
}


}

/// @nodoc
abstract mixin class _$BiderModelCopyWith<$Res> implements $BiderModelCopyWith<$Res> {
  factory _$BiderModelCopyWith(_BiderModel value, $Res Function(_BiderModel) _then) = __$BiderModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'iklan_id') String iklanId,@JsonKey(name: 'peminat_id') String peminatId, String status,@JsonKey(name: 'sudah_menghubungi') bool sudahMenghubungi,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'peminat_nama') String? peminatNama, String? kelurahan, String? kecamatan,@JsonKey(name: 'jarak_km') double? jarakKm,@JsonKey(name: 'iklan_judul') String? iklanJudul,@JsonKey(name: 'iklan_deskripsi') String? iklanDeskripsi,@JsonKey(name: 'iklan_jenis_barang') String? iklanJenisBarang,@JsonKey(name: 'iklan_jumlah') int? iklanJumlah,@JsonKey(name: 'iklan_lokasi_pengambilan') String? iklanLokasiPengambilan,@JsonKey(name: 'iklan_foto_urls') List<String> iklanFotoUrls,@JsonKey(name: 'iklan_availability_status') String? iklanAvailabilityStatus
});




}
/// @nodoc
class __$BiderModelCopyWithImpl<$Res>
    implements _$BiderModelCopyWith<$Res> {
  __$BiderModelCopyWithImpl(this._self, this._then);

  final _BiderModel _self;
  final $Res Function(_BiderModel) _then;

/// Create a copy of BiderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? iklanId = null,Object? peminatId = null,Object? status = null,Object? sudahMenghubungi = null,Object? createdAt = null,Object? peminatNama = freezed,Object? kelurahan = freezed,Object? kecamatan = freezed,Object? jarakKm = freezed,Object? iklanJudul = freezed,Object? iklanDeskripsi = freezed,Object? iklanJenisBarang = freezed,Object? iklanJumlah = freezed,Object? iklanLokasiPengambilan = freezed,Object? iklanFotoUrls = null,Object? iklanAvailabilityStatus = freezed,}) {
  return _then(_BiderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,peminatId: null == peminatId ? _self.peminatId : peminatId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sudahMenghubungi: null == sudahMenghubungi ? _self.sudahMenghubungi : sudahMenghubungi // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,peminatNama: freezed == peminatNama ? _self.peminatNama : peminatNama // ignore: cast_nullable_to_non_nullable
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
