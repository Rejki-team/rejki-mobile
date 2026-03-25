// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobImageModel {

/// Image unique identifier
 String get id;/// Job ID this image belongs to
@JsonKey(name: 'job_id') String get jobId;/// URI path of the image
@JsonKey(name: 'uri_path') String get uriPath;/// Image created at
@JsonKey(name: 'created_at') String? get createdAt;/// Image updated at
@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobImageModelCopyWith<JobImageModel> get copyWith => _$JobImageModelCopyWithImpl<JobImageModel>(this as JobImageModel, _$identity);

  /// Serializes this JobImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobImageModel(id: $id, jobId: $jobId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobImageModelCopyWith<$Res>  {
  factory $JobImageModelCopyWith(JobImageModel value, $Res Function(JobImageModel) _then) = _$JobImageModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'job_id') String jobId,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$JobImageModelCopyWithImpl<$Res>
    implements $JobImageModelCopyWith<$Res> {
  _$JobImageModelCopyWithImpl(this._self, this._then);

  final JobImageModel _self;
  final $Res Function(JobImageModel) _then;

/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobImageModel].
extension JobImageModelPatterns on JobImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobImageModel value)  $default,){
final _that = this;
switch (_that) {
case _JobImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
return $default(_that.id,_that.jobId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobImageModel():
return $default(_that.id,_that.jobId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
return $default(_that.id,_that.jobId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobImageModel extends JobImageModel {
  const _JobImageModel({required this.id, @JsonKey(name: 'job_id') required this.jobId, @JsonKey(name: 'uri_path') required this.uriPath, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _JobImageModel.fromJson(Map<String, dynamic> json) => _$JobImageModelFromJson(json);

/// Image unique identifier
@override final  String id;
/// Job ID this image belongs to
@override@JsonKey(name: 'job_id') final  String jobId;
/// URI path of the image
@override@JsonKey(name: 'uri_path') final  String uriPath;
/// Image created at
@override@JsonKey(name: 'created_at') final  String? createdAt;
/// Image updated at
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobImageModelCopyWith<_JobImageModel> get copyWith => __$JobImageModelCopyWithImpl<_JobImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobImageModel(id: $id, jobId: $jobId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobImageModelCopyWith<$Res> implements $JobImageModelCopyWith<$Res> {
  factory _$JobImageModelCopyWith(_JobImageModel value, $Res Function(_JobImageModel) _then) = __$JobImageModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'job_id') String jobId,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$JobImageModelCopyWithImpl<$Res>
    implements _$JobImageModelCopyWith<$Res> {
  __$JobImageModelCopyWithImpl(this._self, this._then);

  final _JobImageModel _self;
  final $Res Function(_JobImageModel) _then;

/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
