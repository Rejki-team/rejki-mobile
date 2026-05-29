// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_bid_evidence_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobBidEvidenceModel {

 String get id;@JsonKey(name: 'bid_id') String get bidId;@JsonKey(name: 'uploaded_by') String get uploadedBy;@JsonKey(name: 'uri_path') String get uriPath;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of JobBidEvidenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobBidEvidenceModelCopyWith<JobBidEvidenceModel> get copyWith => _$JobBidEvidenceModelCopyWithImpl<JobBidEvidenceModel>(this as JobBidEvidenceModel, _$identity);

  /// Serializes this JobBidEvidenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobBidEvidenceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bidId, bidId) || other.bidId == bidId)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bidId,uploadedBy,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobBidEvidenceModel(id: $id, bidId: $bidId, uploadedBy: $uploadedBy, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobBidEvidenceModelCopyWith<$Res>  {
  factory $JobBidEvidenceModelCopyWith(JobBidEvidenceModel value, $Res Function(JobBidEvidenceModel) _then) = _$JobBidEvidenceModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'bid_id') String bidId,@JsonKey(name: 'uploaded_by') String uploadedBy,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$JobBidEvidenceModelCopyWithImpl<$Res>
    implements $JobBidEvidenceModelCopyWith<$Res> {
  _$JobBidEvidenceModelCopyWithImpl(this._self, this._then);

  final JobBidEvidenceModel _self;
  final $Res Function(JobBidEvidenceModel) _then;

/// Create a copy of JobBidEvidenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bidId = null,Object? uploadedBy = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bidId: null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobBidEvidenceModel].
extension JobBidEvidenceModelPatterns on JobBidEvidenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobBidEvidenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobBidEvidenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobBidEvidenceModel value)  $default,){
final _that = this;
switch (_that) {
case _JobBidEvidenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobBidEvidenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobBidEvidenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'bid_id')  String bidId, @JsonKey(name: 'uploaded_by')  String uploadedBy, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobBidEvidenceModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'bid_id')  String bidId, @JsonKey(name: 'uploaded_by')  String uploadedBy, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobBidEvidenceModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'bid_id')  String bidId, @JsonKey(name: 'uploaded_by')  String uploadedBy, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobBidEvidenceModel() when $default != null:
return $default(_that.id,_that.bidId,_that.uploadedBy,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobBidEvidenceModel extends JobBidEvidenceModel {
  const _JobBidEvidenceModel({required this.id, @JsonKey(name: 'bid_id') required this.bidId, @JsonKey(name: 'uploaded_by') required this.uploadedBy, @JsonKey(name: 'uri_path') required this.uriPath, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _JobBidEvidenceModel.fromJson(Map<String, dynamic> json) => _$JobBidEvidenceModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'bid_id') final  String bidId;
@override@JsonKey(name: 'uploaded_by') final  String uploadedBy;
@override@JsonKey(name: 'uri_path') final  String uriPath;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of JobBidEvidenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobBidEvidenceModelCopyWith<_JobBidEvidenceModel> get copyWith => __$JobBidEvidenceModelCopyWithImpl<_JobBidEvidenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobBidEvidenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobBidEvidenceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bidId, bidId) || other.bidId == bidId)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bidId,uploadedBy,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobBidEvidenceModel(id: $id, bidId: $bidId, uploadedBy: $uploadedBy, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobBidEvidenceModelCopyWith<$Res> implements $JobBidEvidenceModelCopyWith<$Res> {
  factory _$JobBidEvidenceModelCopyWith(_JobBidEvidenceModel value, $Res Function(_JobBidEvidenceModel) _then) = __$JobBidEvidenceModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'bid_id') String bidId,@JsonKey(name: 'uploaded_by') String uploadedBy,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$JobBidEvidenceModelCopyWithImpl<$Res>
    implements _$JobBidEvidenceModelCopyWith<$Res> {
  __$JobBidEvidenceModelCopyWithImpl(this._self, this._then);

  final _JobBidEvidenceModel _self;
  final $Res Function(_JobBidEvidenceModel) _then;

/// Create a copy of JobBidEvidenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bidId = null,Object? uploadedBy = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobBidEvidenceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bidId: null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,uploadedBy: null == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
