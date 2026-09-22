// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lamaran_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LamaranEntity {

 String get id; String get iklanId; String get pelamarId; String get status; DateTime get tanggal; String get jamMulai; String get jamAkhir; int get kuotaDiambil; String? get alasanBatal; DateTime? get createdAt; DateTime? get updatedAt;// Enrichment — Kelola Pelamar (list_lamaran_for_iklan) saja.
 String? get pelamarNama; String? get pelamarIklanPekerjaId; List<String>? get pelamarKeahlian; String? get pelamarFotoUrl;// Enrichment — Riwayat Aktifitas Pelamar (list_lamaran_for_pelamar) saja.
 String? get iklanJudul; String? get iklanPerusahaan; int? get iklanGajiMin; int? get iklanGajiMax; String? get iklanTipe; String? get iklanLokasi;/// Pemilik iklan — `dinilai_id` saat pelamar menilai pemberi kerja
/// (F-17, PRD §5.15, Kelompok 3 Fase 6 P6.4).
 String? get iklanPosterId;
/// Create a copy of LamaranEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LamaranEntityCopyWith<LamaranEntity> get copyWith => _$LamaranEntityCopyWithImpl<LamaranEntity>(this as LamaranEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LamaranEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.pelamarId, pelamarId) || other.pelamarId == pelamarId)&&(identical(other.status, status) || other.status == status)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.jamMulai, jamMulai) || other.jamMulai == jamMulai)&&(identical(other.jamAkhir, jamAkhir) || other.jamAkhir == jamAkhir)&&(identical(other.kuotaDiambil, kuotaDiambil) || other.kuotaDiambil == kuotaDiambil)&&(identical(other.alasanBatal, alasanBatal) || other.alasanBatal == alasanBatal)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pelamarNama, pelamarNama) || other.pelamarNama == pelamarNama)&&(identical(other.pelamarIklanPekerjaId, pelamarIklanPekerjaId) || other.pelamarIklanPekerjaId == pelamarIklanPekerjaId)&&const DeepCollectionEquality().equals(other.pelamarKeahlian, pelamarKeahlian)&&(identical(other.pelamarFotoUrl, pelamarFotoUrl) || other.pelamarFotoUrl == pelamarFotoUrl)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanPerusahaan, iklanPerusahaan) || other.iklanPerusahaan == iklanPerusahaan)&&(identical(other.iklanGajiMin, iklanGajiMin) || other.iklanGajiMin == iklanGajiMin)&&(identical(other.iklanGajiMax, iklanGajiMax) || other.iklanGajiMax == iklanGajiMax)&&(identical(other.iklanTipe, iklanTipe) || other.iklanTipe == iklanTipe)&&(identical(other.iklanLokasi, iklanLokasi) || other.iklanLokasi == iklanLokasi)&&(identical(other.iklanPosterId, iklanPosterId) || other.iklanPosterId == iklanPosterId));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,iklanId,pelamarId,status,tanggal,jamMulai,jamAkhir,kuotaDiambil,alasanBatal,createdAt,updatedAt,pelamarNama,pelamarIklanPekerjaId,const DeepCollectionEquality().hash(pelamarKeahlian),pelamarFotoUrl,iklanJudul,iklanPerusahaan,iklanGajiMin,iklanGajiMax,iklanTipe,iklanLokasi,iklanPosterId]);

@override
String toString() {
  return 'LamaranEntity(id: $id, iklanId: $iklanId, pelamarId: $pelamarId, status: $status, tanggal: $tanggal, jamMulai: $jamMulai, jamAkhir: $jamAkhir, kuotaDiambil: $kuotaDiambil, alasanBatal: $alasanBatal, createdAt: $createdAt, updatedAt: $updatedAt, pelamarNama: $pelamarNama, pelamarIklanPekerjaId: $pelamarIklanPekerjaId, pelamarKeahlian: $pelamarKeahlian, pelamarFotoUrl: $pelamarFotoUrl, iklanJudul: $iklanJudul, iklanPerusahaan: $iklanPerusahaan, iklanGajiMin: $iklanGajiMin, iklanGajiMax: $iklanGajiMax, iklanTipe: $iklanTipe, iklanLokasi: $iklanLokasi, iklanPosterId: $iklanPosterId)';
}


}

