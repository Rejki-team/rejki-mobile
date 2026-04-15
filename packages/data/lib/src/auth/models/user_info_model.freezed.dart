// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoModel {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'full_name') String get fullName; String get nik; String get gender; String get dob; int get age; String get province; String get city; String get districts; String get village;@JsonKey(name: 'rt_rw') String get rtRw;@JsonKey(name: 'ktp_file_path') String get ktpFilePath;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;// Additional fields from API response
@JsonKey(name: 'selfie_ktp_file_path') String get selfieKtpFilePath;@JsonKey(name: 'education_level') String get educationLevel;@JsonKey(name: 'education_focus') String get educationFocus;@JsonKey(name: 'work_experience') String get workExperience;@JsonKey(name: 'address_ktp') String get addressKtp; String get country;
/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<UserInfoModel> get copyWith => _$UserInfoModelCopyWithImpl<UserInfoModel>(this as UserInfoModel, _$identity);

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.age, age) || other.age == age)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.village, village) || other.village == village)&&(identical(other.rtRw, rtRw) || other.rtRw == rtRw)&&(identical(other.ktpFilePath, ktpFilePath) || other.ktpFilePath == ktpFilePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.selfieKtpFilePath, selfieKtpFilePath) || other.selfieKtpFilePath == selfieKtpFilePath)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.educationFocus, educationFocus) || other.educationFocus == educationFocus)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.addressKtp, addressKtp) || other.addressKtp == addressKtp)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,fullName,nik,gender,dob,age,province,city,districts,village,rtRw,ktpFilePath,createdAt,updatedAt,selfieKtpFilePath,educationLevel,educationFocus,workExperience,addressKtp,country]);

@override
String toString() {
  return 'UserInfoModel(id: $id, userId: $userId, fullName: $fullName, nik: $nik, gender: $gender, dob: $dob, age: $age, province: $province, city: $city, districts: $districts, village: $village, rtRw: $rtRw, ktpFilePath: $ktpFilePath, createdAt: $createdAt, updatedAt: $updatedAt, selfieKtpFilePath: $selfieKtpFilePath, educationLevel: $educationLevel, educationFocus: $educationFocus, workExperience: $workExperience, addressKtp: $addressKtp, country: $country)';
}


}

/// @nodoc
abstract mixin class $UserInfoModelCopyWith<$Res>  {
  factory $UserInfoModelCopyWith(UserInfoModel value, $Res Function(UserInfoModel) _then) = _$UserInfoModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'full_name') String fullName, String nik, String gender, String dob, int age, String province, String city, String districts, String village,@JsonKey(name: 'rt_rw') String rtRw,@JsonKey(name: 'ktp_file_path') String ktpFilePath,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'selfie_ktp_file_path') String selfieKtpFilePath,@JsonKey(name: 'education_level') String educationLevel,@JsonKey(name: 'education_focus') String educationFocus,@JsonKey(name: 'work_experience') String workExperience,@JsonKey(name: 'address_ktp') String addressKtp, String country
});




}
/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._self, this._then);

  final UserInfoModel _self;
  final $Res Function(UserInfoModel) _then;

