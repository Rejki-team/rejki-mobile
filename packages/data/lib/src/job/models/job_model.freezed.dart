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

/// Unique job identifier
 String get id;/// Advertisement code (e.g., "17/03/2026/1773725269")
@JsonKey(name: 'ad_code') String get adCode;/// User ID who posted the job
@JsonKey(name: 'user_id') String get userId;/// Nested user object (employer identity)
 UserJobModel? get user;/// Job title
 String get title;/// Job description
@JsonKey(name: 'job_desc') String get jobDesc;/// Job requirements (optional)
@JsonKey(name: 'job_requirements') String? get jobRequirements;/// Salary amount
 int get salary;/// Salary type (e.g., "Borongan", "Harian", "Per Jam")
@JsonKey(name: 'salary_of_worker') String get salaryOfWorker;/// Number of workers needed
@JsonKey(name: 'number_of_worker') int get numberOfWorker;/// Job date and time (ISO 8601 string from API)
@JsonKey(name: 'date_of_job') String get dateOfJob;/// Full address
 String get address;/// Province
 String get province;/// City/Regency
 String get city;/// Subdistrict (Kecamatan)
 String get subdistrict;/// Ward (Kelurahan)
 String get ward;/// Village (Desa/Kampung)
 String? get village;/// Job status (e.g., "open", "closed")
 String get status;/// List of job images
 List<JobImageModel> get images;/// Job created at
@JsonKey(name: 'created_at') String? get createdAt;/// Job updated at
@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobModelCopyWith<JobModel> get copyWith => _$JobModelCopyWithImpl<JobModel>(this as JobModel, _$identity);

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.title, title) || other.title == title)&&(identical(other.jobDesc, jobDesc) || other.jobDesc == jobDesc)&&(identical(other.jobRequirements, jobRequirements) || other.jobRequirements == jobRequirements)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryOfWorker, salaryOfWorker) || other.salaryOfWorker == salaryOfWorker)&&(identical(other.numberOfWorker, numberOfWorker) || other.numberOfWorker == numberOfWorker)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,adCode,userId,user,title,jobDesc,jobRequirements,salary,salaryOfWorker,numberOfWorker,dateOfJob,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(images),createdAt,updatedAt]);