/// @nodoc
abstract mixin class $LamaranEntityCopyWith<$Res>  {
  factory $LamaranEntityCopyWith(LamaranEntity value, $Res Function(LamaranEntity) _then) = _$LamaranEntityCopyWithImpl;
@useResult
$Res call({
 String id, String iklanId, String pelamarId, String status, DateTime tanggal, String jamMulai, String jamAkhir, int kuotaDiambil, String? alasanBatal, DateTime? createdAt, DateTime? updatedAt, String? pelamarNama, String? pelamarIklanPekerjaId, List<String>? pelamarKeahlian, String? pelamarFotoUrl, String? iklanJudul, String? iklanPerusahaan, int? iklanGajiMin, int? iklanGajiMax, String? iklanTipe, String? iklanLokasi, String? iklanPosterId
});




}
/// @nodoc
class _$LamaranEntityCopyWithImpl<$Res>
    implements $LamaranEntityCopyWith<$Res> {
  _$LamaranEntityCopyWithImpl(this._self, this._then);

  final LamaranEntity _self;
  final $Res Function(LamaranEntity) _then;

/// Create a copy of LamaranEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? iklanId = null,Object? pelamarId = null,Object? status = null,Object? tanggal = null,Object? jamMulai = null,Object? jamAkhir = null,Object? kuotaDiambil = null,Object? alasanBatal = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? pelamarNama = freezed,Object? pelamarIklanPekerjaId = freezed,Object? pelamarKeahlian = freezed,Object? pelamarFotoUrl = freezed,Object? iklanJudul = freezed,Object? iklanPerusahaan = freezed,Object? iklanGajiMin = freezed,Object? iklanGajiMax = freezed,Object? iklanTipe = freezed,Object? iklanLokasi = freezed,Object? iklanPosterId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,pelamarId: null == pelamarId ? _self.pelamarId : pelamarId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as DateTime,jamMulai: null == jamMulai ? _self.jamMulai : jamMulai // ignore: cast_nullable_to_non_nullable
as String,jamAkhir: null == jamAkhir ? _self.jamAkhir : jamAkhir // ignore: cast_nullable_to_non_nullable
as String,kuotaDiambil: null == kuotaDiambil ? _self.kuotaDiambil : kuotaDiambil // ignore: cast_nullable_to_non_nullable
as int,alasanBatal: freezed == alasanBatal ? _self.alasanBatal : alasanBatal // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pelamarNama: freezed == pelamarNama ? _self.pelamarNama : pelamarNama // ignore: cast_nullable_to_non_nullable
as String?,pelamarIklanPekerjaId: freezed == pelamarIklanPekerjaId ? _self.pelamarIklanPekerjaId : pelamarIklanPekerjaId // ignore: cast_nullable_to_non_nullable
as String?,pelamarKeahlian: freezed == pelamarKeahlian ? _self.pelamarKeahlian : pelamarKeahlian // ignore: cast_nullable_to_non_nullable
as List<String>?,pelamarFotoUrl: freezed == pelamarFotoUrl ? _self.pelamarFotoUrl : pelamarFotoUrl // ignore: cast_nullable_to_non_nullable
as String?,iklanJudul: freezed == iklanJudul ? _self.iklanJudul : iklanJudul // ignore: cast_nullable_to_non_nullable
as String?,iklanPerusahaan: freezed == iklanPerusahaan ? _self.iklanPerusahaan : iklanPerusahaan // ignore: cast_nullable_to_non_nullable
as String?,iklanGajiMin: freezed == iklanGajiMin ? _self.iklanGajiMin : iklanGajiMin // ignore: cast_nullable_to_non_nullable
as int?,iklanGajiMax: freezed == iklanGajiMax ? _self.iklanGajiMax : iklanGajiMax // ignore: cast_nullable_to_non_nullable
as int?,iklanTipe: freezed == iklanTipe ? _self.iklanTipe : iklanTipe // ignore: cast_nullable_to_non_nullable
as String?,iklanLokasi: freezed == iklanLokasi ? _self.iklanLokasi : iklanLokasi // ignore: cast_nullable_to_non_nullable
as String?,iklanPosterId: freezed == iklanPosterId ? _self.iklanPosterId : iklanPosterId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LamaranEntity].
extension LamaranEntityPatterns on LamaranEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LamaranEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LamaranEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LamaranEntity value)  $default,){
final _that = this;
switch (_that) {
case _LamaranEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LamaranEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LamaranEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String iklanId,  String pelamarId,  String status,  DateTime tanggal,  String jamMulai,  String jamAkhir,  int kuotaDiambil,  String? alasanBatal,  DateTime? createdAt,  DateTime? updatedAt,  String? pelamarNama,  String? pelamarIklanPekerjaId,  List<String>? pelamarKeahlian,  String? pelamarFotoUrl,  String? iklanJudul,  String? iklanPerusahaan,  int? iklanGajiMin,  int? iklanGajiMax,  String? iklanTipe,  String? iklanLokasi,  String? iklanPosterId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LamaranEntity() when $default != null:
return $default(_that.id,_that.iklanId,_that.pelamarId,_that.status,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil,_that.alasanBatal,_that.createdAt,_that.updatedAt,_that.pelamarNama,_that.pelamarIklanPekerjaId,_that.pelamarKeahlian,_that.pelamarFotoUrl,_that.iklanJudul,_that.iklanPerusahaan,_that.iklanGajiMin,_that.iklanGajiMax,_that.iklanTipe,_that.iklanLokasi,_that.iklanPosterId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String iklanId,  String pelamarId,  String status,  DateTime tanggal,  String jamMulai,  String jamAkhir,  int kuotaDiambil,  String? alasanBatal,  DateTime? createdAt,  DateTime? updatedAt,  String? pelamarNama,  String? pelamarIklanPekerjaId,  List<String>? pelamarKeahlian,  String? pelamarFotoUrl,  String? iklanJudul,  String? iklanPerusahaan,  int? iklanGajiMin,  int? iklanGajiMax,  String? iklanTipe,  String? iklanLokasi,  String? iklanPosterId)  $default,) {final _that = this;
switch (_that) {
case _LamaranEntity():
return $default(_that.id,_that.iklanId,_that.pelamarId,_that.status,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil,_that.alasanBatal,_that.createdAt,_that.updatedAt,_that.pelamarNama,_that.pelamarIklanPekerjaId,_that.pelamarKeahlian,_that.pelamarFotoUrl,_that.iklanJudul,_that.iklanPerusahaan,_that.iklanGajiMin,_that.iklanGajiMax,_that.iklanTipe,_that.iklanLokasi,_that.iklanPosterId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String iklanId,  String pelamarId,  String status,  DateTime tanggal,  String jamMulai,  String jamAkhir,  int kuotaDiambil,  String? alasanBatal,  DateTime? createdAt,  DateTime? updatedAt,  String? pelamarNama,  String? pelamarIklanPekerjaId,  List<String>? pelamarKeahlian,  String? pelamarFotoUrl,  String? iklanJudul,  String? iklanPerusahaan,  int? iklanGajiMin,  int? iklanGajiMax,  String? iklanTipe,  String? iklanLokasi,  String? iklanPosterId)?  $default,) {final _that = this;
switch (_that) {
case _LamaranEntity() when $default != null:
return $default(_that.id,_that.iklanId,_that.pelamarId,_that.status,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil,_that.alasanBatal,_that.createdAt,_that.updatedAt,_that.pelamarNama,_that.pelamarIklanPekerjaId,_that.pelamarKeahlian,_that.pelamarFotoUrl,_that.iklanJudul,_that.iklanPerusahaan,_that.iklanGajiMin,_that.iklanGajiMax,_that.iklanTipe,_that.iklanLokasi,_that.iklanPosterId);case _:
  return null;

}
}

}

/// @nodoc


class _LamaranEntity extends LamaranEntity {
  const _LamaranEntity({required this.id, required this.iklanId, required this.pelamarId, required this.status, required this.tanggal, required this.jamMulai, required this.jamAkhir, this.kuotaDiambil = 1, this.alasanBatal, this.createdAt, this.updatedAt, this.pelamarNama, this.pelamarIklanPekerjaId, final  List<String>? pelamarKeahlian, this.pelamarFotoUrl, this.iklanJudul, this.iklanPerusahaan, this.iklanGajiMin, this.iklanGajiMax, this.iklanTipe, this.iklanLokasi, this.iklanPosterId}): _pelamarKeahlian = pelamarKeahlian,super._();
  

@override final  String id;
@override final  String iklanId;
@override final  String pelamarId;
@override final  String status;
@override final  DateTime tanggal;
@override final  String jamMulai;
@override final  String jamAkhir;
@override@JsonKey() final  int kuotaDiambil;
@override final  String? alasanBatal;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// Enrichment — Kelola Pelamar (list_lamaran_for_iklan) saja.
@override final  String? pelamarNama;
@override final  String? pelamarIklanPekerjaId;
 final  List<String>? _pelamarKeahlian;
@override List<String>? get pelamarKeahlian {
  final value = _pelamarKeahlian;
  if (value == null) return null;
  if (_pelamarKeahlian is EqualUnmodifiableListView) return _pelamarKeahlian;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? pelamarFotoUrl;
// Enrichment — Riwayat Aktifitas Pelamar (list_lamaran_for_pelamar) saja.
@override final  String? iklanJudul;
@override final  String? iklanPerusahaan;
@override final  int? iklanGajiMin;
@override final  int? iklanGajiMax;
@override final  String? iklanTipe;
@override final  String? iklanLokasi;
/// Pemilik iklan — `dinilai_id` saat pelamar menilai pemberi kerja
/// (F-17, PRD §5.15, Kelompok 3 Fase 6 P6.4).
@override final  String? iklanPosterId;

/// Create a copy of LamaranEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LamaranEntityCopyWith<_LamaranEntity> get copyWith => __$LamaranEntityCopyWithImpl<_LamaranEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LamaranEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.pelamarId, pelamarId) || other.pelamarId == pelamarId)&&(identical(other.status, status) || other.status == status)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.jamMulai, jamMulai) || other.jamMulai == jamMulai)&&(identical(other.jamAkhir, jamAkhir) || other.jamAkhir == jamAkhir)&&(identical(other.kuotaDiambil, kuotaDiambil) || other.kuotaDiambil == kuotaDiambil)&&(identical(other.alasanBatal, alasanBatal) || other.alasanBatal == alasanBatal)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pelamarNama, pelamarNama) || other.pelamarNama == pelamarNama)&&(identical(other.pelamarIklanPekerjaId, pelamarIklanPekerjaId) || other.pelamarIklanPekerjaId == pelamarIklanPekerjaId)&&const DeepCollectionEquality().equals(other._pelamarKeahlian, _pelamarKeahlian)&&(identical(other.pelamarFotoUrl, pelamarFotoUrl) || other.pelamarFotoUrl == pelamarFotoUrl)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanPerusahaan, iklanPerusahaan) || other.iklanPerusahaan == iklanPerusahaan)&&(identical(other.iklanGajiMin, iklanGajiMin) || other.iklanGajiMin == iklanGajiMin)&&(identical(other.iklanGajiMax, iklanGajiMax) || other.iklanGajiMax == iklanGajiMax)&&(identical(other.iklanTipe, iklanTipe) || other.iklanTipe == iklanTipe)&&(identical(other.iklanLokasi, iklanLokasi) || other.iklanLokasi == iklanLokasi)&&(identical(other.iklanPosterId, iklanPosterId) || other.iklanPosterId == iklanPosterId));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,iklanId,pelamarId,status,tanggal,jamMulai,jamAkhir,kuotaDiambil,alasanBatal,createdAt,updatedAt,pelamarNama,pelamarIklanPekerjaId,const DeepCollectionEquality().hash(_pelamarKeahlian),pelamarFotoUrl,iklanJudul,iklanPerusahaan,iklanGajiMin,iklanGajiMax,iklanTipe,iklanLokasi,iklanPosterId]);

@override
String toString() {
  return 'LamaranEntity(id: $id, iklanId: $iklanId, pelamarId: $pelamarId, status: $status, tanggal: $tanggal, jamMulai: $jamMulai, jamAkhir: $jamAkhir, kuotaDiambil: $kuotaDiambil, alasanBatal: $alasanBatal, createdAt: $createdAt, updatedAt: $updatedAt, pelamarNama: $pelamarNama, pelamarIklanPekerjaId: $pelamarIklanPekerjaId, pelamarKeahlian: $pelamarKeahlian, pelamarFotoUrl: $pelamarFotoUrl, iklanJudul: $iklanJudul, iklanPerusahaan: $iklanPerusahaan, iklanGajiMin: $iklanGajiMin, iklanGajiMax: $iklanGajiMax, iklanTipe: $iklanTipe, iklanLokasi: $iklanLokasi, iklanPosterId: $iklanPosterId)';
}


}

/// @nodoc
abstract mixin class _$LamaranEntityCopyWith<$Res> implements $LamaranEntityCopyWith<$Res> {
  factory _$LamaranEntityCopyWith(_LamaranEntity value, $Res Function(_LamaranEntity) _then) = __$LamaranEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String iklanId, String pelamarId, String status, DateTime tanggal, String jamMulai, String jamAkhir, int kuotaDiambil, String? alasanBatal, DateTime? createdAt, DateTime? updatedAt, String? pelamarNama, String? pelamarIklanPekerjaId, List<String>? pelamarKeahlian, String? pelamarFotoUrl, String? iklanJudul, String? iklanPerusahaan, int? iklanGajiMin, int? iklanGajiMax, String? iklanTipe, String? iklanLokasi, String? iklanPosterId
});




}
/// @nodoc
class __$LamaranEntityCopyWithImpl<$Res>
    implements _$LamaranEntityCopyWith<$Res> {
  __$LamaranEntityCopyWithImpl(this._self, this._then);

  final _LamaranEntity _self;
  final $Res Function(_LamaranEntity) _then;

/// Create a copy of LamaranEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? iklanId = null,Object? pelamarId = null,Object? status = null,Object? tanggal = null,Object? jamMulai = null,Object? jamAkhir = null,Object? kuotaDiambil = null,Object? alasanBatal = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? pelamarNama = freezed,Object? pelamarIklanPekerjaId = freezed,Object? pelamarKeahlian = freezed,Object? pelamarFotoUrl = freezed,Object? iklanJudul = freezed,Object? iklanPerusahaan = freezed,Object? iklanGajiMin = freezed,Object? iklanGajiMax = freezed,Object? iklanTipe = freezed,Object? iklanLokasi = freezed,Object? iklanPosterId = freezed,}) {
  return _then(_LamaranEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,pelamarId: null == pelamarId ? _self.pelamarId : pelamarId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as DateTime,jamMulai: null == jamMulai ? _self.jamMulai : jamMulai // ignore: cast_nullable_to_non_nullable
as String,jamAkhir: null == jamAkhir ? _self.jamAkhir : jamAkhir // ignore: cast_nullable_to_non_nullable
as String,kuotaDiambil: null == kuotaDiambil ? _self.kuotaDiambil : kuotaDiambil // ignore: cast_nullable_to_non_nullable
as int,alasanBatal: freezed == alasanBatal ? _self.alasanBatal : alasanBatal // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pelamarNama: freezed == pelamarNama ? _self.pelamarNama : pelamarNama // ignore: cast_nullable_to_non_nullable
as String?,pelamarIklanPekerjaId: freezed == pelamarIklanPekerjaId ? _self.pelamarIklanPekerjaId : pelamarIklanPekerjaId // ignore: cast_nullable_to_non_nullable
as String?,pelamarKeahlian: freezed == pelamarKeahlian ? _self._pelamarKeahlian : pelamarKeahlian // ignore: cast_nullable_to_non_nullable
as List<String>?,pelamarFotoUrl: freezed == pelamarFotoUrl ? _self.pelamarFotoUrl : pelamarFotoUrl // ignore: cast_nullable_to_non_nullable
as String?,iklanJudul: freezed == iklanJudul ? _self.iklanJudul : iklanJudul // ignore: cast_nullable_to_non_nullable
as String?,iklanPerusahaan: freezed == iklanPerusahaan ? _self.iklanPerusahaan : iklanPerusahaan // ignore: cast_nullable_to_non_nullable
as String?,iklanGajiMin: freezed == iklanGajiMin ? _self.iklanGajiMin : iklanGajiMin // ignore: cast_nullable_to_non_nullable
as int?,iklanGajiMax: freezed == iklanGajiMax ? _self.iklanGajiMax : iklanGajiMax // ignore: cast_nullable_to_non_nullable
as int?,iklanTipe: freezed == iklanTipe ? _self.iklanTipe : iklanTipe // ignore: cast_nullable_to_non_nullable
as String?,iklanLokasi: freezed == iklanLokasi ? _self.iklanLokasi : iklanLokasi // ignore: cast_nullable_to_non_nullable
as String?,iklanPosterId: freezed == iklanPosterId ? _self.iklanPosterId : iklanPosterId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
