// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileEntity {

/// ID unik pengguna
 String get id;/// Email pengguna
 String get email;/// Nomor telepon pengguna
 String get phoneNumber;/// Jam kerja yang dipilih (e.g. 'fleksibel', 'pagi', 'malam')
 String get workingHours;/// Status verifikasi ('verified', 'pending', 'unverified')
 String get verificationStatus;/// Apakah user bisa mengubah jam kerja (state dari server, bisa false saat proses)
 bool get workingHoursEditable;/// Flag utama — apakah API mengizinkan update jam kerja saat ini.
/// Kontrol interaktivitas dropdown di UI.
 bool get canUpdateWorkingHours;/// Apakah nomor telepon ditampilkan ke publik
 bool get isPhoneVisible;/// Apakah user bisa mengubah visibilitas telepon (state dari server)
 bool get phoneVisibleEditable;/// Flag utama — apakah API mengizinkan update visibilitas telepon saat ini.
/// Kontrol interaktivitas switch di UI.
 bool get canUpdatePhoneVisibility;// ── Data dari user_info ──────────────────────────────────────────────────
/// Nama lengkap
 String get fullName;/// Tingkat pendidikan (e.g. 'SMP', 'SMA', 'Sarjana')
 String get educationLevel;/// Fokus/jurusan pendidikan (bisa kosong)
 String get educationFocus;/// Pengalaman kerja (satu string, dipisahkan koma)
 String get workExperience;/// Alamat sesuai KTP
 String get addressKtp;/// Kelurahan/Desa
 String get village;/// Kecamatan
 String get districts;/// Kota/Kabupaten
 String get city;/// Provinsi
 String get province;/// Path foto profil di server (kosong jika belum upload atau belum diset)
///
/// Contoh: 'storage/uploads/profiles/2026/04/15/xxx.jpg'
/// Gunakan [ApiConfig.buildImageUrl] untuk membentuk URL lengkap.
 String get profilePhotoPath;
/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileEntityCopyWith<UserProfileEntity> get copyWith => _$UserProfileEntityCopyWithImpl<UserProfileEntity>(this as UserProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.workingHoursEditable, workingHoursEditable) || other.workingHoursEditable == workingHoursEditable)&&(identical(other.canUpdateWorkingHours, canUpdateWorkingHours) || other.canUpdateWorkingHours == canUpdateWorkingHours)&&(identical(other.isPhoneVisible, isPhoneVisible) || other.isPhoneVisible == isPhoneVisible)&&(identical(other.phoneVisibleEditable, phoneVisibleEditable) || other.phoneVisibleEditable == phoneVisibleEditable)&&(identical(other.canUpdatePhoneVisibility, canUpdatePhoneVisibility) || other.canUpdatePhoneVisibility == canUpdatePhoneVisibility)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.educationFocus, educationFocus) || other.educationFocus == educationFocus)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.addressKtp, addressKtp) || other.addressKtp == addressKtp)&&(identical(other.village, village) || other.village == village)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,email,phoneNumber,workingHours,verificationStatus,workingHoursEditable,canUpdateWorkingHours,isPhoneVisible,phoneVisibleEditable,canUpdatePhoneVisibility,fullName,educationLevel,educationFocus,workExperience,addressKtp,village,districts,city,province,profilePhotoPath]);

@override
String toString() {
  return 'UserProfileEntity(id: $id, email: $email, phoneNumber: $phoneNumber, workingHours: $workingHours, verificationStatus: $verificationStatus, workingHoursEditable: $workingHoursEditable, canUpdateWorkingHours: $canUpdateWorkingHours, isPhoneVisible: $isPhoneVisible, phoneVisibleEditable: $phoneVisibleEditable, canUpdatePhoneVisibility: $canUpdatePhoneVisibility, fullName: $fullName, educationLevel: $educationLevel, educationFocus: $educationFocus, workExperience: $workExperience, addressKtp: $addressKtp, village: $village, districts: $districts, city: $city, province: $province, profilePhotoPath: $profilePhotoPath)';
}


}

