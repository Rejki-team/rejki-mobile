// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobModel {

 String get id;@JsonKey(name: 'poster_id') String get posterId; String get judul; String get perusahaan; String get deskripsi; String? get lokasi;@JsonKey(name: 'gaji_min') int? get gajiMin;@JsonKey(name: 'gaji_max') int? get gajiMax; String get tipe;@JsonKey(name: 'foto_urls') List<String> get fotoUrls; String get status;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobModelCopyWith<JobModel> get copyWith => _$JobModelCopyWithImpl<JobModel>(this as JobModel, _$identity);

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.posterId, posterId) || other.posterId == posterId)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.perusahaan, perusahaan) || other.perusahaan == perusahaan)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.gajiMin, gajiMin) || other.gajiMin == gajiMin)&&(identical(other.gajiMax, gajiMax) || other.gajiMax == gajiMax)&&(identical(other.tipe, tipe) || other.tipe == tipe)&&const DeepCollectionEquality().equals(other.fotoUrls, fotoUrls)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,posterId,judul,perusahaan,deskripsi,lokasi,gajiMin,gajiMax,tipe,const DeepCollectionEquality().hash(fotoUrls),status,createdAt);

@override
String toString() {
  return 'JobModel(id: $id, posterId: $posterId, judul: $judul, perusahaan: $perusahaan, deskripsi: $deskripsi, lokasi: $lokasi, gajiMin: $gajiMin, gajiMax: $gajiMax, tipe: $tipe, fotoUrls: $fotoUrls, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $JobModelCopyWith<$Res>  {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) _then) = _$JobModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'poster_id') String posterId, String judul, String perusahaan, String deskripsi, String? lokasi,@JsonKey(name: 'gaji_min') int? gajiMin,@JsonKey(name: 'gaji_max') int? gajiMax, String tipe,@JsonKey(name: 'foto_urls') List<String> fotoUrls, String status,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$JobModelCopyWithImpl<$Res>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._self, this._then);

  final JobModel _self;
  final $Res Function(JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? posterId = null,Object? judul = null,Object? perusahaan = null,Object? deskripsi = null,Object? lokasi = freezed,Object? gajiMin = freezed,Object? gajiMax = freezed,Object? tipe = null,Object? fotoUrls = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,posterId: null == posterId ? _self.posterId : posterId // ignore: cast_nullable_to_non_nullable
as String,judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,perusahaan: null == perusahaan ? _self.perusahaan : perusahaan // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,lokasi: freezed == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String?,gajiMin: freezed == gajiMin ? _self.gajiMin : gajiMin // ignore: cast_nullable_to_non_nullable
as int?,gajiMax: freezed == gajiMax ? _self.gajiMax : gajiMax // ignore: cast_nullable_to_non_nullable
as int?,tipe: null == tipe ? _self.tipe : tipe // ignore: cast_nullable_to_non_nullable
as String,fotoUrls: null == fotoUrls ? _self.fotoUrls : fotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobModel].
extension JobModelPatterns on JobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobModel value)  $default,){
final _that = this;
switch (_that) {
case _JobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'poster_id')  String posterId,  String judul,  String perusahaan,  String deskripsi,  String? lokasi, @JsonKey(name: 'gaji_min')  int? gajiMin, @JsonKey(name: 'gaji_max')  int? gajiMax,  String tipe, @JsonKey(name: 'foto_urls')  List<String> fotoUrls,  String status, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.posterId,_that.judul,_that.perusahaan,_that.deskripsi,_that.lokasi,_that.gajiMin,_that.gajiMax,_that.tipe,_that.fotoUrls,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'poster_id')  String posterId,  String judul,  String perusahaan,  String deskripsi,  String? lokasi, @JsonKey(name: 'gaji_min')  int? gajiMin, @JsonKey(name: 'gaji_max')  int? gajiMax,  String tipe, @JsonKey(name: 'foto_urls')  List<String> fotoUrls,  String status, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _JobModel():
return $default(_that.id,_that.posterId,_that.judul,_that.perusahaan,_that.deskripsi,_that.lokasi,_that.gajiMin,_that.gajiMax,_that.tipe,_that.fotoUrls,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'poster_id')  String posterId,  String judul,  String perusahaan,  String deskripsi,  String? lokasi, @JsonKey(name: 'gaji_min')  int? gajiMin, @JsonKey(name: 'gaji_max')  int? gajiMax,  String tipe, @JsonKey(name: 'foto_urls')  List<String> fotoUrls,  String status, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.posterId,_that.judul,_that.perusahaan,_that.deskripsi,_that.lokasi,_that.gajiMin,_that.gajiMax,_that.tipe,_that.fotoUrls,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobModel extends JobModel {
  const _JobModel({required this.id, @JsonKey(name: 'poster_id') required this.posterId, required this.judul, required this.perusahaan, required this.deskripsi, this.lokasi, @JsonKey(name: 'gaji_min') this.gajiMin, @JsonKey(name: 'gaji_max') this.gajiMax, required this.tipe, @JsonKey(name: 'foto_urls') final  List<String> fotoUrls = const [], required this.status, @JsonKey(name: 'created_at') this.createdAt}): _fotoUrls = fotoUrls,super._();
  factory _JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'poster_id') final  String posterId;
