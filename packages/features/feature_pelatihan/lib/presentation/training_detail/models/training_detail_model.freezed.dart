// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingDetailModel {

 String get id; String? get imageUrl; String get title; String get badge; String get description; String get date; String get time; String get location; List<TrainingFacilityModel> get facilities; List<String> get requirements; String get fee; String get feeNotice; String get companyName; String get status; String? get adCode; String? get rejectionReason; int get totalApprovedEnrollees; String? get contactEmail; String? get contactRole; String? get region; String? get bankName; String? get bankAccountNumber; String? get bankAccountHolderName;
/// Create a copy of TrainingDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingDetailModelCopyWith<TrainingDetailModel> get copyWith => _$TrainingDetailModelCopyWithImpl<TrainingDetailModel>(this as TrainingDetailModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.facilities, facilities)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.feeNotice, feeNotice) || other.feeNotice == feeNotice)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.status, status) || other.status == status)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.totalApprovedEnrollees, totalApprovedEnrollees) || other.totalApprovedEnrollees == totalApprovedEnrollees)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactRole, contactRole) || other.contactRole == contactRole)&&(identical(other.region, region) || other.region == region)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountHolderName, bankAccountHolderName) || other.bankAccountHolderName == bankAccountHolderName));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,imageUrl,title,badge,description,date,time,location,const DeepCollectionEquality().hash(facilities),const DeepCollectionEquality().hash(requirements),fee,feeNotice,companyName,status,adCode,rejectionReason,totalApprovedEnrollees,contactEmail,contactRole,region,bankName,bankAccountNumber,bankAccountHolderName]);

@override
String toString() {
  return 'TrainingDetailModel(id: $id, imageUrl: $imageUrl, title: $title, badge: $badge, description: $description, date: $date, time: $time, location: $location, facilities: $facilities, requirements: $requirements, fee: $fee, feeNotice: $feeNotice, companyName: $companyName, status: $status, adCode: $adCode, rejectionReason: $rejectionReason, totalApprovedEnrollees: $totalApprovedEnrollees, contactEmail: $contactEmail, contactRole: $contactRole, region: $region, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolderName: $bankAccountHolderName)';
}


}