/// @nodoc
abstract mixin class $UserProfileEntityCopyWith<$Res>  {
  factory $UserProfileEntityCopyWith(UserProfileEntity value, $Res Function(UserProfileEntity) _then) = _$UserProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String email, String phoneNumber, String workingHours, String verificationStatus, bool workingHoursEditable, bool canUpdateWorkingHours, bool isPhoneVisible, bool phoneVisibleEditable, bool canUpdatePhoneVisibility, String fullName, String educationLevel, String educationFocus, String workExperience, String addressKtp, String village, String districts, String city, String province, String profilePhotoPath
});




}
/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._self, this._then);

  final UserProfileEntity _self;
  final $Res Function(UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? phoneNumber = null,Object? workingHours = null,Object? verificationStatus = null,Object? workingHoursEditable = null,Object? canUpdateWorkingHours = null,Object? isPhoneVisible = null,Object? phoneVisibleEditable = null,Object? canUpdatePhoneVisibility = null,Object? fullName = null,Object? educationLevel = null,Object? educationFocus = null,Object? workExperience = null,Object? addressKtp = null,Object? village = null,Object? districts = null,Object? city = null,Object? province = null,Object? profilePhotoPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,workingHours: null == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,workingHoursEditable: null == workingHoursEditable ? _self.workingHoursEditable : workingHoursEditable // ignore: cast_nullable_to_non_nullable
as bool,canUpdateWorkingHours: null == canUpdateWorkingHours ? _self.canUpdateWorkingHours : canUpdateWorkingHours // ignore: cast_nullable_to_non_nullable
as bool,isPhoneVisible: null == isPhoneVisible ? _self.isPhoneVisible : isPhoneVisible // ignore: cast_nullable_to_non_nullable
as bool,phoneVisibleEditable: null == phoneVisibleEditable ? _self.phoneVisibleEditable : phoneVisibleEditable // ignore: cast_nullable_to_non_nullable
as bool,canUpdatePhoneVisibility: null == canUpdatePhoneVisibility ? _self.canUpdatePhoneVisibility : canUpdatePhoneVisibility // ignore: cast_nullable_to_non_nullable
as bool,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,educationFocus: null == educationFocus ? _self.educationFocus : educationFocus // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,addressKtp: null == addressKtp ? _self.addressKtp : addressKtp // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,profilePhotoPath: null == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileEntity].
extension UserProfileEntityPatterns on UserProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String phoneNumber,  String workingHours,  String verificationStatus,  bool workingHoursEditable,  bool canUpdateWorkingHours,  bool isPhoneVisible,  bool phoneVisibleEditable,  bool canUpdatePhoneVisibility,  String fullName,  String educationLevel,  String educationFocus,  String workExperience,  String addressKtp,  String village,  String districts,  String city,  String province,  String profilePhotoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.id,_that.email,_that.phoneNumber,_that.workingHours,_that.verificationStatus,_that.workingHoursEditable,_that.canUpdateWorkingHours,_that.isPhoneVisible,_that.phoneVisibleEditable,_that.canUpdatePhoneVisibility,_that.fullName,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.addressKtp,_that.village,_that.districts,_that.city,_that.province,_that.profilePhotoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String phoneNumber,  String workingHours,  String verificationStatus,  bool workingHoursEditable,  bool canUpdateWorkingHours,  bool isPhoneVisible,  bool phoneVisibleEditable,  bool canUpdatePhoneVisibility,  String fullName,  String educationLevel,  String educationFocus,  String workExperience,  String addressKtp,  String village,  String districts,  String city,  String province,  String profilePhotoPath)  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity():
return $default(_that.id,_that.email,_that.phoneNumber,_that.workingHours,_that.verificationStatus,_that.workingHoursEditable,_that.canUpdateWorkingHours,_that.isPhoneVisible,_that.phoneVisibleEditable,_that.canUpdatePhoneVisibility,_that.fullName,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.addressKtp,_that.village,_that.districts,_that.city,_that.province,_that.profilePhotoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String phoneNumber,  String workingHours,  String verificationStatus,  bool workingHoursEditable,  bool canUpdateWorkingHours,  bool isPhoneVisible,  bool phoneVisibleEditable,  bool canUpdatePhoneVisibility,  String fullName,  String educationLevel,  String educationFocus,  String workExperience,  String addressKtp,  String village,  String districts,  String city,  String province,  String profilePhotoPath)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.id,_that.email,_that.phoneNumber,_that.workingHours,_that.verificationStatus,_that.workingHoursEditable,_that.canUpdateWorkingHours,_that.isPhoneVisible,_that.phoneVisibleEditable,_that.canUpdatePhoneVisibility,_that.fullName,_that.educationLevel,_that.educationFocus,_that.workExperience,_that.addressKtp,_that.village,_that.districts,_that.city,_that.province,_that.profilePhotoPath);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileEntity extends UserProfileEntity {
  const _UserProfileEntity({required this.id, required this.email, required this.phoneNumber, required this.workingHours, required this.verificationStatus, this.workingHoursEditable = true, this.canUpdateWorkingHours = true, this.isPhoneVisible = true, this.phoneVisibleEditable = true, this.canUpdatePhoneVisibility = true, this.fullName = '', this.educationLevel = '', this.educationFocus = '', this.workExperience = '', this.addressKtp = '', this.village = '', this.districts = '', this.city = '', this.province = '', this.profilePhotoPath = ''}): super._();
  

/// ID unik pengguna
@override final  String id;
/// Email pengguna
@override final  String email;
/// Nomor telepon pengguna
@override final  String phoneNumber;
/// Jam kerja yang dipilih (e.g. 'fleksibel', 'pagi', 'malam')
@override final  String workingHours;
/// Status verifikasi ('verified', 'pending', 'unverified')
@override final  String verificationStatus;
/// Apakah user bisa mengubah jam kerja (state dari server, bisa false saat proses)
@override@JsonKey() final  bool workingHoursEditable;
/// Flag utama — apakah API mengizinkan update jam kerja saat ini.
/// Kontrol interaktivitas dropdown di UI.
@override@JsonKey() final  bool canUpdateWorkingHours;
/// Apakah nomor telepon ditampilkan ke publik
@override@JsonKey() final  bool isPhoneVisible;
/// Apakah user bisa mengubah visibilitas telepon (state dari server)
@override@JsonKey() final  bool phoneVisibleEditable;
/// Flag utama — apakah API mengizinkan update visibilitas telepon saat ini.
/// Kontrol interaktivitas switch di UI.
@override@JsonKey() final  bool canUpdatePhoneVisibility;
// ── Data dari user_info ──────────────────────────────────────────────────
/// Nama lengkap
@override@JsonKey() final  String fullName;
/// Tingkat pendidikan (e.g. 'SMP', 'SMA', 'Sarjana')
@override@JsonKey() final  String educationLevel;
/// Fokus/jurusan pendidikan (bisa kosong)
@override@JsonKey() final  String educationFocus;
/// Pengalaman kerja (satu string, dipisahkan koma)
@override@JsonKey() final  String workExperience;
/// Alamat sesuai KTP
@override@JsonKey() final  String addressKtp;
/// Kelurahan/Desa
@override@JsonKey() final  String village;
/// Kecamatan
@override@JsonKey() final  String districts;
/// Kota/Kabupaten
@override@JsonKey() final  String city;
/// Provinsi
@override@JsonKey() final  String province;
/// Path foto profil di server (kosong jika belum upload atau belum diset)
///
/// Contoh: 'storage/uploads/profiles/2026/04/15/xxx.jpg'
/// Gunakan [ApiConfig.buildImageUrl] untuk membentuk URL lengkap.
@override@JsonKey() final  String profilePhotoPath;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileEntityCopyWith<_UserProfileEntity> get copyWith => __$UserProfileEntityCopyWithImpl<_UserProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.workingHoursEditable, workingHoursEditable) || other.workingHoursEditable == workingHoursEditable)&&(identical(other.canUpdateWorkingHours, canUpdateWorkingHours) || other.canUpdateWorkingHours == canUpdateWorkingHours)&&(identical(other.isPhoneVisible, isPhoneVisible) || other.isPhoneVisible == isPhoneVisible)&&(identical(other.phoneVisibleEditable, phoneVisibleEditable) || other.phoneVisibleEditable == phoneVisibleEditable)&&(identical(other.canUpdatePhoneVisibility, canUpdatePhoneVisibility) || other.canUpdatePhoneVisibility == canUpdatePhoneVisibility)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.educationFocus, educationFocus) || other.educationFocus == educationFocus)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.addressKtp, addressKtp) || other.addressKtp == addressKtp)&&(identical(other.village, village) || other.village == village)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,email,phoneNumber,workingHours,verificationStatus,workingHoursEditable,canUpdateWorkingHours,isPhoneVisible,phoneVisibleEditable,canUpdatePhoneVisibility,fullName,educationLevel,educationFocus,workExperience,addressKtp,village,districts,city,province,profilePhotoPath]);

