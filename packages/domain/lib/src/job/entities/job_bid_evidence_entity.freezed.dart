// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_bid_evidence_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobBidEvidenceEntity {

 String get id; String get bidId; String get uploadedBy; String get uriPath; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of JobBidEvidenceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobBidEvidenceEntityCopyWith<JobBidEvidenceEntity> get copyWith => _$JobBidEvidenceEntityCopyWithImpl<JobBidEvidenceEntity>(this as JobBidEvidenceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobBidEvidenceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.bidId, bidId) || other.bidId == bidId)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,bidId,uploadedBy,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobBidEvidenceEntity(id: $id, bidId: $bidId, uploadedBy: $uploadedBy, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobBidEvidenceEntityCopyWith<$Res>  {
  factory $JobBidEvidenceEntityCopyWith(JobBidEvidenceEntity value, $Res Function(JobBidEvidenceEntity) _then) = _$JobBidEvidenceEntityCopyWithImpl;
@useResult
$Res call({
 String id, String bidId, String uploadedBy, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$JobBidEvidenceEntityCopyWithImpl<$Res>
    implements $JobBidEvidenceEntityCopyWith<$Res> {
  _$JobBidEvidenceEntityCopyWithImpl(this._self, this._then);

  final JobBidEvidenceEntity _self;
  final $Res Function(JobBidEvidenceEntity) _then;

/// Create a copy of JobBidEvidenceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bidId = null,Object? uploadedBy = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bidId: null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobBidEvidenceEntity].
extension JobBidEvidenceEntityPatterns on JobBidEvidenceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobBidEvidenceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobBidEvidenceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobBidEvidenceEntity value)  $default,){
final _that = this;
switch (_that) {
case _JobBidEvidenceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobBidEvidenceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _JobBidEvidenceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bidId,  String uploadedBy,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobBidEvidenceEntity() when $default != null:
return $default(_that.id,_that.bidId,_that.uploadedBy,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bidId,  String uploadedBy,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobBidEvidenceEntity():
return $default(_that.id,_that.bidId,_that.uploadedBy,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bidId,  String uploadedBy,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobBidEvidenceEntity() when $default != null:
return $default(_that.id,_that.bidId,_that.uploadedBy,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _JobBidEvidenceEntity implements JobBidEvidenceEntity {
  const _JobBidEvidenceEntity({required this.id, required this.bidId, required this.uploadedBy, required this.uriPath, this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String bidId;
@override final  String uploadedBy;
@override final  String uriPath;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of JobBidEvidenceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobBidEvidenceEntityCopyWith<_JobBidEvidenceEntity> get copyWith => __$JobBidEvidenceEntityCopyWithImpl<_JobBidEvidenceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobBidEvidenceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.bidId, bidId) || other.bidId == bidId)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,bidId,uploadedBy,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobBidEvidenceEntity(id: $id, bidId: $bidId, uploadedBy: $uploadedBy, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobBidEvidenceEntityCopyWith<$Res> implements $JobBidEvidenceEntityCopyWith<$Res> {
  factory _$JobBidEvidenceEntityCopyWith(_JobBidEvidenceEntity value, $Res Function(_JobBidEvidenceEntity) _then) = __$JobBidEvidenceEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String bidId, String uploadedBy, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$JobBidEvidenceEntityCopyWithImpl<$Res>
    implements _$JobBidEvidenceEntityCopyWith<$Res> {
  __$JobBidEvidenceEntityCopyWithImpl(this._self, this._then);

  final _JobBidEvidenceEntity _self;
  final $Res Function(_JobBidEvidenceEntity) _then;

/// Create a copy of JobBidEvidenceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bidId = null,Object? uploadedBy = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobBidEvidenceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bidId: null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
