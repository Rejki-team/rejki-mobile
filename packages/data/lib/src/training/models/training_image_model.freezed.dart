// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingImageModel {

 int get id;@JsonKey(name: 'training_id') String get trainingId;@JsonKey(name: 'uri_path') String get uriPath;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of TrainingImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingImageModelCopyWith<TrainingImageModel> get copyWith => _$TrainingImageModelCopyWithImpl<TrainingImageModel>(this as TrainingImageModel, _$identity);

  /// Serializes this TrainingImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainingId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingImageModel(id: $id, trainingId: $trainingId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingImageModelCopyWith<$Res>  {
  factory $TrainingImageModelCopyWith(TrainingImageModel value, $Res Function(TrainingImageModel) _then) = _$TrainingImageModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'training_id') String trainingId,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TrainingImageModelCopyWithImpl<$Res>
    implements $TrainingImageModelCopyWith<$Res> {
  _$TrainingImageModelCopyWithImpl(this._self, this._then);

  final TrainingImageModel _self;
  final $Res Function(TrainingImageModel) _then;

/// Create a copy of TrainingImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trainingId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingImageModel].
extension TrainingImageModelPatterns on TrainingImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingImageModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'training_id')  String trainingId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingImageModel() when $default != null:
return $default(_that.id,_that.trainingId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'training_id')  String trainingId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingImageModel():
return $default(_that.id,_that.trainingId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'training_id')  String trainingId, @JsonKey(name: 'uri_path')  String uriPath, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingImageModel() when $default != null:
return $default(_that.id,_that.trainingId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingImageModel extends TrainingImageModel {
  const _TrainingImageModel({required this.id, @JsonKey(name: 'training_id') required this.trainingId, @JsonKey(name: 'uri_path') required this.uriPath, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _TrainingImageModel.fromJson(Map<String, dynamic> json) => _$TrainingImageModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'training_id') final  String trainingId;
@override@JsonKey(name: 'uri_path') final  String uriPath;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of TrainingImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingImageModelCopyWith<_TrainingImageModel> get copyWith => __$TrainingImageModelCopyWithImpl<_TrainingImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainingId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingImageModel(id: $id, trainingId: $trainingId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingImageModelCopyWith<$Res> implements $TrainingImageModelCopyWith<$Res> {
  factory _$TrainingImageModelCopyWith(_TrainingImageModel value, $Res Function(_TrainingImageModel) _then) = __$TrainingImageModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'training_id') String trainingId,@JsonKey(name: 'uri_path') String uriPath,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$TrainingImageModelCopyWithImpl<$Res>
    implements _$TrainingImageModelCopyWith<$Res> {
  __$TrainingImageModelCopyWithImpl(this._self, this._then);

  final _TrainingImageModel _self;
  final $Res Function(_TrainingImageModel) _then;

/// Create a copy of TrainingImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trainingId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TrainingImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
