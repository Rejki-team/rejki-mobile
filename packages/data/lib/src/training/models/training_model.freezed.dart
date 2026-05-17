// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingModel {

 String get id; String get title; String get description;@JsonKey(name: 'company_name') String get companyName;@JsonKey(name: 'location_address') String get locationAddress;@JsonKey(name: 'date_of_training') String get dateOfTraining;@JsonKey(name: 'fee_per_person') int get feePerPerson; String get status;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'ad_code') String? get adCode; String? get email; String? get role; String? get province; String? get city; String? get district; String? get village; String? get certificate;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'bank_name') String get bankName;@JsonKey(name: 'bank_account_number') String get bankAccountNumber;@JsonKey(name: 'bank_account_holder_name') String get bankAccountHolderName; List<String> get facilities;@JsonKey(name: 'total_approved_enrollees') int get totalApprovedEnrollees; List<TrainingImageModel> get images;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingModelCopyWith<TrainingModel> get copyWith => _$TrainingModelCopyWithImpl<TrainingModel>(this as TrainingModel, _$identity);

  /// Serializes this TrainingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.dateOfTraining, dateOfTraining) || other.dateOfTraining == dateOfTraining)&&(identical(other.feePerPerson, feePerPerson) || other.feePerPerson == feePerPerson)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.village, village) || other.village == village)&&(identical(other.certificate, certificate) || other.certificate == certificate)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountHolderName, bankAccountHolderName) || other.bankAccountHolderName == bankAccountHolderName)&&const DeepCollectionEquality().equals(other.facilities, facilities)&&(identical(other.totalApprovedEnrollees, totalApprovedEnrollees) || other.totalApprovedEnrollees == totalApprovedEnrollees)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,companyName,locationAddress,dateOfTraining,feePerPerson,status,userId,adCode,email,role,province,city,district,village,certificate,rejectionReason,bankName,bankAccountNumber,bankAccountHolderName,const DeepCollectionEquality().hash(facilities),totalApprovedEnrollees,const DeepCollectionEquality().hash(images),createdAt,updatedAt]);