/// @nodoc
abstract mixin class $TrainingDetailModelCopyWith<$Res>  {
  factory $TrainingDetailModelCopyWith(TrainingDetailModel value, $Res Function(TrainingDetailModel) _then) = _$TrainingDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String? imageUrl, String title, String badge, String description, String date, String time, String location, List<TrainingFacilityModel> facilities, List<String> requirements, String fee, String feeNotice, String companyName, String status, String? adCode, String? rejectionReason, int totalApprovedEnrollees, String? contactEmail, String? contactRole, String? region, String? bankName, String? bankAccountNumber, String? bankAccountHolderName
});




}
/// @nodoc
class _$TrainingDetailModelCopyWithImpl<$Res>
    implements $TrainingDetailModelCopyWith<$Res> {
  _$TrainingDetailModelCopyWithImpl(this._self, this._then);

  final TrainingDetailModel _self;
  final $Res Function(TrainingDetailModel) _then;

/// Create a copy of TrainingDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = freezed,Object? title = null,Object? badge = null,Object? description = null,Object? date = null,Object? time = null,Object? location = null,Object? facilities = null,Object? requirements = null,Object? fee = null,Object? feeNotice = null,Object? companyName = null,Object? status = null,Object? adCode = freezed,Object? rejectionReason = freezed,Object? totalApprovedEnrollees = null,Object? contactEmail = freezed,Object? contactRole = freezed,Object? region = freezed,Object? bankName = freezed,Object? bankAccountNumber = freezed,Object? bankAccountHolderName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,facilities: null == facilities ? _self.facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<TrainingFacilityModel>,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as String,feeNotice: null == feeNotice ? _self.feeNotice : feeNotice // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,adCode: freezed == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,totalApprovedEnrollees: null == totalApprovedEnrollees ? _self.totalApprovedEnrollees : totalApprovedEnrollees // ignore: cast_nullable_to_non_nullable
as int,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactRole: freezed == contactRole ? _self.contactRole : contactRole // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankAccountNumber: freezed == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,bankAccountHolderName: freezed == bankAccountHolderName ? _self.bankAccountHolderName : bankAccountHolderName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingDetailModel].
extension TrainingDetailModelPatterns on TrainingDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String title,  String badge,  String description,  String date,  String time,  String location,  List<TrainingFacilityModel> facilities,  List<String> requirements,  String fee,  String feeNotice,  String companyName,  String status,  String? adCode,  String? rejectionReason,  int totalApprovedEnrollees,  String? contactEmail,  String? contactRole,  String? region,  String? bankName,  String? bankAccountNumber,  String? bankAccountHolderName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingDetailModel() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.badge,_that.description,_that.date,_that.time,_that.location,_that.facilities,_that.requirements,_that.fee,_that.feeNotice,_that.companyName,_that.status,_that.adCode,_that.rejectionReason,_that.totalApprovedEnrollees,_that.contactEmail,_that.contactRole,_that.region,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolderName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String title,  String badge,  String description,  String date,  String time,  String location,  List<TrainingFacilityModel> facilities,  List<String> requirements,  String fee,  String feeNotice,  String companyName,  String status,  String? adCode,  String? rejectionReason,  int totalApprovedEnrollees,  String? contactEmail,  String? contactRole,  String? region,  String? bankName,  String? bankAccountNumber,  String? bankAccountHolderName)  $default,) {final _that = this;
switch (_that) {
case _TrainingDetailModel():
return $default(_that.id,_that.imageUrl,_that.title,_that.badge,_that.description,_that.date,_that.time,_that.location,_that.facilities,_that.requirements,_that.fee,_that.feeNotice,_that.companyName,_that.status,_that.adCode,_that.rejectionReason,_that.totalApprovedEnrollees,_that.contactEmail,_that.contactRole,_that.region,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolderName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? imageUrl,  String title,  String badge,  String description,  String date,  String time,  String location,  List<TrainingFacilityModel> facilities,  List<String> requirements,  String fee,  String feeNotice,  String companyName,  String status,  String? adCode,  String? rejectionReason,  int totalApprovedEnrollees,  String? contactEmail,  String? contactRole,  String? region,  String? bankName,  String? bankAccountNumber,  String? bankAccountHolderName)?  $default,) {final _that = this;
switch (_that) {
case _TrainingDetailModel() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.badge,_that.description,_that.date,_that.time,_that.location,_that.facilities,_that.requirements,_that.fee,_that.feeNotice,_that.companyName,_that.status,_that.adCode,_that.rejectionReason,_that.totalApprovedEnrollees,_that.contactEmail,_that.contactRole,_that.region,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolderName);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingDetailModel implements TrainingDetailModel {
  const _TrainingDetailModel({required this.id, this.imageUrl, required this.title, this.badge = 'Gratis', required this.description, required this.date, required this.time, required this.location, final  List<TrainingFacilityModel> facilities = const [], final  List<String> requirements = const [], required this.fee, required this.feeNotice, required this.companyName, required this.status, this.adCode, this.rejectionReason, this.totalApprovedEnrollees = 0, this.contactEmail, this.contactRole, this.region, this.bankName, this.bankAccountNumber, this.bankAccountHolderName}): _facilities = facilities,_requirements = requirements;


@override final  String id;
@override final  String? imageUrl;
@override final  String title;
@override@JsonKey() final  String badge;
@override final  String description;
@override final  String date;
@override final  String time;
@override final  String location;
 final  List<TrainingFacilityModel> _facilities;
@override@JsonKey() List<TrainingFacilityModel> get facilities {
  if (_facilities is EqualUnmodifiableListView) return _facilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facilities);
}

 final  List<String> _requirements;
@override@JsonKey() List<String> get requirements {
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirements);
}

@override final  String fee;
@override final  String feeNotice;
@override final  String companyName;
@override final  String status;
@override final  String? adCode;
@override final  String? rejectionReason;
@override@JsonKey() final  int totalApprovedEnrollees;
@override final  String? contactEmail;
@override final  String? contactRole;
@override final  String? region;
@override final  String? bankName;
@override final  String? bankAccountNumber;
@override final  String? bankAccountHolderName;

/// Create a copy of TrainingDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingDetailModelCopyWith<_TrainingDetailModel> get copyWith => __$TrainingDetailModelCopyWithImpl<_TrainingDetailModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._facilities, _facilities)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.feeNotice, feeNotice) || other.feeNotice == feeNotice)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.status, status) || other.status == status)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.totalApprovedEnrollees, totalApprovedEnrollees) || other.totalApprovedEnrollees == totalApprovedEnrollees)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactRole, contactRole) || other.contactRole == contactRole)&&(identical(other.region, region) || other.region == region)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountHolderName, bankAccountHolderName) || other.bankAccountHolderName == bankAccountHolderName));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,imageUrl,title,badge,description,date,time,location,const DeepCollectionEquality().hash(_facilities),const DeepCollectionEquality().hash(_requirements),fee,feeNotice,companyName,status,adCode,rejectionReason,totalApprovedEnrollees,contactEmail,contactRole,region,bankName,bankAccountNumber,bankAccountHolderName]);

@override
String toString() {
  return 'TrainingDetailModel(id: $id, imageUrl: $imageUrl, title: $title, badge: $badge, description: $description, date: $date, time: $time, location: $location, facilities: $facilities, requirements: $requirements, fee: $fee, feeNotice: $feeNotice, companyName: $companyName, status: $status, adCode: $adCode, rejectionReason: $rejectionReason, totalApprovedEnrollees: $totalApprovedEnrollees, contactEmail: $contactEmail, contactRole: $contactRole, region: $region, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolderName: $bankAccountHolderName)';
}


}

