// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileSummary {

/// ID unik pengguna
 String get id;/// Email pengguna
 String get email;/// Nomor telepon pengguna
 String get phoneNumber;/// Nama lengkap pengguna (dari user_info.full_name)
 String get fullName;/// Jenis kelamin: 'L' (Laki-laki) atau 'P' (Perempuan)
 String get gender;/// Umur pengguna dalam tahun (dari user_info.age)
 int get age;/// Rating pengguna (default 0.0 jika belum ada)
 double get rating;/// Path foto profil (bisa kosong jika belum upload)
 String get profilePhotoPath;/// Total iklan pekerjaan yang dibuat
 int get totalJobAds;/// Total iklan pekerja yang dibuat
 int get totalWorkerAds;/// Total iklan barang bekas yang dibuat
 int get totalSecondhandAds;/// Total iklan pelatihan yang dibuat
 int get totalTrainingAds;/// Total seluruh iklan
 int get totalAds;
/// Create a copy of UserProfileSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileSummaryCopyWith<UserProfileSummary> get copyWith => _$UserProfileSummaryCopyWithImpl<UserProfileSummary>(this as UserProfileSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.totalJobAds, totalJobAds) || other.totalJobAds == totalJobAds)&&(identical(other.totalWorkerAds, totalWorkerAds) || other.totalWorkerAds == totalWorkerAds)&&(identical(other.totalSecondhandAds, totalSecondhandAds) || other.totalSecondhandAds == totalSecondhandAds)&&(identical(other.totalTrainingAds, totalTrainingAds) || other.totalTrainingAds == totalTrainingAds)&&(identical(other.totalAds, totalAds) || other.totalAds == totalAds));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,phoneNumber,fullName,gender,age,rating,profilePhotoPath,totalJobAds,totalWorkerAds,totalSecondhandAds,totalTrainingAds,totalAds);

@override
String toString() {
  return 'UserProfileSummary(id: $id, email: $email, phoneNumber: $phoneNumber, fullName: $fullName, gender: $gender, age: $age, rating: $rating, profilePhotoPath: $profilePhotoPath, totalJobAds: $totalJobAds, totalWorkerAds: $totalWorkerAds, totalSecondhandAds: $totalSecondhandAds, totalTrainingAds: $totalTrainingAds, totalAds: $totalAds)';
}


}