@override
String toString() {
  return 'TrainingModel(id: $id, title: $title, description: $description, companyName: $companyName, locationAddress: $locationAddress, dateOfTraining: $dateOfTraining, feePerPerson: $feePerPerson, status: $status, userId: $userId, adCode: $adCode, email: $email, role: $role, province: $province, city: $city, district: $district, village: $village, certificate: $certificate, rejectionReason: $rejectionReason, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolderName: $bankAccountHolderName, facilities: $facilities, totalApprovedEnrollees: $totalApprovedEnrollees, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingModelCopyWith<$Res>  {
  factory $TrainingModelCopyWith(TrainingModel value, $Res Function(TrainingModel) _then) = _$TrainingModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'location_address') String locationAddress,@JsonKey(name: 'date_of_training') String dateOfTraining,@JsonKey(name: 'fee_per_person') int feePerPerson, String status,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'ad_code') String? adCode, String? email, String? role, String? province, String? city, String? district, String? village, String? certificate,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'bank_name') String bankName,@JsonKey(name: 'bank_account_number') String bankAccountNumber,@JsonKey(name: 'bank_account_holder_name') String bankAccountHolderName, List<String> facilities,@JsonKey(name: 'total_approved_enrollees') int totalApprovedEnrollees, List<TrainingImageModel> images,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TrainingModelCopyWithImpl<$Res>
    implements $TrainingModelCopyWith<$Res> {
  _$TrainingModelCopyWithImpl(this._self, this._then);

  final TrainingModel _self;
  final $Res Function(TrainingModel) _then;

/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? companyName = null,Object? locationAddress = null,Object? dateOfTraining = null,Object? feePerPerson = null,Object? status = null,Object? userId = null,Object? adCode = freezed,Object? email = freezed,Object? role = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? village = freezed,Object? certificate = freezed,Object? rejectionReason = freezed,Object? bankName = null,Object? bankAccountNumber = null,Object? bankAccountHolderName = null,Object? facilities = null,Object? totalApprovedEnrollees = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,locationAddress: null == locationAddress ? _self.locationAddress : locationAddress // ignore: cast_nullable_to_non_nullable
as String,dateOfTraining: null == dateOfTraining ? _self.dateOfTraining : dateOfTraining // ignore: cast_nullable_to_non_nullable
as String,feePerPerson: null == feePerPerson ? _self.feePerPerson : feePerPerson // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,adCode: freezed == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,certificate: freezed == certificate ? _self.certificate : certificate // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: null == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String,bankAccountHolderName: null == bankAccountHolderName ? _self.bankAccountHolderName : bankAccountHolderName // ignore: cast_nullable_to_non_nullable
as String,facilities: null == facilities ? _self.facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<String>,totalApprovedEnrollees: null == totalApprovedEnrollees ? _self.totalApprovedEnrollees : totalApprovedEnrollees // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<TrainingImageModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingModel].
extension TrainingModelPatterns on TrainingModel {
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'location_address')  String locationAddress, @JsonKey(name: 'date_of_training')  String dateOfTraining, @JsonKey(name: 'fee_per_person')  int feePerPerson,  String status, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'ad_code')  String? adCode,  String? email,  String? role,  String? province,  String? city,  String? district,  String? village,  String? certificate, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'bank_name')  String bankName, @JsonKey(name: 'bank_account_number')  String bankAccountNumber, @JsonKey(name: 'bank_account_holder_name')  String bankAccountHolderName,  List<String> facilities, @JsonKey(name: 'total_approved_enrollees')  int totalApprovedEnrollees,  List<TrainingImageModel> images, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.companyName,_that.locationAddress,_that.dateOfTraining,_that.feePerPerson,_that.status,_that.userId,_that.adCode,_that.email,_that.role,_that.province,_that.city,_that.district,_that.village,_that.certificate,_that.rejectionReason,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolderName,_that.facilities,_that.totalApprovedEnrollees,_that.images,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'location_address')  String locationAddress, @JsonKey(name: 'date_of_training')  String dateOfTraining, @JsonKey(name: 'fee_per_person')  int feePerPerson,  String status, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'ad_code')  String? adCode,  String? email,  String? role,  String? province,  String? city,  String? district,  String? village,  String? certificate, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'bank_name')  String bankName, @JsonKey(name: 'bank_account_number')  String bankAccountNumber, @JsonKey(name: 'bank_account_holder_name')  String bankAccountHolderName,  List<String> facilities, @JsonKey(name: 'total_approved_enrollees')  int totalApprovedEnrollees,  List<TrainingImageModel> images, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingModel():
return $default(_that.id,_that.title,_that.description,_that.companyName,_that.locationAddress,_that.dateOfTraining,_that.feePerPerson,_that.status,_that.userId,_that.adCode,_that.email,_that.role,_that.province,_that.city,_that.district,_that.village,_that.certificate,_that.rejectionReason,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolderName,_that.facilities,_that.totalApprovedEnrollees,_that.images,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'location_address')  String locationAddress, @JsonKey(name: 'date_of_training')  String dateOfTraining, @JsonKey(name: 'fee_per_person')  int feePerPerson,  String status, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'ad_code')  String? adCode,  String? email,  String? role,  String? province,  String? city,  String? district,  String? village,  String? certificate, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'bank_name')  String bankName, @JsonKey(name: 'bank_account_number')  String bankAccountNumber, @JsonKey(name: 'bank_account_holder_name')  String bankAccountHolderName,  List<String> facilities, @JsonKey(name: 'total_approved_enrollees')  int totalApprovedEnrollees,  List<TrainingImageModel> images, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.companyName,_that.locationAddress,_that.dateOfTraining,_that.feePerPerson,_that.status,_that.userId,_that.adCode,_that.email,_that.role,_that.province,_that.city,_that.district,_that.village,_that.certificate,_that.rejectionReason,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolderName,_that.facilities,_that.totalApprovedEnrollees,_that.images,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingModel extends TrainingModel {
  const _TrainingModel({required this.id, required this.title, required this.description, @JsonKey(name: 'company_name') required this.companyName, @JsonKey(name: 'location_address') required this.locationAddress, @JsonKey(name: 'date_of_training') required this.dateOfTraining, @JsonKey(name: 'fee_per_person') required this.feePerPerson, required this.status, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'ad_code') this.adCode, this.email, this.role, this.province, this.city, this.district, this.village, this.certificate, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'bank_name') this.bankName = '', @JsonKey(name: 'bank_account_number') this.bankAccountNumber = '', @JsonKey(name: 'bank_account_holder_name') this.bankAccountHolderName = '', final  List<String> facilities = const [], @JsonKey(name: 'total_approved_enrollees') this.totalApprovedEnrollees = 0, final  List<TrainingImageModel> images = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _facilities = facilities,_images = images,super._();
  factory _TrainingModel.fromJson(Map<String, dynamic> json) => _$TrainingModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'company_name') final  String companyName;
@override@JsonKey(name: 'location_address') final  String locationAddress;
@override@JsonKey(name: 'date_of_training') final  String dateOfTraining;
@override@JsonKey(name: 'fee_per_person') final  int feePerPerson;
@override final  String status;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'ad_code') final  String? adCode;
@override final  String? email;
@override final  String? role;
@override final  String? province;
@override final  String? city;
@override final  String? district;
@override final  String? village;
@override final  String? certificate;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'bank_name') final  String bankName;
@override@JsonKey(name: 'bank_account_number') final  String bankAccountNumber;
@override@JsonKey(name: 'bank_account_holder_name') final  String bankAccountHolderName;
 final  List<String> _facilities;
