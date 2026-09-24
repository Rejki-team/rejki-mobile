// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_job_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateJobParams {

/// Judul Pekerjaan
 String get title;/// Nama perusahaan/pemberi kerja — backend `rejki-app` mewajibkan field
/// ini (`perusahaan`, min 2 karakter) tapi TIDAK ADA form field khusus
/// untuk ini di UI create_job (di luar scope Kelompok 3 Phase 2, hanya
/// perbaikan path+field mapping) — `CreateJobBloc` default ke [title]
/// bila kosong/null. Gap dicatat, bukan diperbaiki penuh.
 String? get perusahaan;/// Deskripsi Pekerjaan
 String get jobDesc;/// Syarat Pekerjaan
 String get requirements;/// Upah Pekerjaan (input currency amount)
 int get salary;/// Tipe Upah Pekerjaan (dropdown value: e.g., "hourly", "daily", "project")
 String get salaryOfWorker;/// Jumlah Pekerja yang di Butuhkan
 int get numberOfWorker;/// Waktu Pekerjaan (format: YYYY-MM-DD HH:mm:ss)
 String get dateOfJob;/// Alamat Lokasi Pekerjaan
 String get address;/// Lokasi Detail - Provinsi
 String get province;/// Lokasi Detail - Kota/Kabupaten
 String get city;/// Lokasi Detail - Kecamatan
 String get subdistrict;/// Lokasi Detail - Kelurahan
 String get ward;/// Alamat Lokasi Pekerjaan - Desa/Kampung
 String get village;/// Foto Pekerjaan
 List<File> get images;/// Latitude koordinat perangkat (opsional — bisa null jika GPS tidak tersedia)
 double? get latitude;/// Longitude koordinat perangkat (opsional — bisa null jika GPS tidak tersedia)
 double? get longitude;
/// Create a copy of CreateJobParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateJobParamsCopyWith<CreateJobParams> get copyWith => _$CreateJobParamsCopyWithImpl<CreateJobParams>(this as CreateJobParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateJobParams&&(identical(other.title, title) || other.title == title)&&(identical(other.perusahaan, perusahaan) || other.perusahaan == perusahaan)&&(identical(other.jobDesc, jobDesc) || other.jobDesc == jobDesc)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryOfWorker, salaryOfWorker) || other.salaryOfWorker == salaryOfWorker)&&(identical(other.numberOfWorker, numberOfWorker) || other.numberOfWorker == numberOfWorker)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,title,perusahaan,jobDesc,requirements,salary,salaryOfWorker,numberOfWorker,dateOfJob,address,province,city,subdistrict,ward,village,const DeepCollectionEquality().hash(images),latitude,longitude);