@override
String toString() {
  return 'JobModel(id: $id, adCode: $adCode, userId: $userId, user: $user, title: $title, jobDesc: $jobDesc, jobRequirements: $jobRequirements, salary: $salary, salaryOfWorker: $salaryOfWorker, numberOfWorker: $numberOfWorker, dateOfJob: $dateOfJob, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobModelCopyWith<$Res>  {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) _then) = _$JobModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'ad_code') String adCode,@JsonKey(name: 'user_id') String userId, UserJobModel? user, String title,@JsonKey(name: 'job_desc') String jobDesc,@JsonKey(name: 'job_requirements') String? jobRequirements, int salary,@JsonKey(name: 'salary_of_worker') String salaryOfWorker,@JsonKey(name: 'number_of_worker') int numberOfWorker,@JsonKey(name: 'date_of_job') String dateOfJob, String address, String province, String city, String subdistrict, String ward, String? village, String status, List<JobImageModel> images,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$UserJobModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$JobModelCopyWithImpl<$Res>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._self, this._then);

  final JobModel _self;
  final $Res Function(JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? user = freezed,Object? title = null,Object? jobDesc = null,Object? jobRequirements = freezed,Object? salary = null,Object? salaryOfWorker = null,Object? numberOfWorker = null,Object? dateOfJob = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = freezed,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserJobModel?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,jobDesc: null == jobDesc ? _self.jobDesc : jobDesc // ignore: cast_nullable_to_non_nullable
as String,jobRequirements: freezed == jobRequirements ? _self.jobRequirements : jobRequirements // ignore: cast_nullable_to_non_nullable
as String?,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as int,salaryOfWorker: null == salaryOfWorker ? _self.salaryOfWorker : salaryOfWorker // ignore: cast_nullable_to_non_nullable
as String,numberOfWorker: null == numberOfWorker ? _self.numberOfWorker : numberOfWorker // ignore: cast_nullable_to_non_nullable
as int,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserJobModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserJobModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'ad_code')  String adCode, @JsonKey(name: 'user_id')  String userId,  UserJobModel? user,  String title, @JsonKey(name: 'job_desc')  String jobDesc, @JsonKey(name: 'job_requirements')  String? jobRequirements,  int salary, @JsonKey(name: 'salary_of_worker')  String salaryOfWorker, @JsonKey(name: 'number_of_worker')  int numberOfWorker, @JsonKey(name: 'date_of_job')  String dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String? village,  String status,  List<JobImageModel> images, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.user,_that.title,_that.jobDesc,_that.jobRequirements,_that.salary,_that.salaryOfWorker,_that.numberOfWorker,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'ad_code')  String adCode, @JsonKey(name: 'user_id')  String userId,  UserJobModel? user,  String title, @JsonKey(name: 'job_desc')  String jobDesc, @JsonKey(name: 'job_requirements')  String? jobRequirements,  int salary, @JsonKey(name: 'salary_of_worker')  String salaryOfWorker, @JsonKey(name: 'number_of_worker')  int numberOfWorker, @JsonKey(name: 'date_of_job')  String dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String? village,  String status,  List<JobImageModel> images, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobModel():
return $default(_that.id,_that.adCode,_that.userId,_that.user,_that.title,_that.jobDesc,_that.jobRequirements,_that.salary,_that.salaryOfWorker,_that.numberOfWorker,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'ad_code')  String adCode, @JsonKey(name: 'user_id')  String userId,  UserJobModel? user,  String title, @JsonKey(name: 'job_desc')  String jobDesc, @JsonKey(name: 'job_requirements')  String? jobRequirements,  int salary, @JsonKey(name: 'salary_of_worker')  String salaryOfWorker, @JsonKey(name: 'number_of_worker')  int numberOfWorker, @JsonKey(name: 'date_of_job')  String dateOfJob,  String address,  String province,  String city,  String subdistrict,  String ward,  String? village,  String status,  List<JobImageModel> images, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.user,_that.title,_that.jobDesc,_that.jobRequirements,_that.salary,_that.salaryOfWorker,_that.numberOfWorker,_that.dateOfJob,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobModel extends JobModel {
  const _JobModel({required this.id, @JsonKey(name: 'ad_code') required this.adCode, @JsonKey(name: 'user_id') required this.userId, this.user, required this.title, @JsonKey(name: 'job_desc') required this.jobDesc, @JsonKey(name: 'job_requirements') this.jobRequirements, required this.salary, @JsonKey(name: 'salary_of_worker') required this.salaryOfWorker, @JsonKey(name: 'number_of_worker') required this.numberOfWorker, @JsonKey(name: 'date_of_job') required this.dateOfJob, required this.address, required this.province, required this.city, required this.subdistrict, required this.ward, this.village, required this.status, final  List<JobImageModel> images = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _images = images,super._();
  factory _JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

/// Unique job identifier
@override final  String id;
/// Advertisement code (e.g., "17/03/2026/1773725269")
@override@JsonKey(name: 'ad_code') final  String adCode;
/// User ID who posted the job
@override@JsonKey(name: 'user_id') final  String userId;
/// Nested user object (employer identity)
@override final  UserJobModel? user;
/// Job title
@override final  String title;
/// Job description
@override@JsonKey(name: 'job_desc') final  String jobDesc;
/// Job requirements (optional)
@override@JsonKey(name: 'job_requirements') final  String? jobRequirements;
/// Salary amount
@override final  int salary;
/// Salary type (e.g., "Borongan", "Harian", "Per Jam")
@override@JsonKey(name: 'salary_of_worker') final  String salaryOfWorker;
/// Number of workers needed
@override@JsonKey(name: 'number_of_worker') final  int numberOfWorker;
/// Job date and time (ISO 8601 string from API)
@override@JsonKey(name: 'date_of_job') final  String dateOfJob;
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
/// Job status (e.g., "open", "closed")
@override final  String status;
/// List of job images
 final  List<JobImageModel> _images;
/// List of job images
@override@JsonKey() List<JobImageModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// Job created at
@override@JsonKey(name: 'created_at') final  String? createdAt;
/// Job updated at
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.title, title) || other.title == title)&&(identical(other.jobDesc, jobDesc) || other.jobDesc == jobDesc)&&(identical(other.jobRequirements, jobRequirements) || other.jobRequirements == jobRequirements)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryOfWorker, salaryOfWorker) || other.salaryOfWorker == salaryOfWorker)&&(identical(other.numberOfWorker, numberOfWorker) || other.numberOfWorker == numberOfWorker)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,adCode,userId,user,title,jobDesc,jobRequirements,salary,salaryOfWorker,numberOfWorker,dateOfJob,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(_images),createdAt,updatedAt]);

@override
String toString() {
  return 'JobModel(id: $id, adCode: $adCode, userId: $userId, user: $user, title: $title, jobDesc: $jobDesc, jobRequirements: $jobRequirements, salary: $salary, salaryOfWorker: $salaryOfWorker, numberOfWorker: $numberOfWorker, dateOfJob: $dateOfJob, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobModelCopyWith<$Res> implements $JobModelCopyWith<$Res> {
  factory _$JobModelCopyWith(_JobModel value, $Res Function(_JobModel) _then) = __$JobModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'ad_code') String adCode,@JsonKey(name: 'user_id') String userId, UserJobModel? user, String title,@JsonKey(name: 'job_desc') String jobDesc,@JsonKey(name: 'job_requirements') String? jobRequirements, int salary,@JsonKey(name: 'salary_of_worker') String salaryOfWorker,@JsonKey(name: 'number_of_worker') int numberOfWorker,@JsonKey(name: 'date_of_job') String dateOfJob, String address, String province, String city, String subdistrict, String ward, String? village, String status, List<JobImageModel> images,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $UserJobModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$JobModelCopyWithImpl<$Res>
    implements _$JobModelCopyWith<$Res> {
  __$JobModelCopyWithImpl(this._self, this._then);

  final _JobModel _self;
  final $Res Function(_JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? user = freezed,Object? title = null,Object? jobDesc = null,Object? jobRequirements = freezed,Object? salary = null,Object? salaryOfWorker = null,Object? numberOfWorker = null,Object? dateOfJob = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = freezed,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserJobModel?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,jobDesc: null == jobDesc ? _self.jobDesc : jobDesc // ignore: cast_nullable_to_non_nullable
as String,jobRequirements: freezed == jobRequirements ? _self.jobRequirements : jobRequirements // ignore: cast_nullable_to_non_nullable
as String?,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as int,salaryOfWorker: null == salaryOfWorker ? _self.salaryOfWorker : salaryOfWorker // ignore: cast_nullable_to_non_nullable
as String,numberOfWorker: null == numberOfWorker ? _self.numberOfWorker : numberOfWorker // ignore: cast_nullable_to_non_nullable
as int,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserJobModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserJobModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
