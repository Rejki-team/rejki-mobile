// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondhandModel {

 String get id;@JsonKey(name: 'seller_id') String get sellerId; String get judul; String get deskripsi;@JsonKey(name: 'jenis_barang') String get jenisBarang; int get jumlah;@JsonKey(name: 'lokasi_pengambilan') String get lokasiPengambilan; String? get lokasi;@JsonKey(name: 'region_id') String? get regionId;@JsonKey(name: 'foto_urls') List<String> get fotoUrls;@JsonKey(name: 'availability_status') String get availabilityStatus;@JsonKey(name: 'moderation_status') String get moderationStatus;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandModelCopyWith<SecondhandModel> get copyWith => _$SecondhandModelCopyWithImpl<SecondhandModel>(this as SecondhandModel, _$identity);

  /// Serializes this SecondhandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&const DeepCollectionEquality().equals(other.fotoUrls, fotoUrls)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus)&&(identical(other.moderationStatus, moderationStatus) || other.moderationStatus == moderationStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sellerId,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,lokasi,regionId,const DeepCollectionEquality().hash(fotoUrls),availabilityStatus,moderationStatus,createdAt);

@override
String toString() {
  return 'SecondhandModel(id: $id, sellerId: $sellerId, judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, lokasi: $lokasi, regionId: $regionId, fotoUrls: $fotoUrls, availabilityStatus: $availabilityStatus, moderationStatus: $moderationStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SecondhandModelCopyWith<$Res>  {
  factory $SecondhandModelCopyWith(SecondhandModel value, $Res Function(SecondhandModel) _then) = _$SecondhandModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'seller_id') String sellerId, String judul, String deskripsi,@JsonKey(name: 'jenis_barang') String jenisBarang, int jumlah,@JsonKey(name: 'lokasi_pengambilan') String lokasiPengambilan, String? lokasi,@JsonKey(name: 'region_id') String? regionId,@JsonKey(name: 'foto_urls') List<String> fotoUrls,@JsonKey(name: 'availability_status') String availabilityStatus,@JsonKey(name: 'moderation_status') String moderationStatus,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$SecondhandModelCopyWithImpl<$Res>
    implements $SecondhandModelCopyWith<$Res> {
  _$SecondhandModelCopyWithImpl(this._self, this._then);

  final SecondhandModel _self;
  final $Res Function(SecondhandModel) _then;

/// Create a copy of SecondhandModel
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
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandModel].
extension SecondhandModelPatterns on SecondhandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandModel value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandModel value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'seller_id')  String sellerId,  String judul,  String deskripsi, @JsonKey(name: 'jenis_barang')  String jenisBarang,  int jumlah, @JsonKey(name: 'lokasi_pengambilan')  String lokasiPengambilan,  String? lokasi, @JsonKey(name: 'region_id')  String? regionId, @JsonKey(name: 'foto_urls')  List<String> fotoUrls, @JsonKey(name: 'availability_status')  String availabilityStatus, @JsonKey(name: 'moderation_status')  String moderationStatus, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'seller_id')  String sellerId,  String judul,  String deskripsi, @JsonKey(name: 'jenis_barang')  String jenisBarang,  int jumlah, @JsonKey(name: 'lokasi_pengambilan')  String lokasiPengambilan,  String? lokasi, @JsonKey(name: 'region_id')  String? regionId, @JsonKey(name: 'foto_urls')  List<String> fotoUrls, @JsonKey(name: 'availability_status')  String availabilityStatus, @JsonKey(name: 'moderation_status')  String moderationStatus, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _SecondhandModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'seller_id')  String sellerId,  String judul,  String deskripsi, @JsonKey(name: 'jenis_barang')  String jenisBarang,  int jumlah, @JsonKey(name: 'lokasi_pengambilan')  String lokasiPengambilan,  String? lokasi, @JsonKey(name: 'region_id')  String? regionId, @JsonKey(name: 'foto_urls')  List<String> fotoUrls, @JsonKey(name: 'availability_status')  String availabilityStatus, @JsonKey(name: 'moderation_status')  String moderationStatus, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
return $default(_that.id,_that.sellerId,_that.judul,_that.deskripsi,_that.jenisBarang,_that.jumlah,_that.lokasiPengambilan,_that.lokasi,_that.regionId,_that.fotoUrls,_that.availabilityStatus,_that.moderationStatus,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondhandModel extends SecondhandModel {
  const _SecondhandModel({required this.id, @JsonKey(name: 'seller_id') required this.sellerId, required this.judul, required this.deskripsi, @JsonKey(name: 'jenis_barang') required this.jenisBarang, required this.jumlah, @JsonKey(name: 'lokasi_pengambilan') required this.lokasiPengambilan, this.lokasi, @JsonKey(name: 'region_id') this.regionId, @JsonKey(name: 'foto_urls') final  List<String> fotoUrls = const [], @JsonKey(name: 'availability_status') required this.availabilityStatus, @JsonKey(name: 'moderation_status') required this.moderationStatus, @JsonKey(name: 'created_at') required this.createdAt}): _fotoUrls = fotoUrls,super._();
  factory _SecondhandModel.fromJson(Map<String, dynamic> json) => _$SecondhandModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'seller_id') final  String sellerId;
@override final  String judul;
@override final  String deskripsi;
@override@JsonKey(name: 'jenis_barang') final  String jenisBarang;
@override final  int jumlah;
@override@JsonKey(name: 'lokasi_pengambilan') final  String lokasiPengambilan;
@override final  String? lokasi;
@override@JsonKey(name: 'region_id') final  String? regionId;
 final  List<String> _fotoUrls;
@override@JsonKey(name: 'foto_urls') List<String> get fotoUrls {
  if (_fotoUrls is EqualUnmodifiableListView) return _fotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fotoUrls);
}

