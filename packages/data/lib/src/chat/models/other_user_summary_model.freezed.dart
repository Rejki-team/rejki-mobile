// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_user_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtherUserSummaryModel {

 String get id; String get username; String? get avatar;
/// Create a copy of OtherUserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherUserSummaryModelCopyWith<OtherUserSummaryModel> get copyWith => _$OtherUserSummaryModelCopyWithImpl<OtherUserSummaryModel>(this as OtherUserSummaryModel, _$identity);

  /// Serializes this OtherUserSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherUserSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,avatar);

@override
String toString() {
  return 'OtherUserSummaryModel(id: $id, username: $username, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $OtherUserSummaryModelCopyWith<$Res>  {
  factory $OtherUserSummaryModelCopyWith(OtherUserSummaryModel value, $Res Function(OtherUserSummaryModel) _then) = _$OtherUserSummaryModelCopyWithImpl;
@useResult
$Res call({
 String id, String username, String? avatar
});




}
/// @nodoc
class _$OtherUserSummaryModelCopyWithImpl<$Res>
    implements $OtherUserSummaryModelCopyWith<$Res> {
  _$OtherUserSummaryModelCopyWithImpl(this._self, this._then);

  final OtherUserSummaryModel _self;
  final $Res Function(OtherUserSummaryModel) _then;

/// Create a copy of OtherUserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OtherUserSummaryModel].
extension OtherUserSummaryModelPatterns on OtherUserSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtherUserSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtherUserSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtherUserSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _OtherUserSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtherUserSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _OtherUserSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtherUserSummaryModel() when $default != null:
return $default(_that.id,_that.username,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String? avatar)  $default,) {final _that = this;
switch (_that) {
case _OtherUserSummaryModel():
return $default(_that.id,_that.username,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String? avatar)?  $default,) {final _that = this;
switch (_that) {
case _OtherUserSummaryModel() when $default != null:
return $default(_that.id,_that.username,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtherUserSummaryModel extends OtherUserSummaryModel {
  const _OtherUserSummaryModel({required this.id, required this.username, this.avatar}): super._();
  factory _OtherUserSummaryModel.fromJson(Map<String, dynamic> json) => _$OtherUserSummaryModelFromJson(json);

@override final  String id;
@override final  String username;
@override final  String? avatar;

/// Create a copy of OtherUserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherUserSummaryModelCopyWith<_OtherUserSummaryModel> get copyWith => __$OtherUserSummaryModelCopyWithImpl<_OtherUserSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherUserSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtherUserSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,avatar);

@override
String toString() {
  return 'OtherUserSummaryModel(id: $id, username: $username, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$OtherUserSummaryModelCopyWith<$Res> implements $OtherUserSummaryModelCopyWith<$Res> {
  factory _$OtherUserSummaryModelCopyWith(_OtherUserSummaryModel value, $Res Function(_OtherUserSummaryModel) _then) = __$OtherUserSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String? avatar
});




}
/// @nodoc
class __$OtherUserSummaryModelCopyWithImpl<$Res>
    implements _$OtherUserSummaryModelCopyWith<$Res> {
  __$OtherUserSummaryModelCopyWithImpl(this._self, this._then);

  final _OtherUserSummaryModel _self;
  final $Res Function(_OtherUserSummaryModel) _then;

/// Create a copy of OtherUserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? avatar = freezed,}) {
  return _then(_OtherUserSummaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
