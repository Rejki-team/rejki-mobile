// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondhandImageModel {

 String get id;@JsonKey(name: 'secondhand_id') String get secondhandId;@JsonKey(name: 'uri_path') String get uriPath;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of SecondhandImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandImageModelCopyWith<SecondhandImageModel> get copyWith => _$SecondhandImageModelCopyWithImpl<SecondhandImageModel>(this as SecondhandImageModel, _$identity);

  /// Serializes this SecondhandImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.secondhandId, secondhandId) || other.secondhandId == secondhandId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,secondhandId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'SecondhandImageModel(id: $id, secondhandId: $secondhandId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SecondhandImageModelCopyWith<$Res>  {
  factory $SecondhandImageModelCopyWith(SecondhandImageModel value, $Res Function(SecondhandImageModel) _then) = _$SecondhandImageModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'secondhand_id') String secondhandId,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$SecondhandImageModelCopyWithImpl<$Res>
    implements $SecondhandImageModelCopyWith<$Res> {
  _$SecondhandImageModelCopyWithImpl(this._self, this._then);

  final SecondhandImageModel _self;
  final $Res Function(SecondhandImageModel) _then;

/// Create a copy of SecondhandImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? secondhandId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,secondhandId: null == secondhandId ? _self.secondhandId : secondhandId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandImageModel].
extension SecondhandImageModelPatterns on SecondhandImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandImageModel value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'secondhand_id')  String secondhandId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandImageModel() when $default != null:
return $default(_that.id,_that.secondhandId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'secondhand_id')  String secondhandId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SecondhandImageModel():
return $default(_that.id,_that.secondhandId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'secondhand_id')  String secondhandId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandImageModel() when $default != null:
return $default(_that.id,_that.secondhandId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondhandImageModel extends SecondhandImageModel {
  const _SecondhandImageModel({required this.id, @JsonKey(name: 'secondhand_id') required this.secondhandId, @JsonKey(name: 'uri_path') required this.uriPath, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _SecondhandImageModel.fromJson(Map<String, dynamic> json) => _$SecondhandImageModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'secondhand_id') final  String secondhandId;
@override@JsonKey(name: 'uri_path') final  String uriPath;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of SecondhandImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandImageModelCopyWith<_SecondhandImageModel> get copyWith => __$SecondhandImageModelCopyWithImpl<_SecondhandImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondhandImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.secondhandId, secondhandId) || other.secondhandId == secondhandId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,secondhandId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'SecondhandImageModel(id: $id, secondhandId: $secondhandId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SecondhandImageModelCopyWith<$Res> implements $SecondhandImageModelCopyWith<$Res> {
  factory _$SecondhandImageModelCopyWith(_SecondhandImageModel value, $Res Function(_SecondhandImageModel) _then) = __$SecondhandImageModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'secondhand_id') String secondhandId,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$SecondhandImageModelCopyWithImpl<$Res>
    implements _$SecondhandImageModelCopyWith<$Res> {
  __$SecondhandImageModelCopyWithImpl(this._self, this._then);

  final _SecondhandImageModel _self;
  final $Res Function(_SecondhandImageModel) _then;

/// Create a copy of SecondhandImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? secondhandId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SecondhandImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,secondhandId: null == secondhandId ? _self.secondhandId : secondhandId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
