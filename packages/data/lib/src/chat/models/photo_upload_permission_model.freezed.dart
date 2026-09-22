// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_upload_permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoUploadPermissionModel {

@JsonKey(name: 'presigned_url') String get presignedUrl;@JsonKey(name: 'object_key') String get objectKey;
/// Create a copy of PhotoUploadPermissionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoUploadPermissionModelCopyWith<PhotoUploadPermissionModel> get copyWith => _$PhotoUploadPermissionModelCopyWithImpl<PhotoUploadPermissionModel>(this as PhotoUploadPermissionModel, _$identity);

  /// Serializes this PhotoUploadPermissionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoUploadPermissionModel&&(identical(other.presignedUrl, presignedUrl) || other.presignedUrl == presignedUrl)&&(identical(other.objectKey, objectKey) || other.objectKey == objectKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,presignedUrl,objectKey);

@override
String toString() {
  return 'PhotoUploadPermissionModel(presignedUrl: $presignedUrl, objectKey: $objectKey)';
}


}

/// @nodoc
abstract mixin class $PhotoUploadPermissionModelCopyWith<$Res>  {
  factory $PhotoUploadPermissionModelCopyWith(PhotoUploadPermissionModel value, $Res Function(PhotoUploadPermissionModel) _then) = _$PhotoUploadPermissionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'presigned_url') String presignedUrl,@JsonKey(name: 'object_key') String objectKey
});




}
/// @nodoc
class _$PhotoUploadPermissionModelCopyWithImpl<$Res>
    implements $PhotoUploadPermissionModelCopyWith<$Res> {
  _$PhotoUploadPermissionModelCopyWithImpl(this._self, this._then);

  final PhotoUploadPermissionModel _self;
  final $Res Function(PhotoUploadPermissionModel) _then;

/// Create a copy of PhotoUploadPermissionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? presignedUrl = null,Object? objectKey = null,}) {
  return _then(_self.copyWith(
presignedUrl: null == presignedUrl ? _self.presignedUrl : presignedUrl // ignore: cast_nullable_to_non_nullable
as String,objectKey: null == objectKey ? _self.objectKey : objectKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoUploadPermissionModel].
extension PhotoUploadPermissionModelPatterns on PhotoUploadPermissionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoUploadPermissionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoUploadPermissionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoUploadPermissionModel value)  $default,){
final _that = this;
switch (_that) {
case _PhotoUploadPermissionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoUploadPermissionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoUploadPermissionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'presigned_url')  String presignedUrl, @JsonKey(name: 'object_key')  String objectKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoUploadPermissionModel() when $default != null:
return $default(_that.presignedUrl,_that.objectKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'presigned_url')  String presignedUrl, @JsonKey(name: 'object_key')  String objectKey)  $default,) {final _that = this;
switch (_that) {
case _PhotoUploadPermissionModel():
return $default(_that.presignedUrl,_that.objectKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'presigned_url')  String presignedUrl, @JsonKey(name: 'object_key')  String objectKey)?  $default,) {final _that = this;
switch (_that) {
case _PhotoUploadPermissionModel() when $default != null:
return $default(_that.presignedUrl,_that.objectKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoUploadPermissionModel implements PhotoUploadPermissionModel {
  const _PhotoUploadPermissionModel({@JsonKey(name: 'presigned_url') required this.presignedUrl, @JsonKey(name: 'object_key') required this.objectKey});
  factory _PhotoUploadPermissionModel.fromJson(Map<String, dynamic> json) => _$PhotoUploadPermissionModelFromJson(json);

@override@JsonKey(name: 'presigned_url') final  String presignedUrl;
@override@JsonKey(name: 'object_key') final  String objectKey;

/// Create a copy of PhotoUploadPermissionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoUploadPermissionModelCopyWith<_PhotoUploadPermissionModel> get copyWith => __$PhotoUploadPermissionModelCopyWithImpl<_PhotoUploadPermissionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoUploadPermissionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoUploadPermissionModel&&(identical(other.presignedUrl, presignedUrl) || other.presignedUrl == presignedUrl)&&(identical(other.objectKey, objectKey) || other.objectKey == objectKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,presignedUrl,objectKey);

@override
String toString() {
  return 'PhotoUploadPermissionModel(presignedUrl: $presignedUrl, objectKey: $objectKey)';
}


}

/// @nodoc
abstract mixin class _$PhotoUploadPermissionModelCopyWith<$Res> implements $PhotoUploadPermissionModelCopyWith<$Res> {
  factory _$PhotoUploadPermissionModelCopyWith(_PhotoUploadPermissionModel value, $Res Function(_PhotoUploadPermissionModel) _then) = __$PhotoUploadPermissionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'presigned_url') String presignedUrl,@JsonKey(name: 'object_key') String objectKey
});




}
/// @nodoc
class __$PhotoUploadPermissionModelCopyWithImpl<$Res>
    implements _$PhotoUploadPermissionModelCopyWith<$Res> {
  __$PhotoUploadPermissionModelCopyWithImpl(this._self, this._then);

  final _PhotoUploadPermissionModel _self;
  final $Res Function(_PhotoUploadPermissionModel) _then;

/// Create a copy of PhotoUploadPermissionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presignedUrl = null,Object? objectKey = null,}) {
  return _then(_PhotoUploadPermissionModel(
presignedUrl: null == presignedUrl ? _self.presignedUrl : presignedUrl // ignore: cast_nullable_to_non_nullable
as String,objectKey: null == objectKey ? _self.objectKey : objectKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
