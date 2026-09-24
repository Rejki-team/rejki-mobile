// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationModel {

 String get id;@JsonKey(name: 'user_a') String get userA;@JsonKey(name: 'user_b') String get userB;@JsonKey(name: 'ended_at') String? get endedAt;@JsonKey(name: 'related_ad_type') String? get relatedAdType;@JsonKey(name: 'related_ad_id') String? get relatedAdId;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationModelCopyWith<ConversationModel> get copyWith => _$ConversationModelCopyWithImpl<ConversationModel>(this as ConversationModel, _$identity);

  /// Serializes this ConversationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userA, userA) || other.userA == userA)&&(identical(other.userB, userB) || other.userB == userB)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userA,userB,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationModel(id: $id, userA: $userA, userB: $userB, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class $ConversationModelCopyWith<$Res>  {
  factory $ConversationModelCopyWith(ConversationModel value, $Res Function(ConversationModel) _then) = _$ConversationModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_a') String userA,@JsonKey(name: 'user_b') String userB,@JsonKey(name: 'ended_at') String? endedAt,@JsonKey(name: 'related_ad_type') String? relatedAdType,@JsonKey(name: 'related_ad_id') String? relatedAdId
});




}
/// @nodoc
class _$ConversationModelCopyWithImpl<$Res>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._self, this._then);

  final ConversationModel _self;
  final $Res Function(ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userA = null,Object? userB = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userA: null == userA ? _self.userA : userA // ignore: cast_nullable_to_non_nullable
as String,userB: null == userB ? _self.userB : userB // ignore: cast_nullable_to_non_nullable
as String,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as String?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationModel].
extension ConversationModelPatterns on ConversationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationModel value)  $default,){
final _that = this;
switch (_that) {
case _ConversationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_a')  String userA, @JsonKey(name: 'user_b')  String userB, @JsonKey(name: 'ended_at')  String? endedAt, @JsonKey(name: 'related_ad_type')  String? relatedAdType, @JsonKey(name: 'related_ad_id')  String? relatedAdId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.userA,_that.userB,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_a')  String userA, @JsonKey(name: 'user_b')  String userB, @JsonKey(name: 'ended_at')  String? endedAt, @JsonKey(name: 'related_ad_type')  String? relatedAdType, @JsonKey(name: 'related_ad_id')  String? relatedAdId)  $default,) {final _that = this;
switch (_that) {
case _ConversationModel():
return $default(_that.id,_that.userA,_that.userB,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_a')  String userA, @JsonKey(name: 'user_b')  String userB, @JsonKey(name: 'ended_at')  String? endedAt, @JsonKey(name: 'related_ad_type')  String? relatedAdType, @JsonKey(name: 'related_ad_id')  String? relatedAdId)?  $default,) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.userA,_that.userB,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationModel extends ConversationModel {
  const _ConversationModel({required this.id, @JsonKey(name: 'user_a') required this.userA, @JsonKey(name: 'user_b') required this.userB, @JsonKey(name: 'ended_at') this.endedAt, @JsonKey(name: 'related_ad_type') this.relatedAdType, @JsonKey(name: 'related_ad_id') this.relatedAdId}): super._();
  factory _ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_a') final  String userA;
@override@JsonKey(name: 'user_b') final  String userB;
@override@JsonKey(name: 'ended_at') final  String? endedAt;
@override@JsonKey(name: 'related_ad_type') final  String? relatedAdType;
@override@JsonKey(name: 'related_ad_id') final  String? relatedAdId;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationModelCopyWith<_ConversationModel> get copyWith => __$ConversationModelCopyWithImpl<_ConversationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userA, userA) || other.userA == userA)&&(identical(other.userB, userB) || other.userB == userB)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userA,userB,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationModel(id: $id, userA: $userA, userB: $userB, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class _$ConversationModelCopyWith<$Res> implements $ConversationModelCopyWith<$Res> {
  factory _$ConversationModelCopyWith(_ConversationModel value, $Res Function(_ConversationModel) _then) = __$ConversationModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_a') String userA,@JsonKey(name: 'user_b') String userB,@JsonKey(name: 'ended_at') String? endedAt,@JsonKey(name: 'related_ad_type') String? relatedAdType,@JsonKey(name: 'related_ad_id') String? relatedAdId
});




}
/// @nodoc
class __$ConversationModelCopyWithImpl<$Res>
    implements _$ConversationModelCopyWith<$Res> {
  __$ConversationModelCopyWithImpl(this._self, this._then);

  final _ConversationModel _self;
  final $Res Function(_ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userA = null,Object? userB = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_ConversationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userA: null == userA ? _self.userA : userA // ignore: cast_nullable_to_non_nullable
as String,userB: null == userB ? _self.userB : userB // ignore: cast_nullable_to_non_nullable
as String,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as String?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