/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? nik = null,Object? gender = null,Object? dob = null,Object? age = null,Object? province = null,Object? city = null,Object? districts = null,Object? village = null,Object? rtRw = null,Object? ktpFilePath = null,Object? createdAt = null,Object? updatedAt = null,Object? selfieKtpFilePath = null,Object? educationLevel = null,Object? educationFocus = null,Object? workExperience = null,Object? addressKtp = null,Object? country = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,rtRw: null == rtRw ? _self.rtRw : rtRw // ignore: cast_nullable_to_non_nullable
as String,ktpFilePath: null == ktpFilePath ? _self.ktpFilePath : ktpFilePath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,selfieKtpFilePath: null == selfieKtpFilePath ? _self.selfieKtpFilePath : selfieKtpFilePath // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,educationFocus: null == educationFocus ? _self.educationFocus : educationFocus // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,addressKtp: null == addressKtp ? _self.addressKtp : addressKtp // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfoModel].
extension UserInfoModelPatterns on UserInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _UserInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'full_name')  String fullName,  String nik,  String gender,  String dob,  int age,  String province,  String city,  String districts,  String village, @JsonKey(name: 'rt_rw')  String rtRw, @JsonKey(name: 'ktp_file_path')  String ktpFilePath, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'selfie_ktp_file_path')  String selfieKtpFilePath, @JsonKey(name: 'education_level')  String educationLevel, @JsonKey(name: 'education_focus')  String educationFocus, @JsonKey(name: 'work_experience')  String workExperience, @JsonKey(name: 'address_ktp')  String addressKtp,  String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.nik,_that.gender,_that.dob,_that.age,_that.province,_that.city,_that.districts,_that.village,_that.rtRw,_that.ktpFilePath,_that.createdAt,_that.updatedAt,_that.selfieKtpFilePath,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.addressKtp,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'full_name')  String fullName,  String nik,  String gender,  String dob,  int age,  String province,  String city,  String districts,  String village, @JsonKey(name: 'rt_rw')  String rtRw, @JsonKey(name: 'ktp_file_path')  String ktpFilePath, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'selfie_ktp_file_path')  String selfieKtpFilePath, @JsonKey(name: 'education_level')  String educationLevel, @JsonKey(name: 'education_focus')  String educationFocus, @JsonKey(name: 'work_experience')  String workExperience, @JsonKey(name: 'address_ktp')  String addressKtp,  String country)  $default,) {final _that = this;
switch (_that) {
case _UserInfoModel():
return $default(_that.id,_that.userId,_that.fullName,_that.nik,_that.gender,_that.dob,_that.age,_that.province,_that.city,_that.districts,_that.village,_that.rtRw,_that.ktpFilePath,_that.createdAt,_that.updatedAt,_that.selfieKtpFilePath,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.addressKtp,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'full_name')  String fullName,  String nik,  String gender,  String dob,  int age,  String province,  String city,  String districts,  String village, @JsonKey(name: 'rt_rw')  String rtRw, @JsonKey(name: 'ktp_file_path')  String ktpFilePath, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'selfie_ktp_file_path')  String selfieKtpFilePath, @JsonKey(name: 'education_level')  String educationLevel, @JsonKey(name: 'education_focus')  String educationFocus, @JsonKey(name: 'work_experience')  String workExperience, @JsonKey(name: 'address_ktp')  String addressKtp,  String country)?  $default,) {final _that = this;
switch (_that) {
case _UserInfoModel() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.nik,_that.gender,_that.dob,_that.age,_that.province,_that.city,_that.districts,_that.village,_that.rtRw,_that.ktpFilePath,_that.createdAt,_that.updatedAt,_that.selfieKtpFilePath,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.addressKtp,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInfoModel implements UserInfoModel {
  const _UserInfoModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'full_name') required this.fullName, required this.nik, required this.gender, required this.dob, this.age = 0, required this.province, required this.city, required this.districts, required this.village, @JsonKey(name: 'rt_rw') required this.rtRw, @JsonKey(name: 'ktp_file_path') required this.ktpFilePath, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'selfie_ktp_file_path') this.selfieKtpFilePath = '', @JsonKey(name: 'education_level') this.educationLevel = '', @JsonKey(name: 'education_focus') this.educationFocus = '', @JsonKey(name: 'work_experience') this.workExperience = '', @JsonKey(name: 'address_ktp') this.addressKtp = '', this.country = 'Indonesia'});
  factory _UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String nik;