@override@JsonKey() List<String> get facilities {
  if (_facilities is EqualUnmodifiableListView) return _facilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facilities);
}

@override@JsonKey(name: 'total_approved_enrollees') final  int totalApprovedEnrollees;
 final  List<TrainingImageModel> _images;
@override@JsonKey() List<TrainingImageModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingModelCopyWith<_TrainingModel> get copyWith => __$TrainingModelCopyWithImpl<_TrainingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.dateOfTraining, dateOfTraining) || other.dateOfTraining == dateOfTraining)&&(identical(other.feePerPerson, feePerPerson) || other.feePerPerson == feePerPerson)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.village, village) || other.village == village)&&(identical(other.certificate, certificate) || other.certificate == certificate)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountHolderName, bankAccountHolderName) || other.bankAccountHolderName == bankAccountHolderName)&&const DeepCollectionEquality().equals(other._facilities, _facilities)&&(identical(other.totalApprovedEnrollees, totalApprovedEnrollees) || other.totalApprovedEnrollees == totalApprovedEnrollees)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,companyName,locationAddress,dateOfTraining,feePerPerson,status,userId,adCode,email,role,province,city,district,village,certificate,rejectionReason,bankName,bankAccountNumber,bankAccountHolderName,const DeepCollectionEquality().hash(_facilities),totalApprovedEnrollees,const DeepCollectionEquality().hash(_images),createdAt,updatedAt]);

@override
String toString() {
  return 'TrainingModel(id: $id, title: $title, description: $description, companyName: $companyName, locationAddress: $locationAddress, dateOfTraining: $dateOfTraining, feePerPerson: $feePerPerson, status: $status, userId: $userId, adCode: $adCode, email: $email, role: $role, province: $province, city: $city, district: $district, village: $village, certificate: $certificate, rejectionReason: $rejectionReason, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolderName: $bankAccountHolderName, facilities: $facilities, totalApprovedEnrollees: $totalApprovedEnrollees, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingModelCopyWith<$Res> implements $TrainingModelCopyWith<$Res> {
  factory _$TrainingModelCopyWith(_TrainingModel value, $Res Function(_TrainingModel) _then) = __$TrainingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'location_address') String locationAddress,@JsonKey(name: 'date_of_training') String dateOfTraining,@JsonKey(name: 'fee_per_person') int feePerPerson, String status,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'ad_code') String? adCode, String? email, String? role, String? province, String? city, String? district, String? village, String? certificate,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'bank_name') String bankName,@JsonKey(name: 'bank_account_number') String bankAccountNumber,@JsonKey(name: 'bank_account_holder_name') String bankAccountHolderName, List<String> facilities,@JsonKey(name: 'total_approved_enrollees') int totalApprovedEnrollees, List<TrainingImageModel> images,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$TrainingModelCopyWithImpl<$Res>
    implements _$TrainingModelCopyWith<$Res> {
  __$TrainingModelCopyWithImpl(this._self, this._then);

  final _TrainingModel _self;
  final $Res Function(_TrainingModel) _then;

/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? companyName = null,Object? locationAddress = null,Object? dateOfTraining = null,Object? feePerPerson = null,Object? status = null,Object? userId = null,Object? adCode = freezed,Object? email = freezed,Object? role = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? village = freezed,Object? certificate = freezed,Object? rejectionReason = freezed,Object? bankName = null,Object? bankAccountNumber = null,Object? bankAccountHolderName = null,Object? facilities = null,Object? totalApprovedEnrollees = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TrainingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,locationAddress: null == locationAddress ? _self.locationAddress : locationAddress // ignore: cast_nullable_to_non_nullable
as String,dateOfTraining: null == dateOfTraining ? _self.dateOfTraining : dateOfTraining // ignore: cast_nullable_to_non_nullable
as String,feePerPerson: null == feePerPerson ? _self.feePerPerson : feePerPerson // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,adCode: freezed == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,certificate: freezed == certificate ? _self.certificate : certificate // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: null == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String,bankAccountHolderName: null == bankAccountHolderName ? _self.bankAccountHolderName : bankAccountHolderName // ignore: cast_nullable_to_non_nullable
as String,facilities: null == facilities ? _self._facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<String>,totalApprovedEnrollees: null == totalApprovedEnrollees ? _self.totalApprovedEnrollees : totalApprovedEnrollees // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<TrainingImageModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
