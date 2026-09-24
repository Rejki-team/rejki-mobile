// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lamaran_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LamaranModel {

 String get id;@JsonKey(name: 'iklan_id') String get iklanId;@JsonKey(name: 'pelamar_id') String get pelamarId; String get status; String get tanggal;@JsonKey(name: 'jam_mulai') String get jamMulai;@JsonKey(name: 'jam_akhir') String get jamAkhir;@JsonKey(name: 'kuota_diambil') int get kuotaDiambil;@JsonKey(name: 'alasan_batal') String? get alasanBatal;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'pelamar_nama') String? get pelamarNama;@JsonKey(name: 'pelamar_iklan_pekerja_id') String? get pelamarIklanPekerjaId;@JsonKey(name: 'pelamar_keahlian') List<String>? get pelamarKeahlian;@JsonKey(name: 'pelamar_foto_url') String? get pelamarFotoUrl;@JsonKey(name: 'iklan_judul') String? get iklanJudul;@JsonKey(name: 'iklan_perusahaan') String? get iklanPerusahaan;@JsonKey(name: 'iklan_gaji_min') int? get iklanGajiMin;@JsonKey(name: 'iklan_gaji_max') int? get iklanGajiMax;@JsonKey(name: 'iklan_tipe') String? get iklanTipe;@JsonKey(name: 'iklan_lokasi') String? get iklanLokasi;@JsonKey(name: 'iklan_poster_id') String? get iklanPosterId;
/// Create a copy of LamaranModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LamaranModelCopyWith<LamaranModel> get copyWith => _$LamaranModelCopyWithImpl<LamaranModel>(this as LamaranModel, _$identity);

  /// Serializes this LamaranModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LamaranModel&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.pelamarId, pelamarId) || other.pelamarId == pelamarId)&&(identical(other.status, status) || other.status == status)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.jamMulai, jamMulai) || other.jamMulai == jamMulai)&&(identical(other.jamAkhir, jamAkhir) || other.jamAkhir == jamAkhir)&&(identical(other.kuotaDiambil, kuotaDiambil) || other.kuotaDiambil == kuotaDiambil)&&(identical(other.alasanBatal, alasanBatal) || other.alasanBatal == alasanBatal)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pelamarNama, pelamarNama) || other.pelamarNama == pelamarNama)&&(identical(other.pelamarIklanPekerjaId, pelamarIklanPekerjaId) || other.pelamarIklanPekerjaId == pelamarIklanPekerjaId)&&const DeepCollectionEquality().equals(other.pelamarKeahlian, pelamarKeahlian)&&(identical(other.pelamarFotoUrl, pelamarFotoUrl) || other.pelamarFotoUrl == pelamarFotoUrl)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanPerusahaan, iklanPerusahaan) || other.iklanPerusahaan == iklanPerusahaan)&&(identical(other.iklanGajiMin, iklanGajiMin) || other.iklanGajiMin == iklanGajiMin)&&(identical(other.iklanGajiMax, iklanGajiMax) || other.iklanGajiMax == iklanGajiMax)&&(identical(other.iklanTipe, iklanTipe) || other.iklanTipe == iklanTipe)&&(identical(other.iklanLokasi, iklanLokasi) || other.iklanLokasi == iklanLokasi)&&(identical(other.iklanPosterId, iklanPosterId) || other.iklanPosterId == iklanPosterId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,iklanId,pelamarId,status,tanggal,jamMulai,jamAkhir,kuotaDiambil,alasanBatal,createdAt,updatedAt,pelamarNama,pelamarIklanPekerjaId,const DeepCollectionEquality().hash(pelamarKeahlian),pelamarFotoUrl,iklanJudul,iklanPerusahaan,iklanGajiMin,iklanGajiMax,iklanTipe,iklanLokasi,iklanPosterId]);

@override
String toString() {
  return 'LamaranModel(id: $id, iklanId: $iklanId, pelamarId: $pelamarId, status: $status, tanggal: $tanggal, jamMulai: $jamMulai, jamAkhir: $jamAkhir, kuotaDiambil: $kuotaDiambil, alasanBatal: $alasanBatal, createdAt: $createdAt, updatedAt: $updatedAt, pelamarNama: $pelamarNama, pelamarIklanPekerjaId: $pelamarIklanPekerjaId, pelamarKeahlian: $pelamarKeahlian, pelamarFotoUrl: $pelamarFotoUrl, iklanJudul: $iklanJudul, iklanPerusahaan: $iklanPerusahaan, iklanGajiMin: $iklanGajiMin, iklanGajiMax: $iklanGajiMax, iklanTipe: $iklanTipe, iklanLokasi: $iklanLokasi, iklanPosterId: $iklanPosterId)';
}


}

