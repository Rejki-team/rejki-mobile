// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileParams {

/// Nama lengkap sesuai KTP
 String get fullName;/// NIK (16 digit)
 String get nik;/// Jenis kelamin: 'male' atau 'female'
 String get gender;/// Tanggal lahir format YYYY-MM-DD
 String get dob;/// Alamat sesuai KTP
 String get addressKtp;/// Negara
 String get country;/// Provinsi
 String get province;/// Kota/Kabupaten
 String get city;/// Kecamatan/Distrik
 String get districts;/// Kelurahan/Desa
 String get village;/// Tingkat pendidikan (SD, SMP, SMA, Diploma, Sarjana)
 String get educationLevel;/// Fokus pendidikan (Teknik Informatika, Tata Boga, dll)
 String get educationFocus;/// Pengalaman kerja
 String get workExperience;/// File foto KTP
 File get ktpFile;/// File foto swafoto dengan KTP
 File get selfieKtpFile;
/// Create a copy of UpdateProfileParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileParamsCopyWith<UpdateProfileParams> get copyWith => _$UpdateProfileParamsCopyWithImpl<UpdateProfileParams>(this as UpdateProfileParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileParams&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.addressKtp, addressKtp) || other.addressKtp == addressKtp)&&(identical(other.country, country) || other.country == country)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.village, village) || other.village == village)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.educationFocus, educationFocus) || other.educationFocus == educationFocus)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.ktpFile, ktpFile) || other.ktpFile == ktpFile)&&(identical(other.selfieKtpFile, selfieKtpFile) || other.selfieKtpFile == selfieKtpFile));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,nik,gender,dob,addressKtp,country,province,city,districts,village,educationLevel,educationFocus,workExperience,ktpFile,selfieKtpFile);