/// @nodoc
abstract mixin class $UserProfileSummaryCopyWith<$Res>  {
  factory $UserProfileSummaryCopyWith(UserProfileSummary value, $Res Function(UserProfileSummary) _then) = _$UserProfileSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String email, String phoneNumber, String fullName, String gender, int age, double rating, String profilePhotoPath, int totalJobAds, int totalWorkerAds, int totalSecondhandAds, int totalTrainingAds, int totalAds
});




}
/// @nodoc
class _$UserProfileSummaryCopyWithImpl<$Res>
    implements $UserProfileSummaryCopyWith<$Res> {
  _$UserProfileSummaryCopyWithImpl(this._self, this._then);

  final UserProfileSummary _self;
  final $Res Function(UserProfileSummary) _then;

/// Create a copy of UserProfileSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? phoneNumber = null,Object? fullName = null,Object? gender = null,Object? age = null,Object? rating = null,Object? profilePhotoPath = null,Object? totalJobAds = null,Object? totalWorkerAds = null,Object? totalSecondhandAds = null,Object? totalTrainingAds = null,Object? totalAds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,profilePhotoPath: null == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,totalJobAds: null == totalJobAds ? _self.totalJobAds : totalJobAds // ignore: cast_nullable_to_non_nullable
as int,totalWorkerAds: null == totalWorkerAds ? _self.totalWorkerAds : totalWorkerAds // ignore: cast_nullable_to_non_nullable
as int,totalSecondhandAds: null == totalSecondhandAds ? _self.totalSecondhandAds : totalSecondhandAds // ignore: cast_nullable_to_non_nullable
as int,totalTrainingAds: null == totalTrainingAds ? _self.totalTrainingAds : totalTrainingAds // ignore: cast_nullable_to_non_nullable
as int,totalAds: null == totalAds ? _self.totalAds : totalAds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileSummary].
extension UserProfileSummaryPatterns on UserProfileSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileSummary value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileSummary value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String phoneNumber,  String fullName,  String gender,  int age,  double rating,  String profilePhotoPath,  int totalJobAds,  int totalWorkerAds,  int totalSecondhandAds,  int totalTrainingAds,  int totalAds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileSummary() when $default != null:
return $default(_that.id,_that.email,_that.phoneNumber,_that.fullName,_that.gender,_that.age,_that.rating,_that.profilePhotoPath,_that.totalJobAds,_that.totalWorkerAds,_that.totalSecondhandAds,_that.totalTrainingAds,_that.totalAds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String phoneNumber,  String fullName,  String gender,  int age,  double rating,  String profilePhotoPath,  int totalJobAds,  int totalWorkerAds,  int totalSecondhandAds,  int totalTrainingAds,  int totalAds)  $default,) {final _that = this;
switch (_that) {
case _UserProfileSummary():
return $default(_that.id,_that.email,_that.phoneNumber,_that.fullName,_that.gender,_that.age,_that.rating,_that.profilePhotoPath,_that.totalJobAds,_that.totalWorkerAds,_that.totalSecondhandAds,_that.totalTrainingAds,_that.totalAds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String phoneNumber,  String fullName,  String gender,  int age,  double rating,  String profilePhotoPath,  int totalJobAds,  int totalWorkerAds,  int totalSecondhandAds,  int totalTrainingAds,  int totalAds)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileSummary() when $default != null:
return $default(_that.id,_that.email,_that.phoneNumber,_that.fullName,_that.gender,_that.age,_that.rating,_that.profilePhotoPath,_that.totalJobAds,_that.totalWorkerAds,_that.totalSecondhandAds,_that.totalTrainingAds,_that.totalAds);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileSummary implements UserProfileSummary {
  const _UserProfileSummary({required this.id, required this.email, required this.phoneNumber, required this.fullName, required this.gender, required this.age, this.rating = 0.0, this.profilePhotoPath = '', this.totalJobAds = 0, this.totalWorkerAds = 0, this.totalSecondhandAds = 0, this.totalTrainingAds = 0, this.totalAds = 0});
  

/// ID unik pengguna
@override final  String id;
/// Email pengguna
@override final  String email;
/// Nomor telepon pengguna
@override final  String phoneNumber;
/// Nama lengkap pengguna (dari user_info.full_name)
@override final  String fullName;
/// Jenis kelamin: 'L' (Laki-laki) atau 'P' (Perempuan)
@override final  String gender;
/// Umur pengguna dalam tahun (dari user_info.age)
@override final  int age;
/// Rating pengguna (default 0.0 jika belum ada)
@override@JsonKey() final  double rating;
/// Path foto profil (bisa kosong jika belum upload)
@override@JsonKey() final  String profilePhotoPath;
/// Total iklan pekerjaan yang dibuat
@override@JsonKey() final  int totalJobAds;
/// Total iklan pekerja yang dibuat
@override@JsonKey() final  int totalWorkerAds;
/// Total iklan barang bekas yang dibuat
@override@JsonKey() final  int totalSecondhandAds;
/// Total iklan pelatihan yang dibuat
@override@JsonKey() final  int totalTrainingAds;
/// Total seluruh iklan
@override@JsonKey() final  int totalAds;

/// Create a copy of UserProfileSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileSummaryCopyWith<_UserProfileSummary> get copyWith => __$UserProfileSummaryCopyWithImpl<_UserProfileSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.totalJobAds, totalJobAds) || other.totalJobAds == totalJobAds)&&(identical(other.totalWorkerAds, totalWorkerAds) || other.totalWorkerAds == totalWorkerAds)&&(identical(other.totalSecondhandAds, totalSecondhandAds) || other.totalSecondhandAds == totalSecondhandAds)&&(identical(other.totalTrainingAds, totalTrainingAds) || other.totalTrainingAds == totalTrainingAds)&&(identical(other.totalAds, totalAds) || other.totalAds == totalAds));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,phoneNumber,fullName,gender,age,rating,profilePhotoPath,totalJobAds,totalWorkerAds,totalSecondhandAds,totalTrainingAds,totalAds);

@override
String toString() {
  return 'UserProfileSummary(id: $id, email: $email, phoneNumber: $phoneNumber, fullName: $fullName, gender: $gender, age: $age, rating: $rating, profilePhotoPath: $profilePhotoPath, totalJobAds: $totalJobAds, totalWorkerAds: $totalWorkerAds, totalSecondhandAds: $totalSecondhandAds, totalTrainingAds: $totalTrainingAds, totalAds: $totalAds)';
}


}

/// @nodoc
abstract mixin class _$UserProfileSummaryCopyWith<$Res> implements $UserProfileSummaryCopyWith<$Res> {
  factory _$UserProfileSummaryCopyWith(_UserProfileSummary value, $Res Function(_UserProfileSummary) _then) = __$UserProfileSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String phoneNumber, String fullName, String gender, int age, double rating, String profilePhotoPath, int totalJobAds, int totalWorkerAds, int totalSecondhandAds, int totalTrainingAds, int totalAds
});




}
/// @nodoc
class __$UserProfileSummaryCopyWithImpl<$Res>
    implements _$UserProfileSummaryCopyWith<$Res> {
  __$UserProfileSummaryCopyWithImpl(this._self, this._then);

  final _UserProfileSummary _self;
  final $Res Function(_UserProfileSummary) _then;

/// Create a copy of UserProfileSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? phoneNumber = null,Object? fullName = null,Object? gender = null,Object? age = null,Object? rating = null,Object? profilePhotoPath = null,Object? totalJobAds = null,Object? totalWorkerAds = null,Object? totalSecondhandAds = null,Object? totalTrainingAds = null,Object? totalAds = null,}) {
  return _then(_UserProfileSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,profilePhotoPath: null == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,totalJobAds: null == totalJobAds ? _self.totalJobAds : totalJobAds // ignore: cast_nullable_to_non_nullable
as int,totalWorkerAds: null == totalWorkerAds ? _self.totalWorkerAds : totalWorkerAds // ignore: cast_nullable_to_non_nullable
as int,totalSecondhandAds: null == totalSecondhandAds ? _self.totalSecondhandAds : totalSecondhandAds // ignore: cast_nullable_to_non_nullable
as int,totalTrainingAds: null == totalTrainingAds ? _self.totalTrainingAds : totalTrainingAds // ignore: cast_nullable_to_non_nullable
as int,totalAds: null == totalAds ? _self.totalAds : totalAds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