/// @nodoc
abstract mixin class $LamaranModelCopyWith<$Res>  {
  factory $LamaranModelCopyWith(LamaranModel value, $Res Function(LamaranModel) _then) = _$LamaranModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'iklan_id') String iklanId,@JsonKey(name: 'pelamar_id') String pelamarId, String status, String tanggal,@JsonKey(name: 'jam_mulai') String jamMulai,@JsonKey(name: 'jam_akhir') String jamAkhir,@JsonKey(name: 'kuota_diambil') int kuotaDiambil,@JsonKey(name: 'alasan_batal') String? alasanBatal,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'pelamar_nama') String? pelamarNama,@JsonKey(name: 'pelamar_iklan_pekerja_id') String? pelamarIklanPekerjaId,@JsonKey(name: 'pelamar_keahlian') List<String>? pelamarKeahlian,@JsonKey(name: 'pelamar_foto_url') String? pelamarFotoUrl,@JsonKey(name: 'iklan_judul') String? iklanJudul,@JsonKey(name: 'iklan_perusahaan') String? iklanPerusahaan,@JsonKey(name: 'iklan_gaji_min') int? iklanGajiMin,@JsonKey(name: 'iklan_gaji_max') int? iklanGajiMax,@JsonKey(name: 'iklan_tipe') String? iklanTipe,@JsonKey(name: 'iklan_lokasi') String? iklanLokasi,@JsonKey(name: 'iklan_poster_id') String? iklanPosterId
});




}
/// @nodoc
class _$LamaranModelCopyWithImpl<$Res>
    implements $LamaranModelCopyWith<$Res> {
  _$LamaranModelCopyWithImpl(this._self, this._then);

  final LamaranModel _self;
  final $Res Function(LamaranModel) _then;

/// Create a copy of LamaranModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? iklanId = null,Object? pelamarId = null,Object? status = null,Object? tanggal = null,Object? jamMulai = null,Object? jamAkhir = null,Object? kuotaDiambil = null,Object? alasanBatal = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? pelamarNama = freezed,Object? pelamarIklanPekerjaId = freezed,Object? pelamarKeahlian = freezed,Object? pelamarFotoUrl = freezed,Object? iklanJudul = freezed,Object? iklanPerusahaan = freezed,Object? iklanGajiMin = freezed,Object? iklanGajiMax = freezed,Object? iklanTipe = freezed,Object? iklanLokasi = freezed,Object? iklanPosterId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,pelamarId: null == pelamarId ? _self.pelamarId : pelamarId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,jamMulai: null == jamMulai ? _self.jamMulai : jamMulai // ignore: cast_nullable_to_non_nullable
as String,jamAkhir: null == jamAkhir ? _self.jamAkhir : jamAkhir // ignore: cast_nullable_to_non_nullable
as String,kuotaDiambil: null == kuotaDiambil ? _self.kuotaDiambil : kuotaDiambil // ignore: cast_nullable_to_non_nullable
as int,alasanBatal: freezed == alasanBatal ? _self.alasanBatal : alasanBatal // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,pelamarNama: freezed == pelamarNama ? _self.pelamarNama : pelamarNama // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [LamaranModel].
extension LamaranModelPatterns on LamaranModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LamaranModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LamaranModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LamaranModel value)  $default,){
final _that = this;
switch (_that) {
case _LamaranModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LamaranModel value)?  $default,){
final _that = this;
switch (_that) {
case _LamaranModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'iklan_id')  String iklanId, @JsonKey(name: 'pelamar_id')  String pelamarId,  String status,  String tanggal, @JsonKey(name: 'jam_mulai')  String jamMulai, @JsonKey(name: 'jam_akhir')  String jamAkhir, @JsonKey(name: 'kuota_diambil')  int kuotaDiambil, @JsonKey(name: 'alasan_batal')  String? alasanBatal, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'pelamar_nama')  String? pelamarNama, @JsonKey(name: 'pelamar_iklan_pekerja_id')  String? pelamarIklanPekerjaId, @JsonKey(name: 'pelamar_keahlian')  List<String>? pelamarKeahlian, @JsonKey(name: 'pelamar_foto_url')  String? pelamarFotoUrl, @JsonKey(name: 'iklan_judul')  String? iklanJudul, @JsonKey(name: 'iklan_perusahaan')  String? iklanPerusahaan, @JsonKey(name: 'iklan_gaji_min')  int? iklanGajiMin, @JsonKey(name: 'iklan_gaji_max')  int? iklanGajiMax, @JsonKey(name: 'iklan_tipe')  String? iklanTipe, @JsonKey(name: 'iklan_lokasi')  String? iklanLokasi, @JsonKey(name: 'iklan_poster_id')  String? iklanPosterId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LamaranModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'iklan_id')  String iklanId, @JsonKey(name: 'pelamar_id')  String pelamarId,  String status,  String tanggal, @JsonKey(name: 'jam_mulai')  String jamMulai, @JsonKey(name: 'jam_akhir')  String jamAkhir, @JsonKey(name: 'kuota_diambil')  int kuotaDiambil, @JsonKey(name: 'alasan_batal')  String? alasanBatal, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'pelamar_nama')  String? pelamarNama, @JsonKey(name: 'pelamar_iklan_pekerja_id')  String? pelamarIklanPekerjaId, @JsonKey(name: 'pelamar_keahlian')  List<String>? pelamarKeahlian, @JsonKey(name: 'pelamar_foto_url')  String? pelamarFotoUrl, @JsonKey(name: 'iklan_judul')  String? iklanJudul, @JsonKey(name: 'iklan_perusahaan')  String? iklanPerusahaan, @JsonKey(name: 'iklan_gaji_min')  int? iklanGajiMin, @JsonKey(name: 'iklan_gaji_max')  int? iklanGajiMax, @JsonKey(name: 'iklan_tipe')  String? iklanTipe, @JsonKey(name: 'iklan_lokasi')  String? iklanLokasi, @JsonKey(name: 'iklan_poster_id')  String? iklanPosterId)  $default,) {final _that = this;
switch (_that) {
case _LamaranModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'iklan_id')  String iklanId, @JsonKey(name: 'pelamar_id')  String pelamarId,  String status,  String tanggal, @JsonKey(name: 'jam_mulai')  String jamMulai, @JsonKey(name: 'jam_akhir')  String jamAkhir, @JsonKey(name: 'kuota_diambil')  int kuotaDiambil, @JsonKey(name: 'alasan_batal')  String? alasanBatal, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'pelamar_nama')  String? pelamarNama, @JsonKey(name: 'pelamar_iklan_pekerja_id')  String? pelamarIklanPekerjaId, @JsonKey(name: 'pelamar_keahlian')  List<String>? pelamarKeahlian, @JsonKey(name: 'pelamar_foto_url')  String? pelamarFotoUrl, @JsonKey(name: 'iklan_judul')  String? iklanJudul, @JsonKey(name: 'iklan_perusahaan')  String? iklanPerusahaan, @JsonKey(name: 'iklan_gaji_min')  int? iklanGajiMin, @JsonKey(name: 'iklan_gaji_max')  int? iklanGajiMax, @JsonKey(name: 'iklan_tipe')  String? iklanTipe, @JsonKey(name: 'iklan_lokasi')  String? iklanLokasi, @JsonKey(name: 'iklan_poster_id')  String? iklanPosterId)?  $default,) {final _that = this;
switch (_that) {
case _LamaranModel() when $default != null:
return $default(_that.id,_that.iklanId,_that.pelamarId,_that.status,_that.tanggal,_that.jamMulai,_that.jamAkhir,_that.kuotaDiambil,_that.alasanBatal,_that.createdAt,_that.updatedAt,_that.pelamarNama,_that.pelamarIklanPekerjaId,_that.pelamarKeahlian,_that.pelamarFotoUrl,_that.iklanJudul,_that.iklanPerusahaan,_that.iklanGajiMin,_that.iklanGajiMax,_that.iklanTipe,_that.iklanLokasi,_that.iklanPosterId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LamaranModel extends LamaranModel {
  const _LamaranModel({required this.id, @JsonKey(name: 'iklan_id') required this.iklanId, @JsonKey(name: 'pelamar_id') required this.pelamarId, required this.status, required this.tanggal, @JsonKey(name: 'jam_mulai') required this.jamMulai, @JsonKey(name: 'jam_akhir') required this.jamAkhir, @JsonKey(name: 'kuota_diambil') this.kuotaDiambil = 1, @JsonKey(name: 'alasan_batal') this.alasanBatal, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'pelamar_nama') this.pelamarNama, @JsonKey(name: 'pelamar_iklan_pekerja_id') this.pelamarIklanPekerjaId, @JsonKey(name: 'pelamar_keahlian') final  List<String>? pelamarKeahlian, @JsonKey(name: 'pelamar_foto_url') this.pelamarFotoUrl, @JsonKey(name: 'iklan_judul') this.iklanJudul, @JsonKey(name: 'iklan_perusahaan') this.iklanPerusahaan, @JsonKey(name: 'iklan_gaji_min') this.iklanGajiMin, @JsonKey(name: 'iklan_gaji_max') this.iklanGajiMax, @JsonKey(name: 'iklan_tipe') this.iklanTipe, @JsonKey(name: 'iklan_lokasi') this.iklanLokasi, @JsonKey(name: 'iklan_poster_id') this.iklanPosterId}): _pelamarKeahlian = pelamarKeahlian,super._();
  factory _LamaranModel.fromJson(Map<String, dynamic> json) => _$LamaranModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'iklan_id') final  String iklanId;
@override@JsonKey(name: 'pelamar_id') final  String pelamarId;
@override final  String status;
@override final  String tanggal;
@override@JsonKey(name: 'jam_mulai') final  String jamMulai;
@override@JsonKey(name: 'jam_akhir') final  String jamAkhir;
@override@JsonKey(name: 'kuota_diambil') final  int kuotaDiambil;
@override@JsonKey(name: 'alasan_batal') final  String? alasanBatal;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'pelamar_nama') final  String? pelamarNama;
@override@JsonKey(name: 'pelamar_iklan_pekerja_id') final  String? pelamarIklanPekerjaId;
 final  List<String>? _pelamarKeahlian;
@override@JsonKey(name: 'pelamar_keahlian') List<String>? get pelamarKeahlian {
  final value = _pelamarKeahlian;
  if (value == null) return null;
  if (_pelamarKeahlian is EqualUnmodifiableListView) return _pelamarKeahlian;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'pelamar_foto_url') final  String? pelamarFotoUrl;
@override@JsonKey(name: 'iklan_judul') final  String? iklanJudul;
@override@JsonKey(name: 'iklan_perusahaan') final  String? iklanPerusahaan;
@override@JsonKey(name: 'iklan_gaji_min') final  int? iklanGajiMin;
@override@JsonKey(name: 'iklan_gaji_max') final  int? iklanGajiMax;
@override@JsonKey(name: 'iklan_tipe') final  String? iklanTipe;
@override@JsonKey(name: 'iklan_lokasi') final  String? iklanLokasi;
@override@JsonKey(name: 'iklan_poster_id') final  String? iklanPosterId;

/// Create a copy of LamaranModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LamaranModelCopyWith<_LamaranModel> get copyWith => __$LamaranModelCopyWithImpl<_LamaranModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LamaranModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LamaranModel&&(identical(other.id, id) || other.id == id)&&(identical(other.iklanId, iklanId) || other.iklanId == iklanId)&&(identical(other.pelamarId, pelamarId) || other.pelamarId == pelamarId)&&(identical(other.status, status) || other.status == status)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.jamMulai, jamMulai) || other.jamMulai == jamMulai)&&(identical(other.jamAkhir, jamAkhir) || other.jamAkhir == jamAkhir)&&(identical(other.kuotaDiambil, kuotaDiambil) || other.kuotaDiambil == kuotaDiambil)&&(identical(other.alasanBatal, alasanBatal) || other.alasanBatal == alasanBatal)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pelamarNama, pelamarNama) || other.pelamarNama == pelamarNama)&&(identical(other.pelamarIklanPekerjaId, pelamarIklanPekerjaId) || other.pelamarIklanPekerjaId == pelamarIklanPekerjaId)&&const DeepCollectionEquality().equals(other._pelamarKeahlian, _pelamarKeahlian)&&(identical(other.pelamarFotoUrl, pelamarFotoUrl) || other.pelamarFotoUrl == pelamarFotoUrl)&&(identical(other.iklanJudul, iklanJudul) || other.iklanJudul == iklanJudul)&&(identical(other.iklanPerusahaan, iklanPerusahaan) || other.iklanPerusahaan == iklanPerusahaan)&&(identical(other.iklanGajiMin, iklanGajiMin) || other.iklanGajiMin == iklanGajiMin)&&(identical(other.iklanGajiMax, iklanGajiMax) || other.iklanGajiMax == iklanGajiMax)&&(identical(other.iklanTipe, iklanTipe) || other.iklanTipe == iklanTipe)&&(identical(other.iklanLokasi, iklanLokasi) || other.iklanLokasi == iklanLokasi)&&(identical(other.iklanPosterId, iklanPosterId) || other.iklanPosterId == iklanPosterId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,iklanId,pelamarId,status,tanggal,jamMulai,jamAkhir,kuotaDiambil,alasanBatal,createdAt,updatedAt,pelamarNama,pelamarIklanPekerjaId,const DeepCollectionEquality().hash(_pelamarKeahlian),pelamarFotoUrl,iklanJudul,iklanPerusahaan,iklanGajiMin,iklanGajiMax,iklanTipe,iklanLokasi,iklanPosterId]);

@override
String toString() {
  return 'LamaranModel(id: $id, iklanId: $iklanId, pelamarId: $pelamarId, status: $status, tanggal: $tanggal, jamMulai: $jamMulai, jamAkhir: $jamAkhir, kuotaDiambil: $kuotaDiambil, alasanBatal: $alasanBatal, createdAt: $createdAt, updatedAt: $updatedAt, pelamarNama: $pelamarNama, pelamarIklanPekerjaId: $pelamarIklanPekerjaId, pelamarKeahlian: $pelamarKeahlian, pelamarFotoUrl: $pelamarFotoUrl, iklanJudul: $iklanJudul, iklanPerusahaan: $iklanPerusahaan, iklanGajiMin: $iklanGajiMin, iklanGajiMax: $iklanGajiMax, iklanTipe: $iklanTipe, iklanLokasi: $iklanLokasi, iklanPosterId: $iklanPosterId)';
}


}