@override
String toString() {
  return 'UserProfileEntity(id: $id, email: $email, phoneNumber: $phoneNumber, workingHours: $workingHours, verificationStatus: $verificationStatus, workingHoursEditable: $workingHoursEditable, canUpdateWorkingHours: $canUpdateWorkingHours, isPhoneVisible: $isPhoneVisible, phoneVisibleEditable: $phoneVisibleEditable, canUpdatePhoneVisibility: $canUpdatePhoneVisibility, fullName: $fullName, educationLevel: $educationLevel, educationFocus: $educationFocus, workExperience: $workExperience, addressKtp: $addressKtp, village: $village, districts: $districts, city: $city, province: $province, profilePhotoPath: $profilePhotoPath)';
}


}

/// @nodoc
abstract mixin class _$UserProfileEntityCopyWith<$Res> implements $UserProfileEntityCopyWith<$Res> {
  factory _$UserProfileEntityCopyWith(_UserProfileEntity value, $Res Function(_UserProfileEntity) _then) = __$UserProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String phoneNumber, String workingHours, String verificationStatus, bool workingHoursEditable, bool canUpdateWorkingHours, bool isPhoneVisible, bool phoneVisibleEditable, bool canUpdatePhoneVisibility, String fullName, String educationLevel, String educationFocus, String workExperience, String addressKtp, String village, String districts, String city, String province, String profilePhotoPath
});




}
/// @nodoc
class __$UserProfileEntityCopyWithImpl<$Res>
    implements _$UserProfileEntityCopyWith<$Res> {
  __$UserProfileEntityCopyWithImpl(this._self, this._then);

  final _UserProfileEntity _self;
  final $Res Function(_UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? phoneNumber = null,Object? workingHours = null,Object? verificationStatus = null,Object? workingHoursEditable = null,Object? canUpdateWorkingHours = null,Object? isPhoneVisible = null,Object? phoneVisibleEditable = null,Object? canUpdatePhoneVisibility = null,Object? fullName = null,Object? educationLevel = null,Object? educationFocus = null,Object? workExperience = null,Object? addressKtp = null,Object? village = null,Object? districts = null,Object? city = null,Object? province = null,Object? profilePhotoPath = null,}) {
  return _then(_UserProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,workingHours: null == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,workingHoursEditable: null == workingHoursEditable ? _self.workingHoursEditable : workingHoursEditable // ignore: cast_nullable_to_non_nullable
as bool,canUpdateWorkingHours: null == canUpdateWorkingHours ? _self.canUpdateWorkingHours : canUpdateWorkingHours // ignore: cast_nullable_to_non_nullable
as bool,isPhoneVisible: null == isPhoneVisible ? _self.isPhoneVisible : isPhoneVisible // ignore: cast_nullable_to_non_nullable
as bool,phoneVisibleEditable: null == phoneVisibleEditable ? _self.phoneVisibleEditable : phoneVisibleEditable // ignore: cast_nullable_to_non_nullable
as bool,canUpdatePhoneVisibility: null == canUpdatePhoneVisibility ? _self.canUpdatePhoneVisibility : canUpdatePhoneVisibility // ignore: cast_nullable_to_non_nullable
as bool,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,educationFocus: null == educationFocus ? _self.educationFocus : educationFocus // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,addressKtp: null == addressKtp ? _self.addressKtp : addressKtp // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,profilePhotoPath: null == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
