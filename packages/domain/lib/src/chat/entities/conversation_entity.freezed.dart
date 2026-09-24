// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationEntity {

 String get id; String get userA; String get userB; DateTime? get endedAt; String? get relatedAdType; String? get relatedAdId;
/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationEntityCopyWith<ConversationEntity> get copyWith => _$ConversationEntityCopyWithImpl<ConversationEntity>(this as ConversationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userA, userA) || other.userA == userA)&&(identical(other.userB, userB) || other.userB == userB)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}


@override
int get hashCode => Object.hash(runtimeType,id,userA,userB,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationEntity(id: $id, userA: $userA, userB: $userB, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class $ConversationEntityCopyWith<$Res>  {
  factory $ConversationEntityCopyWith(ConversationEntity value, $Res Function(ConversationEntity) _then) = _$ConversationEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userA, String userB, DateTime? endedAt, String? relatedAdType, String? relatedAdId
});




}
/// @nodoc
class _$ConversationEntityCopyWithImpl<$Res>
    implements $ConversationEntityCopyWith<$Res> {
  _$ConversationEntityCopyWithImpl(this._self, this._then);

  final ConversationEntity _self;
  final $Res Function(ConversationEntity) _then;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userA = null,Object? userB = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userA: null == userA ? _self.userA : userA // ignore: cast_nullable_to_non_nullable
as String,userB: null == userB ? _self.userB : userB // ignore: cast_nullable_to_non_nullable
as String,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationEntity].
extension ConversationEntityPatterns on ConversationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConversationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userA,  String userB,  DateTime? endedAt,  String? relatedAdType,  String? relatedAdId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userA,  String userB,  DateTime? endedAt,  String? relatedAdType,  String? relatedAdId)  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userA,  String userB,  DateTime? endedAt,  String? relatedAdType,  String? relatedAdId)?  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.userA,_that.userB,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationEntity implements ConversationEntity {
  const _ConversationEntity({required this.id, required this.userA, required this.userB, this.endedAt, this.relatedAdType, this.relatedAdId});
  

@override final  String id;
@override final  String userA;
@override final  String userB;
@override final  DateTime? endedAt;
@override final  String? relatedAdType;
@override final  String? relatedAdId;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationEntityCopyWith<_ConversationEntity> get copyWith => __$ConversationEntityCopyWithImpl<_ConversationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userA, userA) || other.userA == userA)&&(identical(other.userB, userB) || other.userB == userB)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}


@override
int get hashCode => Object.hash(runtimeType,id,userA,userB,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationEntity(id: $id, userA: $userA, userB: $userB, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class _$ConversationEntityCopyWith<$Res> implements $ConversationEntityCopyWith<$Res> {
  factory _$ConversationEntityCopyWith(_ConversationEntity value, $Res Function(_ConversationEntity) _then) = __$ConversationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userA, String userB, DateTime? endedAt, String? relatedAdType, String? relatedAdId
});




}
/// @nodoc
class __$ConversationEntityCopyWithImpl<$Res>
    implements _$ConversationEntityCopyWith<$Res> {
  __$ConversationEntityCopyWithImpl(this._self, this._then);

  final _ConversationEntity _self;
  final $Res Function(_ConversationEntity) _then;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userA = null,Object? userB = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_ConversationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userA: null == userA ? _self.userA : userA // ignore: cast_nullable_to_non_nullable
as String,userB: null == userB ? _self.userB : userB // ignore: cast_nullable_to_non_nullable
as String,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ConversationSummaryEntity {

 String get id; OtherUserSummaryEntity? get otherUser; MessageEntity? get lastMessage; bool get hasUnread; DateTime? get endedAt; String? get relatedAdType; String? get relatedAdId;
/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationSummaryEntityCopyWith<ConversationSummaryEntity> get copyWith => _$ConversationSummaryEntityCopyWithImpl<ConversationSummaryEntity>(this as ConversationSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationSummaryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.otherUser, otherUser) || other.otherUser == otherUser)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.hasUnread, hasUnread) || other.hasUnread == hasUnread)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}