/// @nodoc
abstract mixin class _$LamaranModelCopyWith<$Res> implements $LamaranModelCopyWith<$Res> {
  factory _$LamaranModelCopyWith(_LamaranModel value, $Res Function(_LamaranModel) _then) = __$LamaranModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'iklan_id') String iklanId,@JsonKey(name: 'pelamar_id') String pelamarId, String status, String tanggal,@JsonKey(name: 'jam_mulai') String jamMulai,@JsonKey(name: 'jam_akhir') String jamAkhir,@JsonKey(name: 'kuota_diambil') int kuotaDiambil,@JsonKey(name: 'alasan_batal') String? alasanBatal,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'pelamar_nama') String? pelamarNama,@JsonKey(name: 'pelamar_iklan_pekerja_id') String? pelamarIklanPekerjaId,@JsonKey(name: 'pelamar_keahlian') List<String>? pelamarKeahlian,@JsonKey(name: 'pelamar_foto_url') String? pelamarFotoUrl,@JsonKey(name: 'iklan_judul') String? iklanJudul,@JsonKey(name: 'iklan_perusahaan') String? iklanPerusahaan,@JsonKey(name: 'iklan_gaji_min') int? iklanGajiMin,@JsonKey(name: 'iklan_gaji_max') int? iklanGajiMax,@JsonKey(name: 'iklan_tipe') String? iklanTipe,@JsonKey(name: 'iklan_lokasi') String? iklanLokasi,@JsonKey(name: 'iklan_poster_id') String? iklanPosterId
});




}
/// @nodoc
class __$LamaranModelCopyWithImpl<$Res>
    implements _$LamaranModelCopyWith<$Res> {
  __$LamaranModelCopyWithImpl(this._self, this._then);

  final _LamaranModel _self;
  final $Res Function(_LamaranModel) _then;

/// Create a copy of LamaranModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? iklanId = null,Object? pelamarId = null,Object? status = null,Object? tanggal = null,Object? jamMulai = null,Object? jamAkhir = null,Object? kuotaDiambil = null,Object? alasanBatal = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? pelamarNama = freezed,Object? pelamarIklanPekerjaId = freezed,Object? pelamarKeahlian = freezed,Object? pelamarFotoUrl = freezed,Object? iklanJudul = freezed,Object? iklanPerusahaan = freezed,Object? iklanGajiMin = freezed,Object? iklanGajiMax = freezed,Object? iklanTipe = freezed,Object? iklanLokasi = freezed,Object? iklanPosterId = freezed,}) {
  return _then(_LamaranModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iklanId: null == iklanId ? _self.iklanId : iklanId // ignore: cast_nullable_to_non_nullable
as String,pelamarId: null == pelamarId ? _self.pelamarId : pelamarId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,jamMulai: null == jamMulai ? _self.jamMulai : jamMulai // ignore: cast_nullable_to_non_nullable
as String,jamAkhir: null == jamAkhir ? _self.jamAkhir : jamAkhir // ignore: cast_nullable_to_non_nullable
as String,kuotaDiambil: null == kuotaDiambil ? _self.kuotaDiambil : kuotaDiambil // ignore: cast_nullable_to_non_nullable
as int,alasanBatal: freezed == alasanBatal ? _self.alasanBatal : alasanBatal // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,pelamarNama: freezed == pelamarNama ? _self.pelamarNama : pelamarNama // ignore: cast_nullable_to_non_nullable
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
