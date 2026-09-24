// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobEntity {

/// Unique job identifier
 String get id;/// Advertisement code from API (e.g., "17/03/2026/1773725269")
 String get adCode;/// User ID who posted the job
 String get userId;/// Job title
 String get title;/// Job description
 String get description;/// Job requirements (optional)
 String? get requirements;/// Salary amount
 int get salary;/// Salary type (e.g., "Borongan", "Harian", "Per Jam")
 String get salaryType;/// Number of workers needed
 int get workerCount;/// Job date and time — `null` bila backend tidak menyimpan jadwal default
/// untuk iklan ini (Kelompok 3 Phase 2: backend belum punya field ini sama
/// sekali, gap terpisah — lihat catatan di `JobModel`).
 DateTime? get dateOfJob;/// Full address
 String get address;/// Province
 String get province;/// City/Regency
 String get city;/// Subdistrict (Kecamatan)
 String get subdistrict;/// Ward (Kelurahan)
 String get ward;/// Village (Desa/Kampung)
 String? get village;/// Job status (e.g., "open", "closed", "in_progress")
 String get status;/// List of job images
 List<JobImageEntity> get images;/// Job created at
 DateTime? get createdAt;/// Job updated at
 DateTime? get updatedAt;/// Employer full name from user.user_info.full_name
/// Empty string if user hasn't filled in their profile yet.
 String get employerName;/// Employer phone number from user.phone_number
 String get employerPhone;/// Total number of bids/applicants for this job.
/// Populated from the bids array length in API response.
 int? get bidCount;
/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobEntityCopyWith<JobEntity> get copyWith => _$JobEntityCopyWithImpl<JobEntity>(this as JobEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryType, salaryType) || other.salaryType == salaryType)&&(identical(other.workerCount, workerCount) || other.workerCount == workerCount)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.employerName, employerName) || other.employerName == employerName)&&(identical(other.employerPhone, employerPhone) || other.employerPhone == employerPhone)&&(identical(other.bidCount, bidCount) || other.bidCount == bidCount));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,adCode,userId,title,description,requirements,salary,salaryType,workerCount,dateOfJob,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(images),createdAt,updatedAt,employerName,employerPhone,bidCount]);

@override
String toString() {
  return 'JobEntity(id: $id, adCode: $adCode, userId: $userId, title: $title, description: $description, requirements: $requirements, salary: $salary, salaryType: $salaryType, workerCount: $workerCount, dateOfJob: $dateOfJob, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, employerName: $employerName, employerPhone: $employerPhone, bidCount: $bidCount)';
}


}

/// @nodoc
abstract mixin class $JobEntityCopyWith<$Res>  {
  factory $JobEntityCopyWith(JobEntity value, $Res Function(JobEntity) _then) = _$JobEntityCopyWithImpl;
@useResult
$Res call({
 String id, String adCode, String userId, String title, String description, String? requirements, int salary, String salaryType, int workerCount, DateTime? dateOfJob, String address, String province, String city, String subdistrict, String ward, String? village, String status, List<JobImageEntity> images, DateTime? createdAt, DateTime? updatedAt, String employerName, String employerPhone, int? bidCount
});




}
/// @nodoc
class _$JobEntityCopyWithImpl<$Res>
    implements $JobEntityCopyWith<$Res> {
  _$JobEntityCopyWithImpl(this._self, this._then);

  final JobEntity _self;
  final $Res Function(JobEntity) _then;

/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? title = null,Object? description = null,Object? requirements = freezed,Object? salary = null,Object? salaryType = null,Object? workerCount = null,Object? dateOfJob = freezed,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = freezed,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employerName = null,Object? employerPhone = null,Object? bidCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as int,salaryType: null == salaryType ? _self.salaryType : salaryType // ignore: cast_nullable_to_non_nullable
as String,workerCount: null == workerCount ? _self.workerCount : workerCount // ignore: cast_nullable_to_non_nullable
as int,dateOfJob: freezed == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as DateTime?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageEntity>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,employerName: null == employerName ? _self.employerName : employerName // ignore: cast_nullable_to_non_nullable
as String,employerPhone: null == employerPhone ? _self.employerPhone : employerPhone // ignore: cast_nullable_to_non_nullable
as String,bidCount: freezed == bidCount ? _self.bidCount : bidCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobEntity].
extension JobEntityPatterns on JobEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobEntity value)  $default,){
final _that = this;
switch (_that) {
case _JobEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobEntity value)?  $default,){
final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String adCode,  String userId,  String title,  String description,  String? requirements,  int salary,  String salaryType,  int workerCount,  DateTime? dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String? village,  String status,  List<JobImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt,  String employerName,  String employerPhone,  int? bidCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.title,_that.description,_that.requirements,_that.salary,_that.salaryType,_that.workerCount,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt,_that.employerName,_that.employerPhone,_that.bidCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String adCode,  String userId,  String title,  String description,  String? requirements,  int salary,  String salaryType,  int workerCount,  DateTime? dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String? village,  String status,  List<JobImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt,  String employerName,  String employerPhone,  int? bidCount)  $default,) {final _that = this;
switch (_that) {
case _JobEntity():
return $default(_that.id,_that.adCode,_that.userId,_that.title,_that.description,_that.requirements,_that.salary,_that.salaryType,_that.workerCount,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt,_that.employerName,_that.employerPhone,_that.bidCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String adCode,  String userId,  String title,  String description,  String? requirements,  int salary,  String salaryType,  int workerCount,  DateTime? dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String? village,  String status,  List<JobImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt,  String employerName,  String employerPhone,  int? bidCount)?  $default,) {final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.title,_that.description,_that.requirements,_that.salary,_that.salaryType,_that.workerCount,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt,_that.employerName,_that.employerPhone,_that.bidCount);case _:
  return null;

}
}

}