@override
int get hashCode => Object.hash(runtimeType,id,otherUser,lastMessage,hasUnread,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationSummaryEntity(id: $id, otherUser: $otherUser, lastMessage: $lastMessage, hasUnread: $hasUnread, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class $ConversationSummaryEntityCopyWith<$Res>  {
  factory $ConversationSummaryEntityCopyWith(ConversationSummaryEntity value, $Res Function(ConversationSummaryEntity) _then) = _$ConversationSummaryEntityCopyWithImpl;
@useResult
$Res call({
 String id, OtherUserSummaryEntity? otherUser, MessageEntity? lastMessage, bool hasUnread, DateTime? endedAt, String? relatedAdType, String? relatedAdId
});


$OtherUserSummaryEntityCopyWith<$Res>? get otherUser;$MessageEntityCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ConversationSummaryEntityCopyWithImpl<$Res>
    implements $ConversationSummaryEntityCopyWith<$Res> {
  _$ConversationSummaryEntityCopyWithImpl(this._self, this._then);

  final ConversationSummaryEntity _self;
  final $Res Function(ConversationSummaryEntity) _then;

/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? otherUser = freezed,Object? lastMessage = freezed,Object? hasUnread = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otherUser: freezed == otherUser ? _self.otherUser : otherUser // ignore: cast_nullable_to_non_nullable
as OtherUserSummaryEntity?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageEntity?,hasUnread: null == hasUnread ? _self.hasUnread : hasUnread // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherUserSummaryEntityCopyWith<$Res>? get otherUser {
    if (_self.otherUser == null) {
    return null;
  }

  return $OtherUserSummaryEntityCopyWith<$Res>(_self.otherUser!, (value) {
    return _then(_self.copyWith(otherUser: value));
  });
}/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageEntityCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConversationSummaryEntity].
extension ConversationSummaryEntityPatterns on ConversationSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConversationSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  OtherUserSummaryEntity? otherUser,  MessageEntity? lastMessage,  bool hasUnread,  DateTime? endedAt,  String? relatedAdType,  String? relatedAdId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationSummaryEntity() when $default != null:
return $default(_that.id,_that.otherUser,_that.lastMessage,_that.hasUnread,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  OtherUserSummaryEntity? otherUser,  MessageEntity? lastMessage,  bool hasUnread,  DateTime? endedAt,  String? relatedAdType,  String? relatedAdId)  $default,) {final _that = this;
switch (_that) {
case _ConversationSummaryEntity():
return $default(_that.id,_that.otherUser,_that.lastMessage,_that.hasUnread,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  OtherUserSummaryEntity? otherUser,  MessageEntity? lastMessage,  bool hasUnread,  DateTime? endedAt,  String? relatedAdType,  String? relatedAdId)?  $default,) {final _that = this;
switch (_that) {
case _ConversationSummaryEntity() when $default != null:
return $default(_that.id,_that.otherUser,_that.lastMessage,_that.hasUnread,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationSummaryEntity implements ConversationSummaryEntity {
  const _ConversationSummaryEntity({required this.id, this.otherUser, this.lastMessage, required this.hasUnread, this.endedAt, this.relatedAdType, this.relatedAdId});
  

@override final  String id;
@override final  OtherUserSummaryEntity? otherUser;
@override final  MessageEntity? lastMessage;
@override final  bool hasUnread;
@override final  DateTime? endedAt;
@override final  String? relatedAdType;
@override final  String? relatedAdId;

/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationSummaryEntityCopyWith<_ConversationSummaryEntity> get copyWith => __$ConversationSummaryEntityCopyWithImpl<_ConversationSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationSummaryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.otherUser, otherUser) || other.otherUser == otherUser)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.hasUnread, hasUnread) || other.hasUnread == hasUnread)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}


@override
int get hashCode => Object.hash(runtimeType,id,otherUser,lastMessage,hasUnread,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationSummaryEntity(id: $id, otherUser: $otherUser, lastMessage: $lastMessage, hasUnread: $hasUnread, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class _$ConversationSummaryEntityCopyWith<$Res> implements $ConversationSummaryEntityCopyWith<$Res> {
  factory _$ConversationSummaryEntityCopyWith(_ConversationSummaryEntity value, $Res Function(_ConversationSummaryEntity) _then) = __$ConversationSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, OtherUserSummaryEntity? otherUser, MessageEntity? lastMessage, bool hasUnread, DateTime? endedAt, String? relatedAdType, String? relatedAdId
});


@override $OtherUserSummaryEntityCopyWith<$Res>? get otherUser;@override $MessageEntityCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ConversationSummaryEntityCopyWithImpl<$Res>
    implements _$ConversationSummaryEntityCopyWith<$Res> {
  __$ConversationSummaryEntityCopyWithImpl(this._self, this._then);

  final _ConversationSummaryEntity _self;
  final $Res Function(_ConversationSummaryEntity) _then;

/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? otherUser = freezed,Object? lastMessage = freezed,Object? hasUnread = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_ConversationSummaryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otherUser: freezed == otherUser ? _self.otherUser : otherUser // ignore: cast_nullable_to_non_nullable
as OtherUserSummaryEntity?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageEntity?,hasUnread: null == hasUnread ? _self.hasUnread : hasUnread // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherUserSummaryEntityCopyWith<$Res>? get otherUser {
    if (_self.otherUser == null) {
    return null;
  }

  return $OtherUserSummaryEntityCopyWith<$Res>(_self.otherUser!, (value) {
    return _then(_self.copyWith(otherUser: value));
  });
}/// Create a copy of ConversationSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageEntityCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