/// @nodoc
abstract mixin class _$TrainingDetailModelCopyWith<$Res> implements $TrainingDetailModelCopyWith<$Res> {
  factory _$TrainingDetailModelCopyWith(_TrainingDetailModel value, $Res Function(_TrainingDetailModel) _then) = __$TrainingDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? imageUrl, String title, String badge, String description, String date, String time, String location, List<TrainingFacilityModel> facilities, List<String> requirements, String fee, String feeNotice, String companyName, String status, String? adCode, String? rejectionReason, int totalApprovedEnrollees, String? contactEmail, String? contactRole, String? region, String? bankName, String? bankAccountNumber, String? bankAccountHolderName
});




}
/// @nodoc
class __$TrainingDetailModelCopyWithImpl<$Res>
    implements _$TrainingDetailModelCopyWith<$Res> {
  __$TrainingDetailModelCopyWithImpl(this._self, this._then);

  final _TrainingDetailModel _self;
  final $Res Function(_TrainingDetailModel) _then;

/// Create a copy of TrainingDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = freezed,Object? title = null,Object? badge = null,Object? description = null,Object? date = null,Object? time = null,Object? location = null,Object? facilities = null,Object? requirements = null,Object? fee = null,Object? feeNotice = null,Object? companyName = null,Object? status = null,Object? adCode = freezed,Object? rejectionReason = freezed,Object? totalApprovedEnrollees = null,Object? contactEmail = freezed,Object? contactRole = freezed,Object? region = freezed,Object? bankName = freezed,Object? bankAccountNumber = freezed,Object? bankAccountHolderName = freezed,}) {
  return _then(_TrainingDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,facilities: null == facilities ? _self._facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<TrainingFacilityModel>,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as String,feeNotice: null == feeNotice ? _self.feeNotice : feeNotice // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,adCode: freezed == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,totalApprovedEnrollees: null == totalApprovedEnrollees ? _self.totalApprovedEnrollees : totalApprovedEnrollees // ignore: cast_nullable_to_non_nullable
as int,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactRole: freezed == contactRole ? _self.contactRole : contactRole // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankAccountNumber: freezed == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,bankAccountHolderName: freezed == bankAccountHolderName ? _self.bankAccountHolderName : bankAccountHolderName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$TrainingFacilityModel {

 String get iconAsset; String get label;
/// Create a copy of TrainingFacilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingFacilityModelCopyWith<TrainingFacilityModel> get copyWith => _$TrainingFacilityModelCopyWithImpl<TrainingFacilityModel>(this as TrainingFacilityModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingFacilityModel&&(identical(other.iconAsset, iconAsset) || other.iconAsset == iconAsset)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,iconAsset,label);

@override
String toString() {
  return 'TrainingFacilityModel(iconAsset: $iconAsset, label: $label)';
}


}

/// @nodoc
abstract mixin class $TrainingFacilityModelCopyWith<$Res>  {
  factory $TrainingFacilityModelCopyWith(TrainingFacilityModel value, $Res Function(TrainingFacilityModel) _then) = _$TrainingFacilityModelCopyWithImpl;
@useResult
$Res call({
 String iconAsset, String label
});




}
/// @nodoc
class _$TrainingFacilityModelCopyWithImpl<$Res>
    implements $TrainingFacilityModelCopyWith<$Res> {
  _$TrainingFacilityModelCopyWithImpl(this._self, this._then);

  final TrainingFacilityModel _self;
  final $Res Function(TrainingFacilityModel) _then;

/// Create a copy of TrainingFacilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iconAsset = null,Object? label = null,}) {
  return _then(_self.copyWith(
iconAsset: null == iconAsset ? _self.iconAsset : iconAsset // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingFacilityModel].
extension TrainingFacilityModelPatterns on TrainingFacilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingFacilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingFacilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingFacilityModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingFacilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingFacilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingFacilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String iconAsset,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingFacilityModel() when $default != null:
return $default(_that.iconAsset,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String iconAsset,  String label)  $default,) {final _that = this;
switch (_that) {
case _TrainingFacilityModel():
return $default(_that.iconAsset,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String iconAsset,  String label)?  $default,) {final _that = this;
switch (_that) {
case _TrainingFacilityModel() when $default != null:
return $default(_that.iconAsset,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingFacilityModel implements TrainingFacilityModel {
  const _TrainingFacilityModel({required this.iconAsset, required this.label});
  

@override final  String iconAsset;
@override final  String label;

/// Create a copy of TrainingFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingFacilityModelCopyWith<_TrainingFacilityModel> get copyWith => __$TrainingFacilityModelCopyWithImpl<_TrainingFacilityModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingFacilityModel&&(identical(other.iconAsset, iconAsset) || other.iconAsset == iconAsset)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,iconAsset,label);

@override
String toString() {
  return 'TrainingFacilityModel(iconAsset: $iconAsset, label: $label)';
}


}

/// @nodoc
abstract mixin class _$TrainingFacilityModelCopyWith<$Res> implements $TrainingFacilityModelCopyWith<$Res> {
  factory _$TrainingFacilityModelCopyWith(_TrainingFacilityModel value, $Res Function(_TrainingFacilityModel) _then) = __$TrainingFacilityModelCopyWithImpl;
@override @useResult
$Res call({
 String iconAsset, String label
});




}
/// @nodoc
class __$TrainingFacilityModelCopyWithImpl<$Res>
    implements _$TrainingFacilityModelCopyWith<$Res> {
  __$TrainingFacilityModelCopyWithImpl(this._self, this._then);

  final _TrainingFacilityModel _self;
  final $Res Function(_TrainingFacilityModel) _then;

/// Create a copy of TrainingFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iconAsset = null,Object? label = null,}) {
  return _then(_TrainingFacilityModel(
iconAsset: null == iconAsset ? _self.iconAsset : iconAsset // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