/// @nodoc


class _JobEntity extends JobEntity {
  const _JobEntity({required this.id, required this.adCode, required this.userId, required this.title, required this.description, this.requirements, required this.salary, required this.salaryType, required this.workerCount, this.dateOfJob, required this.address, required this.province, required this.city, required this.subdistrict, required this.ward, this.village, required this.status, final  List<JobImageEntity> images = const [], this.createdAt, this.updatedAt, this.employerName = '', this.employerPhone = '', this.bidCount}): _images = images,super._();
  

/// Unique job identifier
@override final  String id;
/// Advertisement code from API (e.g., "17/03/2026/1773725269")
@override final  String adCode;
/// User ID who posted the job
@override final  String userId;
/// Job title
@override final  String title;
/// Job description
@override final  String description;
/// Job requirements (optional)
@override final  String? requirements;
/// Salary amount
@override final  int salary;
/// Salary type (e.g., "Borongan", "Harian", "Per Jam")
@override final  String salaryType;
/// Number of workers needed
@override final  int workerCount;
/// Job date and time — `null` bila backend tidak menyimpan jadwal default
/// untuk iklan ini (Kelompok 3 Phase 2: backend belum punya field ini sama
/// sekali, gap terpisah — lihat catatan di `JobModel`).
@override final  DateTime? dateOfJob;
/// Full address
@override final  String address;
/// Province
@override final  String province;
/// City/Regency
@override final  String city;
/// Subdistrict (Kecamatan)
@override final  String subdistrict;
/// Ward (Kelurahan)
@override final  String ward;
/// Village (Desa/Kampung)
@override final  String? village;
/// Job status (e.g., "open", "closed", "in_progress")
@override final  String status;
/// List of job images
 final  List<JobImageEntity> _images;
/// List of job images
@override@JsonKey() List<JobImageEntity> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// Job created at
@override final  DateTime? createdAt;
/// Job updated at
@override final  DateTime? updatedAt;
/// Employer full name from user.user_info.full_name
/// Empty string if user hasn't filled in their profile yet.
@override@JsonKey() final  String employerName;
/// Employer phone number from user.phone_number
@override@JsonKey() final  String employerPhone;
/// Total number of bids/applicants for this job.
/// Populated from the bids array length in API response.
@override final  int? bidCount;

/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobEntityCopyWith<_JobEntity> get copyWith => __$JobEntityCopyWithImpl<_JobEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryType, salaryType) || other.salaryType == salaryType)&&(identical(other.workerCount, workerCount) || other.workerCount == workerCount)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.employerName, employerName) || other.employerName == employerName)&&(identical(other.employerPhone, employerPhone) || other.employerPhone == employerPhone)&&(identical(other.bidCount, bidCount) || other.bidCount == bidCount));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,adCode,userId,title,description,requirements,salary,salaryType,workerCount,dateOfJob,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(_images),createdAt,updatedAt,employerName,employerPhone,bidCount]);

@override
String toString() {
  return 'JobEntity(id: $id, adCode: $adCode, userId: $userId, title: $title, description: $description, requirements: $requirements, salary: $salary, salaryType: $salaryType, workerCount: $workerCount, dateOfJob: $dateOfJob, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, employerName: $employerName, employerPhone: $employerPhone, bidCount: $bidCount)';
}


}

/// @nodoc
abstract mixin class _$JobEntityCopyWith<$Res> implements $JobEntityCopyWith<$Res> {
  factory _$JobEntityCopyWith(_JobEntity value, $Res Function(_JobEntity) _then) = __$JobEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String adCode, String userId, String title, String description, String? requirements, int salary, String salaryType, int workerCount, DateTime? dateOfJob, String address, String province, String city, String subdistrict, String ward, String? village, String status, List<JobImageEntity> images, DateTime? createdAt, DateTime? updatedAt, String employerName, String employerPhone, int? bidCount
});




}
/// @nodoc
class __$JobEntityCopyWithImpl<$Res>
    implements _$JobEntityCopyWith<$Res> {
  __$JobEntityCopyWithImpl(this._self, this._then);

  final _JobEntity _self;
  final $Res Function(_JobEntity) _then;

/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? title = null,Object? description = null,Object? requirements = freezed,Object? salary = null,Object? salaryType = null,Object? workerCount = null,Object? dateOfJob = freezed,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = freezed,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employerName = null,Object? employerPhone = null,Object? bidCount = freezed,}) {
  return _then(_JobEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as int,salaryType: null == salaryType ? _self.salaryType : salaryType // ignore: cast_nullable_to_non_nullable
as String,workerCount: null == workerCount ? _self.workerCount : workerCount // ignore: cast_nullable_to_non_nullable
as int,dateOfJob: freezed == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as DateTime?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageEntity>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,employerName: null == employerName ? _self.employerName : employerName // ignore: cast_nullable_to_non_nullable
as String,employerPhone: null == employerPhone ? _self.employerPhone : employerPhone // ignore: cast_nullable_to_non_nullable
as String,bidCount: freezed == bidCount ? _self.bidCount : bidCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
