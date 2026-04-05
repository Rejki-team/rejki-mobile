// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecondhandImageEntity {

/// Image unique identifier
 String get id;/// Secondhand ad ID this image belongs to
 String get secondhandId;/// URI path of the image (relative, use ApiConfig.buildImageUrl)
 String get uriPath;/// Created at timestamp
 DateTime? get createdAt;/// Updated at timestamp
 DateTime? get updatedAt;
/// Create a copy of SecondhandImageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandImageEntityCopyWith<SecondhandImageEntity> get copyWith => _$SecondhandImageEntityCopyWithImpl<SecondhandImageEntity>(this as SecondhandImageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.secondhandId, secondhandId) || other.secondhandId == secondhandId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,secondhandId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'SecondhandImageEntity(id: $id, secondhandId: $secondhandId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SecondhandImageEntityCopyWith<$Res>  {
  factory $SecondhandImageEntityCopyWith(SecondhandImageEntity value, $Res Function(SecondhandImageEntity) _then) = _$SecondhandImageEntityCopyWithImpl;
@useResult
$Res call({
 String id, String secondhandId, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SecondhandImageEntityCopyWithImpl<$Res>
    implements $SecondhandImageEntityCopyWith<$Res> {
  _$SecondhandImageEntityCopyWithImpl(this._self, this._then);

  final SecondhandImageEntity _self;
  final $Res Function(SecondhandImageEntity) _then;

/// Create a copy of SecondhandImageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? secondhandId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,secondhandId: null == secondhandId ? _self.secondhandId : secondhandId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandImageEntity].
extension SecondhandImageEntityPatterns on SecondhandImageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandImageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandImageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandImageEntity value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandImageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandImageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String secondhandId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandImageEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String secondhandId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SecondhandImageEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String secondhandId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandImageEntity() when $default != null:
return $default(_that.id,_that.secondhandId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SecondhandImageEntity implements SecondhandImageEntity {
  const _SecondhandImageEntity({required this.id, required this.secondhandId, required this.uriPath, this.createdAt, this.updatedAt});
  

/// Image unique identifier
@override final  String id;
/// Secondhand ad ID this image belongs to
@override final  String secondhandId;
/// URI path of the image (relative, use ApiConfig.buildImageUrl)
@override final  String uriPath;
/// Created at timestamp
@override final  DateTime? createdAt;
/// Updated at timestamp
@override final  DateTime? updatedAt;

/// Create a copy of SecondhandImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandImageEntityCopyWith<_SecondhandImageEntity> get copyWith => __$SecondhandImageEntityCopyWithImpl<_SecondhandImageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.secondhandId, secondhandId) || other.secondhandId == secondhandId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,secondhandId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'SecondhandImageEntity(id: $id, secondhandId: $secondhandId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SecondhandImageEntityCopyWith<$Res> implements $SecondhandImageEntityCopyWith<$Res> {
  factory _$SecondhandImageEntityCopyWith(_SecondhandImageEntity value, $Res Function(_SecondhandImageEntity) _then) = __$SecondhandImageEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String secondhandId, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SecondhandImageEntityCopyWithImpl<$Res>
    implements _$SecondhandImageEntityCopyWith<$Res> {
  __$SecondhandImageEntityCopyWithImpl(this._self, this._then);

  final _SecondhandImageEntity _self;
  final $Res Function(_SecondhandImageEntity) _then;

/// Create a copy of SecondhandImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? secondhandId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SecondhandImageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,secondhandId: null == secondhandId ? _self.secondhandId : secondhandId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