@override
String toString() {
  return 'UpdateProfileParams(fullName: $fullName, nik: $nik, gender: $gender, dob: $dob, addressKtp: $addressKtp, country: $country, province: $province, city: $city, districts: $districts, village: $village, educationLevel: $educationLevel, educationFocus: $educationFocus, workExperience: $workExperience, ktpFile: $ktpFile, selfieKtpFile: $selfieKtpFile)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileParamsCopyWith<$Res>  {
  factory $UpdateProfileParamsCopyWith(UpdateProfileParams value, $Res Function(UpdateProfileParams) _then) = _$UpdateProfileParamsCopyWithImpl;
@useResult
$Res call({
 String fullName, String nik, String gender, String dob, String addressKtp, String country, String province, String city, String districts, String village, String educationLevel, String educationFocus, String workExperience, File ktpFile, File selfieKtpFile
});




}
/// @nodoc
class _$UpdateProfileParamsCopyWithImpl<$Res>
    implements $UpdateProfileParamsCopyWith<$Res> {
  _$UpdateProfileParamsCopyWithImpl(this._self, this._then);

  final UpdateProfileParams _self;
  final $Res Function(UpdateProfileParams) _then;

/// Create a copy of UpdateProfileParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? nik = null,Object? gender = null,Object? dob = null,Object? addressKtp = null,Object? country = null,Object? province = null,Object? city = null,Object? districts = null,Object? village = null,Object? educationLevel = null,Object? educationFocus = null,Object? workExperience = null,Object? ktpFile = null,Object? selfieKtpFile = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,addressKtp: null == addressKtp ? _self.addressKtp : addressKtp // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,educationFocus: null == educationFocus ? _self.educationFocus : educationFocus // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,ktpFile: null == ktpFile ? _self.ktpFile : ktpFile // ignore: cast_nullable_to_non_nullable
as File,selfieKtpFile: null == selfieKtpFile ? _self.selfieKtpFile : selfieKtpFile // ignore: cast_nullable_to_non_nullable
as File,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileParams].
extension UpdateProfileParamsPatterns on UpdateProfileParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileParams value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileParams value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String nik,  String gender,  String dob,  String addressKtp,  String country,  String province,  String city,  String districts,  String village,  String educationLevel,  String educationFocus,  String workExperience,  File ktpFile,  File selfieKtpFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileParams() when $default != null:
return $default(_that.fullName,_that.nik,_that.gender,_that.dob,_that.addressKtp,_that.country,_that.province,_that.city,_that.districts,_that.village,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.ktpFile,_that.selfieKtpFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String nik,  String gender,  String dob,  String addressKtp,  String country,  String province,  String city,  String districts,  String village,  String educationLevel,  String educationFocus,  String workExperience,  File ktpFile,  File selfieKtpFile)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileParams():
return $default(_that.fullName,_that.nik,_that.gender,_that.dob,_that.addressKtp,_that.country,_that.province,_that.city,_that.districts,_that.village,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.ktpFile,_that.selfieKtpFile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String nik,  String gender,  String dob,  String addressKtp,  String country,  String province,  String city,  String districts,  String village,  String educationLevel,  String educationFocus,  String workExperience,  File ktpFile,  File selfieKtpFile)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileParams() when $default != null:
return $default(_that.fullName,_that.nik,_that.gender,_that.dob,_that.addressKtp,_that.country,_that.province,_that.city,_that.districts,_that.village,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.ktpFile,_that.selfieKtpFile);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateProfileParams implements UpdateProfileParams {
  const _UpdateProfileParams({required this.fullName, required this.nik, required this.gender, required this.dob, required this.addressKtp, required this.country, required this.province, required this.city, required this.districts, required this.village, required this.educationLevel, required this.educationFocus, required this.workExperience, required this.ktpFile, required this.selfieKtpFile});
  

/// Nama lengkap sesuai KTP
@override final  String fullName;
/// NIK (16 digit)
@override final  String nik;
/// Jenis kelamin: 'male' atau 'female'
@override final  String gender;
/// Tanggal lahir format YYYY-MM-DD
@override final  String dob;
/// Alamat sesuai KTP
@override final  String addressKtp;
/// Negara
@override final  String country;
/// Provinsi
@override final  String province;
/// Kota/Kabupaten
@override final  String city;
/// Kecamatan/Distrik
@override final  String districts;
/// Kelurahan/Desa
@override final  String village;
/// Tingkat pendidikan (SD, SMP, SMA, Diploma, Sarjana)
@override final  String educationLevel;
/// Fokus pendidikan (Teknik Informatika, Tata Boga, dll)
@override final  String educationFocus;
/// Pengalaman kerja
@override final  String workExperience;
/// File foto KTP
@override final  File ktpFile;
/// File foto swafoto dengan KTP
@override final  File selfieKtpFile;

/// Create a copy of UpdateProfileParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileParamsCopyWith<_UpdateProfileParams> get copyWith => __$UpdateProfileParamsCopyWithImpl<_UpdateProfileParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileParams&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.addressKtp, addressKtp) || other.addressKtp == addressKtp)&&(identical(other.country, country) || other.country == country)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.village, village) || other.village == village)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.educationFocus, educationFocus) || other.educationFocus == educationFocus)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.ktpFile, ktpFile) || other.ktpFile == ktpFile)&&(identical(other.selfieKtpFile, selfieKtpFile) || other.selfieKtpFile == selfieKtpFile));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,nik,gender,dob,addressKtp,country,province,city,districts,village,educationLevel,educationFocus,workExperience,ktpFile,selfieKtpFile);

@override
String toString() {
  return 'UpdateProfileParams(fullName: $fullName, nik: $nik, gender: $gender, dob: $dob, addressKtp: $addressKtp, country: $country, province: $province, city: $city, districts: $districts, village: $village, educationLevel: $educationLevel, educationFocus: $educationFocus, workExperience: $workExperience, ktpFile: $ktpFile, selfieKtpFile: $selfieKtpFile)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileParamsCopyWith<$Res> implements $UpdateProfileParamsCopyWith<$Res> {
  factory _$UpdateProfileParamsCopyWith(_UpdateProfileParams value, $Res Function(_UpdateProfileParams) _then) = __$UpdateProfileParamsCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String nik, String gender, String dob, String addressKtp, String country, String province, String city, String districts, String village, String educationLevel, String educationFocus, String workExperience, File ktpFile, File selfieKtpFile
});




}
/// @nodoc
class __$UpdateProfileParamsCopyWithImpl<$Res>
    implements _$UpdateProfileParamsCopyWith<$Res> {
  __$UpdateProfileParamsCopyWithImpl(this._self, this._then);

  final _UpdateProfileParams _self;
  final $Res Function(_UpdateProfileParams) _then;

/// Create a copy of UpdateProfileParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? nik = null,Object? gender = null,Object? dob = null,Object? addressKtp = null,Object? country = null,Object? province = null,Object? city = null,Object? districts = null,Object? village = null,Object? educationLevel = null,Object? educationFocus = null,Object? workExperience = null,Object? ktpFile = null,Object? selfieKtpFile = null,}) {
  return _then(_UpdateProfileParams(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,addressKtp: null == addressKtp ? _self.addressKtp : addressKtp // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,educationFocus: null == educationFocus ? _self.educationFocus : educationFocus // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,ktpFile: null == ktpFile ? _self.ktpFile : ktpFile // ignore: cast_nullable_to_non_nullable
as File,selfieKtpFile: null == selfieKtpFile ? _self.selfieKtpFile : selfieKtpFile // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

// dart format on
