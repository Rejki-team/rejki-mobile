// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String get email;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'working_hours') String get workingHours;@JsonKey(name: 'verification_status') String get verificationStatus;@JsonKey(name: 'is_preview_credential') bool get isPreviewCredential; String get role; String get status;@JsonKey(name: 'profile_photo_path') String get profilePhotoPath;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'user_info') UserInfoModel get userInfo;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.isPreviewCredential, isPreviewCredential) || other.isPreviewCredential == isPreviewCredential)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,phoneNumber,workingHours,verificationStatus,isPreviewCredential,role,status,profilePhotoPath,createdAt,updatedAt,userInfo);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, phoneNumber: $phoneNumber, workingHours: $workingHours, verificationStatus: $verificationStatus, isPreviewCredential: $isPreviewCredential, role: $role, status: $status, profilePhotoPath: $profilePhotoPath, createdAt: $createdAt, updatedAt: $updatedAt, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'working_hours') String workingHours,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'is_preview_credential') bool isPreviewCredential, String role, String status,@JsonKey(name: 'profile_photo_path') String profilePhotoPath,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'user_info') UserInfoModel userInfo
});


$UserInfoModelCopyWith<$Res> get userInfo;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? phoneNumber = null,Object? workingHours = null,Object? verificationStatus = null,Object? isPreviewCredential = null,Object? role = null,Object? status = null,Object? profilePhotoPath = null,Object? createdAt = null,Object? updatedAt = null,Object? userInfo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,workingHours: null == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,isPreviewCredential: null == isPreviewCredential ? _self.isPreviewCredential : isPreviewCredential // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,profilePhotoPath: null == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,userInfo: null == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfoModel,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res> get userInfo {
  
  return $UserInfoModelCopyWith<$Res>(_self.userInfo, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'working_hours')  String workingHours, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'is_preview_credential')  bool isPreviewCredential,  String role,  String status, @JsonKey(name: 'profile_photo_path')  String profilePhotoPath, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'user_info')  UserInfoModel userInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.phoneNumber,_that.workingHours,_that.verificationStatus,_that.isPreviewCredential,_that.role,_that.status,_that.profilePhotoPath,_that.createdAt,_that.updatedAt,_that.userInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'working_hours')  String workingHours, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'is_preview_credential')  bool isPreviewCredential,  String role,  String status, @JsonKey(name: 'profile_photo_path')  String profilePhotoPath, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'user_info')  UserInfoModel userInfo)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.email,_that.phoneNumber,_that.workingHours,_that.verificationStatus,_that.isPreviewCredential,_that.role,_that.status,_that.profilePhotoPath,_that.createdAt,_that.updatedAt,_that.userInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'working_hours')  String workingHours, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'is_preview_credential')  bool isPreviewCredential,  String role,  String status, @JsonKey(name: 'profile_photo_path')  String profilePhotoPath, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'user_info')  UserInfoModel userInfo)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.phoneNumber,_that.workingHours,_that.verificationStatus,_that.isPreviewCredential,_that.role,_that.status,_that.profilePhotoPath,_that.createdAt,_that.updatedAt,_that.userInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.email, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'working_hours') required this.workingHours, @JsonKey(name: 'verification_status') required this.verificationStatus, @JsonKey(name: 'is_preview_credential') required this.isPreviewCredential, required this.role, required this.status, @JsonKey(name: 'profile_photo_path') this.profilePhotoPath = '', @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'user_info') required this.userInfo});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'working_hours') final  String workingHours;
@override@JsonKey(name: 'verification_status') final  String verificationStatus;
@override@JsonKey(name: 'is_preview_credential') final  bool isPreviewCredential;
@override final  String role;
@override final  String status;
@override@JsonKey(name: 'profile_photo_path') final  String profilePhotoPath;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'user_info') final  UserInfoModel userInfo;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.isPreviewCredential, isPreviewCredential) || other.isPreviewCredential == isPreviewCredential)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,phoneNumber,workingHours,verificationStatus,isPreviewCredential,role,status,profilePhotoPath,createdAt,updatedAt,userInfo);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, phoneNumber: $phoneNumber, workingHours: $workingHours, verificationStatus: $verificationStatus, isPreviewCredential: $isPreviewCredential, role: $role, status: $status, profilePhotoPath: $profilePhotoPath, createdAt: $createdAt, updatedAt: $updatedAt, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'working_hours') String workingHours,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'is_preview_credential') bool isPreviewCredential, String role, String status,@JsonKey(name: 'profile_photo_path') String profilePhotoPath,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'user_info') UserInfoModel userInfo
});


@override $UserInfoModelCopyWith<$Res> get userInfo;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? phoneNumber = null,Object? workingHours = null,Object? verificationStatus = null,Object? isPreviewCredential = null,Object? role = null,Object? status = null,Object? profilePhotoPath = null,Object? createdAt = null,Object? updatedAt = null,Object? userInfo = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,workingHours: null == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,isPreviewCredential: null == isPreviewCredential ? _self.isPreviewCredential : isPreviewCredential // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,profilePhotoPath: null == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,userInfo: null == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfoModel,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res> get userInfo {
  
  return $UserInfoModelCopyWith<$Res>(_self.userInfo, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}

// dart format on
