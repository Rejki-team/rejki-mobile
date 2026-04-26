// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingEntity {

 String get id; String get title; String get description; String get companyName; String get locationAddress; String get dateOfTraining; int get feePerPerson; String get status; String get userId; String? get adCode; String? get email; String? get role; List<TrainingImageEntity> get images; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of TrainingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingEntityCopyWith<TrainingEntity> get copyWith => _$TrainingEntityCopyWithImpl<TrainingEntity>(this as TrainingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.dateOfTraining, dateOfTraining) || other.dateOfTraining == dateOfTraining)&&(identical(other.feePerPerson, feePerPerson) || other.feePerPerson == feePerPerson)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,companyName,locationAddress,dateOfTraining,feePerPerson,status,userId,adCode,email,role,const DeepCollectionEquality().hash(images),createdAt,updatedAt);

@override
String toString() {
  return 'TrainingEntity(id: $id, title: $title, description: $description, companyName: $companyName, locationAddress: $locationAddress, dateOfTraining: $dateOfTraining, feePerPerson: $feePerPerson, status: $status, userId: $userId, adCode: $adCode, email: $email, role: $role, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingEntityCopyWith<$Res>  {
  factory $TrainingEntityCopyWith(TrainingEntity value, $Res Function(TrainingEntity) _then) = _$TrainingEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String companyName, String locationAddress, String dateOfTraining, int feePerPerson, String status, String userId, String? adCode, String? email, String? role, List<TrainingImageEntity> images, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$TrainingEntityCopyWithImpl<$Res>
    implements $TrainingEntityCopyWith<$Res> {
  _$TrainingEntityCopyWithImpl(this._self, this._then);

  final TrainingEntity _self;
  final $Res Function(TrainingEntity) _then;

/// Create a copy of TrainingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? companyName = null,Object? locationAddress = null,Object? dateOfTraining = null,Object? feePerPerson = null,Object? status = null,Object? userId = null,Object? adCode = freezed,Object? email = freezed,Object? role = freezed,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
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
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<TrainingImageEntity>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingEntity].
extension TrainingEntityPatterns on TrainingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingEntity value)  $default,){
final _that = this;
switch (_that) {
case _TrainingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String companyName,  String locationAddress,  String dateOfTraining,  int feePerPerson,  String status,  String userId,  String? adCode,  String? email,  String? role,  List<TrainingImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.companyName,_that.locationAddress,_that.dateOfTraining,_that.feePerPerson,_that.status,_that.userId,_that.adCode,_that.email,_that.role,_that.images,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String companyName,  String locationAddress,  String dateOfTraining,  int feePerPerson,  String status,  String userId,  String? adCode,  String? email,  String? role,  List<TrainingImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingEntity():
return $default(_that.id,_that.title,_that.description,_that.companyName,_that.locationAddress,_that.dateOfTraining,_that.feePerPerson,_that.status,_that.userId,_that.adCode,_that.email,_that.role,_that.images,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String companyName,  String locationAddress,  String dateOfTraining,  int feePerPerson,  String status,  String userId,  String? adCode,  String? email,  String? role,  List<TrainingImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.companyName,_that.locationAddress,_that.dateOfTraining,_that.feePerPerson,_that.status,_that.userId,_that.adCode,_that.email,_that.role,_that.images,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingEntity extends TrainingEntity {
  const _TrainingEntity({required this.id, required this.title, required this.description, required this.companyName, required this.locationAddress, required this.dateOfTraining, required this.feePerPerson, required this.status, required this.userId, this.adCode, this.email, this.role, final  List<TrainingImageEntity> images = const [], this.createdAt, this.updatedAt}): _images = images,super._();
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String companyName;
@override final  String locationAddress;
@override final  String dateOfTraining;
@override final  int feePerPerson;
@override final  String status;
@override final  String userId;
@override final  String? adCode;
@override final  String? email;
@override final  String? role;
 final  List<TrainingImageEntity> _images;
@override@JsonKey() List<TrainingImageEntity> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of TrainingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingEntityCopyWith<_TrainingEntity> get copyWith => __$TrainingEntityCopyWithImpl<_TrainingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.dateOfTraining, dateOfTraining) || other.dateOfTraining == dateOfTraining)&&(identical(other.feePerPerson, feePerPerson) || other.feePerPerson == feePerPerson)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,companyName,locationAddress,dateOfTraining,feePerPerson,status,userId,adCode,email,role,const DeepCollectionEquality().hash(_images),createdAt,updatedAt);

@override
String toString() {
  return 'TrainingEntity(id: $id, title: $title, description: $description, companyName: $companyName, locationAddress: $locationAddress, dateOfTraining: $dateOfTraining, feePerPerson: $feePerPerson, status: $status, userId: $userId, adCode: $adCode, email: $email, role: $role, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingEntityCopyWith<$Res> implements $TrainingEntityCopyWith<$Res> {
  factory _$TrainingEntityCopyWith(_TrainingEntity value, $Res Function(_TrainingEntity) _then) = __$TrainingEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String companyName, String locationAddress, String dateOfTraining, int feePerPerson, String status, String userId, String? adCode, String? email, String? role, List<TrainingImageEntity> images, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$TrainingEntityCopyWithImpl<$Res>
    implements _$TrainingEntityCopyWith<$Res> {
  __$TrainingEntityCopyWithImpl(this._self, this._then);

  final _TrainingEntity _self;
  final $Res Function(_TrainingEntity) _then;

/// Create a copy of TrainingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? companyName = null,Object? locationAddress = null,Object? dateOfTraining = null,Object? feePerPerson = null,Object? status = null,Object? userId = null,Object? adCode = freezed,Object? email = freezed,Object? role = freezed,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TrainingEntity(
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
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<TrainingImageEntity>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