@override@JsonKey(name: 'availability_status') final  String availabilityStatus;
@override@JsonKey(name: 'moderation_status') final  String moderationStatus;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandModelCopyWith<_SecondhandModel> get copyWith => __$SecondhandModelCopyWithImpl<_SecondhandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondhandModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.jenisBarang, jenisBarang) || other.jenisBarang == jenisBarang)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.lokasiPengambilan, lokasiPengambilan) || other.lokasiPengambilan == lokasiPengambilan)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&const DeepCollectionEquality().equals(other._fotoUrls, _fotoUrls)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus)&&(identical(other.moderationStatus, moderationStatus) || other.moderationStatus == moderationStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sellerId,judul,deskripsi,jenisBarang,jumlah,lokasiPengambilan,lokasi,regionId,const DeepCollectionEquality().hash(_fotoUrls),availabilityStatus,moderationStatus,createdAt);

@override
String toString() {
  return 'SecondhandModel(id: $id, sellerId: $sellerId, judul: $judul, deskripsi: $deskripsi, jenisBarang: $jenisBarang, jumlah: $jumlah, lokasiPengambilan: $lokasiPengambilan, lokasi: $lokasi, regionId: $regionId, fotoUrls: $fotoUrls, availabilityStatus: $availabilityStatus, moderationStatus: $moderationStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SecondhandModelCopyWith<$Res> implements $SecondhandModelCopyWith<$Res> {
  factory _$SecondhandModelCopyWith(_SecondhandModel value, $Res Function(_SecondhandModel) _then) = __$SecondhandModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'seller_id') String sellerId, String judul, String deskripsi,@JsonKey(name: 'jenis_barang') String jenisBarang, int jumlah,@JsonKey(name: 'lokasi_pengambilan') String lokasiPengambilan, String? lokasi,@JsonKey(name: 'region_id') String? regionId,@JsonKey(name: 'foto_urls') List<String> fotoUrls,@JsonKey(name: 'availability_status') String availabilityStatus,@JsonKey(name: 'moderation_status') String moderationStatus,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$SecondhandModelCopyWithImpl<$Res>
    implements _$SecondhandModelCopyWith<$Res> {
  __$SecondhandModelCopyWithImpl(this._self, this._then);

  final _SecondhandModel _self;
  final $Res Function(_SecondhandModel) _then;

/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sellerId = null,Object? judul = null,Object? deskripsi = null,Object? jenisBarang = null,Object? jumlah = null,Object? lokasiPengambilan = null,Object? lokasi = freezed,Object? regionId = freezed,Object? fotoUrls = null,Object? availabilityStatus = null,Object? moderationStatus = null,Object? createdAt = null,}) {
  return _then(_SecondhandModel(
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
as String,
  ));
}


}

// dart format on