@override
String toString() {
  return 'CreateJobParams(title: $title, perusahaan: $perusahaan, jobDesc: $jobDesc, requirements: $requirements, salary: $salary, salaryOfWorker: $salaryOfWorker, numberOfWorker: $numberOfWorker, dateOfJob: $dateOfJob, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, images: $images, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CreateJobParamsCopyWith<$Res>  {
  factory $CreateJobParamsCopyWith(CreateJobParams value, $Res Function(CreateJobParams) _then) = _$CreateJobParamsCopyWithImpl;
@useResult
$Res call({
 String title, String? perusahaan, String jobDesc, String requirements, int salary, String salaryOfWorker, int numberOfWorker, String dateOfJob, String address, String province, String city, String subdistrict, String ward, String village, List<File> images, double? latitude, double? longitude
});




}
/// @nodoc
class _$CreateJobParamsCopyWithImpl<$Res>
    implements $CreateJobParamsCopyWith<$Res> {
  _$CreateJobParamsCopyWithImpl(this._self, this._then);

  final CreateJobParams _self;
  final $Res Function(CreateJobParams) _then;

/// Create a copy of CreateJobParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? perusahaan = freezed,Object? jobDesc = null,Object? requirements = null,Object? salary = null,Object? salaryOfWorker = null,Object? numberOfWorker = null,Object? dateOfJob = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? images = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,perusahaan: freezed == perusahaan ? _self.perusahaan : perusahaan // ignore: cast_nullable_to_non_nullable
as String?,jobDesc: null == jobDesc ? _self.jobDesc : jobDesc // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as int,salaryOfWorker: null == salaryOfWorker ? _self.salaryOfWorker : salaryOfWorker // ignore: cast_nullable_to_non_nullable
as String,numberOfWorker: null == numberOfWorker ? _self.numberOfWorker : numberOfWorker // ignore: cast_nullable_to_non_nullable
as int,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<File>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateJobParams].
extension CreateJobParamsPatterns on CreateJobParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateJobParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateJobParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateJobParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateJobParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateJobParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateJobParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? perusahaan,  String jobDesc,  String requirements,  int salary,  String salaryOfWorker,  int numberOfWorker,  String dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  List<File> images,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateJobParams() when $default != null:
return $default(_that.title,_that.perusahaan,_that.jobDesc,_that.requirements,_that.salary,_that.salaryOfWorker,_that.numberOfWorker,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.images,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? perusahaan,  String jobDesc,  String requirements,  int salary,  String salaryOfWorker,  int numberOfWorker,  String dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  List<File> images,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _CreateJobParams():
return $default(_that.title,_that.perusahaan,_that.jobDesc,_that.requirements,_that.salary,_that.salaryOfWorker,_that.numberOfWorker,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.images,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? perusahaan,  String jobDesc,  String requirements,  int salary,  String salaryOfWorker,  int numberOfWorker,  String dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  List<File> images,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _CreateJobParams() when $default != null:
return $default(_that.title,_that.perusahaan,_that.jobDesc,_that.requirements,_that.salary,_that.salaryOfWorker,_that.numberOfWorker,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.images,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _CreateJobParams extends CreateJobParams {
  const _CreateJobParams({required this.title, this.perusahaan, required this.jobDesc, required this.requirements, required this.salary, required this.salaryOfWorker, required this.numberOfWorker, required this.dateOfJob, required this.address, required this.province, required this.city, required this.subdistrict, required this.ward, required this.village, required final  List<File> images, this.latitude, this.longitude}): _images = images,super._();
  

/// Judul Pekerjaan
@override final  String title;
/// Nama perusahaan/pemberi kerja — backend `rejki-app` mewajibkan field
/// ini (`perusahaan`, min 2 karakter) tapi TIDAK ADA form field khusus
/// untuk ini di UI create_job (di luar scope Kelompok 3 Phase 2, hanya
/// perbaikan path+field mapping) — `CreateJobBloc` default ke [title]
/// bila kosong/null. Gap dicatat, bukan diperbaiki penuh.
@override final  String? perusahaan;
/// Deskripsi Pekerjaan
@override final  String jobDesc;
/// Syarat Pekerjaan
@override final  String requirements;
/// Upah Pekerjaan (input currency amount)
@override final  int salary;
/// Tipe Upah Pekerjaan (dropdown value: e.g., "hourly", "daily", "project")
@override final  String salaryOfWorker;
/// Jumlah Pekerja yang di Butuhkan
@override final  int numberOfWorker;
/// Waktu Pekerjaan (format: YYYY-MM-DD HH:mm:ss)
@override final  String dateOfJob;
/// Alamat Lokasi Pekerjaan
@override final  String address;
/// Lokasi Detail - Provinsi
@override final  String province;
/// Lokasi Detail - Kota/Kabupaten
@override final  String city;
/// Lokasi Detail - Kecamatan
@override final  String subdistrict;
/// Lokasi Detail - Kelurahan
@override final  String ward;
/// Alamat Lokasi Pekerjaan - Desa/Kampung
@override final  String village;
/// Foto Pekerjaan
 final  List<File> _images;
/// Foto Pekerjaan
@override List<File> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// Latitude koordinat perangkat (opsional — bisa null jika GPS tidak tersedia)
@override final  double? latitude;
/// Longitude koordinat perangkat (opsional — bisa null jika GPS tidak tersedia)
@override final  double? longitude;

/// Create a copy of CreateJobParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateJobParamsCopyWith<_CreateJobParams> get copyWith => __$CreateJobParamsCopyWithImpl<_CreateJobParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateJobParams&&(identical(other.title, title) || other.title == title)&&(identical(other.perusahaan, perusahaan) || other.perusahaan == perusahaan)&&(identical(other.jobDesc, jobDesc) || other.jobDesc == jobDesc)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryOfWorker, salaryOfWorker) || other.salaryOfWorker == salaryOfWorker)&&(identical(other.numberOfWorker, numberOfWorker) || other.numberOfWorker == numberOfWorker)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,title,perusahaan,jobDesc,requirements,salary,salaryOfWorker,numberOfWorker,dateOfJob,address,province,city,subdistrict,ward,village,const DeepCollectionEquality().hash(_images),latitude,longitude);

@override
String toString() {
  return 'CreateJobParams(title: $title, perusahaan: $perusahaan, jobDesc: $jobDesc, requirements: $requirements, salary: $salary, salaryOfWorker: $salaryOfWorker, numberOfWorker: $numberOfWorker, dateOfJob: $dateOfJob, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, images: $images, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CreateJobParamsCopyWith<$Res> implements $CreateJobParamsCopyWith<$Res> {
  factory _$CreateJobParamsCopyWith(_CreateJobParams value, $Res Function(_CreateJobParams) _then) = __$CreateJobParamsCopyWithImpl;
@override @useResult
$Res call({
 String title, String? perusahaan, String jobDesc, String requirements, int salary, String salaryOfWorker, int numberOfWorker, String dateOfJob, String address, String province, String city, String subdistrict, String ward, String village, List<File> images, double? latitude, double? longitude
});




}
/// @nodoc
class __$CreateJobParamsCopyWithImpl<$Res>
    implements _$CreateJobParamsCopyWith<$Res> {
  __$CreateJobParamsCopyWithImpl(this._self, this._then);

  final _CreateJobParams _self;
  final $Res Function(_CreateJobParams) _then;

/// Create a copy of CreateJobParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? perusahaan = freezed,Object? jobDesc = null,Object? requirements = null,Object? salary = null,Object? salaryOfWorker = null,Object? numberOfWorker = null,Object? dateOfJob = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? images = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_CreateJobParams(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,perusahaan: freezed == perusahaan ? _self.perusahaan : perusahaan // ignore: cast_nullable_to_non_nullable
as String?,jobDesc: null == jobDesc ? _self.jobDesc : jobDesc // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as int,salaryOfWorker: null == salaryOfWorker ? _self.salaryOfWorker : salaryOfWorker // ignore: cast_nullable_to_non_nullable
as String,numberOfWorker: null == numberOfWorker ? _self.numberOfWorker : numberOfWorker // ignore: cast_nullable_to_non_nullable
as int,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<File>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