@override final  String judul;
@override final  String perusahaan;
@override final  String deskripsi;
@override final  String? lokasi;
@override@JsonKey(name: 'gaji_min') final  int? gajiMin;
@override@JsonKey(name: 'gaji_max') final  int? gajiMax;
@override final  String tipe;
 final  List<String> _fotoUrls;
@override@JsonKey(name: 'foto_urls') List<String> get fotoUrls {
  if (_fotoUrls is EqualUnmodifiableListView) return _fotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fotoUrls);
}

@override final  String status;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobModelCopyWith<_JobModel> get copyWith => __$JobModelCopyWithImpl<_JobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.posterId, posterId) || other.posterId == posterId)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.perusahaan, perusahaan) || other.perusahaan == perusahaan)&&(identical(other.deskripsi, deskripsi) || other.deskripsi == deskripsi)&&(identical(other.lokasi, lokasi) || other.lokasi == lokasi)&&(identical(other.gajiMin, gajiMin) || other.gajiMin == gajiMin)&&(identical(other.gajiMax, gajiMax) || other.gajiMax == gajiMax)&&(identical(other.tipe, tipe) || other.tipe == tipe)&&const DeepCollectionEquality().equals(other._fotoUrls, _fotoUrls)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,posterId,judul,perusahaan,deskripsi,lokasi,gajiMin,gajiMax,tipe,const DeepCollectionEquality().hash(_fotoUrls),status,createdAt);

@override
String toString() {
  return 'JobModel(id: $id, posterId: $posterId, judul: $judul, perusahaan: $perusahaan, deskripsi: $deskripsi, lokasi: $lokasi, gajiMin: $gajiMin, gajiMax: $gajiMax, tipe: $tipe, fotoUrls: $fotoUrls, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JobModelCopyWith<$Res> implements $JobModelCopyWith<$Res> {
  factory _$JobModelCopyWith(_JobModel value, $Res Function(_JobModel) _then) = __$JobModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'poster_id') String posterId, String judul, String perusahaan, String deskripsi, String? lokasi,@JsonKey(name: 'gaji_min') int? gajiMin,@JsonKey(name: 'gaji_max') int? gajiMax, String tipe,@JsonKey(name: 'foto_urls') List<String> fotoUrls, String status,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$JobModelCopyWithImpl<$Res>
    implements _$JobModelCopyWith<$Res> {
  __$JobModelCopyWithImpl(this._self, this._then);

  final _JobModel _self;
  final $Res Function(_JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? posterId = null,Object? judul = null,Object? perusahaan = null,Object? deskripsi = null,Object? lokasi = freezed,Object? gajiMin = freezed,Object? gajiMax = freezed,Object? tipe = null,Object? fotoUrls = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_JobModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,posterId: null == posterId ? _self.posterId : posterId // ignore: cast_nullable_to_non_nullable
as String,judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,perusahaan: null == perusahaan ? _self.perusahaan : perusahaan // ignore: cast_nullable_to_non_nullable
as String,deskripsi: null == deskripsi ? _self.deskripsi : deskripsi // ignore: cast_nullable_to_non_nullable
as String,lokasi: freezed == lokasi ? _self.lokasi : lokasi // ignore: cast_nullable_to_non_nullable
as String?,gajiMin: freezed == gajiMin ? _self.gajiMin : gajiMin // ignore: cast_nullable_to_non_nullable
as int?,gajiMax: freezed == gajiMax ? _self.gajiMax : gajiMax // ignore: cast_nullable_to_non_nullable
as int?,tipe: null == tipe ? _self.tipe : tipe // ignore: cast_nullable_to_non_nullable
as String,fotoUrls: null == fotoUrls ? _self._fotoUrls : fotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