@override final  String gender;
@override final  String dob;
@override@JsonKey() final  int age;
@override final  String province;
@override final  String city;
@override final  String districts;
@override final  String village;
@override@JsonKey(name: 'rt_rw') final  String rtRw;
@override@JsonKey(name: 'ktp_file_path') final  String ktpFilePath;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
// Additional fields from API response
@override@JsonKey(name: 'selfie_ktp_file_path') final  String selfieKtpFilePath;
@override@JsonKey(name: 'education_level') final  String educationLevel;
@override@JsonKey(name: 'education_focus') final  String educationFocus;
@override@JsonKey(name: 'work_experience') final  String workExperience;
@override@JsonKey(name: 'address_ktp') final  String addressKtp;
@override@JsonKey() final  String country;

/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoModelCopyWith<_UserInfoModel> get copyWith => __$UserInfoModelCopyWithImpl<_UserInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.age, age) || other.age == age)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.village, village) || other.village == village)&&(identical(other.rtRw, rtRw) || other.rtRw == rtRw)&&(identical(other.ktpFilePath, ktpFilePath) || other.ktpFilePath == ktpFilePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.selfieKtpFilePath, selfieKtpFilePath) || other.selfieKtpFilePath == selfieKtpFilePath)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.educationFocus, educationFocus) || other.educationFocus == educationFocus)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.addressKtp, addressKtp) || other.addressKtp == addressKtp)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,fullName,nik,gender,dob,age,province,city,districts,village,rtRw,ktpFilePath,createdAt,updatedAt,selfieKtpFilePath,educationLevel,educationFocus,workExperience,addressKtp,country]);

@override
String toString() {
  return 'UserInfoModel(id: $id, userId: $userId, fullName: $fullName, nik: $nik, gender: $gender, dob: $dob, age: $age, province: $province, city: $city, districts: $districts, village: $village, rtRw: $rtRw, ktpFilePath: $ktpFilePath, createdAt: $createdAt, updatedAt: $updatedAt, selfieKtpFilePath: $selfieKtpFilePath, educationLevel: $educationLevel, educationFocus: $educationFocus, workExperience: $workExperience, addressKtp: $addressKtp, country: $country)';
}


}

/// @nodoc
abstract mixin class _$UserInfoModelCopyWith<$Res> implements $UserInfoModelCopyWith<$Res> {
  factory _$UserInfoModelCopyWith(_UserInfoModel value, $Res Function(_UserInfoModel) _then) = __$UserInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'full_name') String fullName, String nik, String gender, String dob, int age, String province, String city, String districts, String village,@JsonKey(name: 'rt_rw') String rtRw,@JsonKey(name: 'ktp_file_path') String ktpFilePath,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'selfie_ktp_file_path') String selfieKtpFilePath,@JsonKey(name: 'education_level') String educationLevel,@JsonKey(name: 'education_focus') String educationFocus,@JsonKey(name: 'work_experience') String workExperience,@JsonKey(name: 'address_ktp') String addressKtp, String country
});




}
/// @nodoc
class __$UserInfoModelCopyWithImpl<$Res>
    implements _$UserInfoModelCopyWith<$Res> {
  __$UserInfoModelCopyWithImpl(this._self, this._then);

  final _UserInfoModel _self;
  final $Res Function(_UserInfoModel) _then;

/// Create a copy of UserInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? nik = null,Object? gender = null,Object? dob = null,Object? age = null,Object? province = null,Object? city = null,Object? districts = null,Object? village = null,Object? rtRw = null,Object? ktpFilePath = null,Object? createdAt = null,Object? updatedAt = null,Object? selfieKtpFilePath = null,Object? educationLevel = null,Object? educationFocus = null,Object? workExperience = null,Object? addressKtp = null,Object? country = null,}) {
  return _then(_UserInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,rtRw: null == rtRw ? _self.rtRw : rtRw // ignore: cast_nullable_to_non_nullable
as String,ktpFilePath: null == ktpFilePath ? _self.ktpFilePath : ktpFilePath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,selfieKtpFilePath: null == selfieKtpFilePath ? _self.selfieKtpFilePath : selfieKtpFilePath // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,educationFocus: null == educationFocus ? _self.educationFocus : educationFocus // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,addressKtp: null == addressKtp ? _self.addressKtp : addressKtp // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
