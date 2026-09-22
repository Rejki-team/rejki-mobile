// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationSummaryModel {

 String get id;@JsonKey(name: 'other_user') OtherUserSummaryModel? get otherUser;@JsonKey(name: 'last_message') MessageModel? get lastMessage;@JsonKey(name: 'has_unread') bool get hasUnread;@JsonKey(name: 'ended_at') String? get endedAt;@JsonKey(name: 'related_ad_type') String? get relatedAdType;@JsonKey(name: 'related_ad_id') String? get relatedAdId;
/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationSummaryModelCopyWith<ConversationSummaryModel> get copyWith => _$ConversationSummaryModelCopyWithImpl<ConversationSummaryModel>(this as ConversationSummaryModel, _$identity);

  /// Serializes this ConversationSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.otherUser, otherUser) || other.otherUser == otherUser)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.hasUnread, hasUnread) || other.hasUnread == hasUnread)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,otherUser,lastMessage,hasUnread,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationSummaryModel(id: $id, otherUser: $otherUser, lastMessage: $lastMessage, hasUnread: $hasUnread, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class $ConversationSummaryModelCopyWith<$Res>  {
  factory $ConversationSummaryModelCopyWith(ConversationSummaryModel value, $Res Function(ConversationSummaryModel) _then) = _$ConversationSummaryModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'other_user') OtherUserSummaryModel? otherUser,@JsonKey(name: 'last_message') MessageModel? lastMessage,@JsonKey(name: 'has_unread') bool hasUnread,@JsonKey(name: 'ended_at') String? endedAt,@JsonKey(name: 'related_ad_type') String? relatedAdType,@JsonKey(name: 'related_ad_id') String? relatedAdId
});


$OtherUserSummaryModelCopyWith<$Res>? get otherUser;$MessageModelCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ConversationSummaryModelCopyWithImpl<$Res>
    implements $ConversationSummaryModelCopyWith<$Res> {
  _$ConversationSummaryModelCopyWithImpl(this._self, this._then);

  final ConversationSummaryModel _self;
  final $Res Function(ConversationSummaryModel) _then;

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? otherUser = freezed,Object? lastMessage = freezed,Object? hasUnread = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otherUser: freezed == otherUser ? _self.otherUser : otherUser // ignore: cast_nullable_to_non_nullable
as OtherUserSummaryModel?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageModel?,hasUnread: null == hasUnread ? _self.hasUnread : hasUnread // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as String?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherUserSummaryModelCopyWith<$Res>? get otherUser {
    if (_self.otherUser == null) {
    return null;
  }

  return $OtherUserSummaryModelCopyWith<$Res>(_self.otherUser!, (value) {
    return _then(_self.copyWith(otherUser: value));
  });
}/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageModelCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageModelCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConversationSummaryModel].
extension ConversationSummaryModelPatterns on ConversationSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ConversationSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'other_user')  OtherUserSummaryModel? otherUser, @JsonKey(name: 'last_message')  MessageModel? lastMessage, @JsonKey(name: 'has_unread')  bool hasUnread, @JsonKey(name: 'ended_at')  String? endedAt, @JsonKey(name: 'related_ad_type')  String? relatedAdType, @JsonKey(name: 'related_ad_id')  String? relatedAdId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'other_user')  OtherUserSummaryModel? otherUser, @JsonKey(name: 'last_message')  MessageModel? lastMessage, @JsonKey(name: 'has_unread')  bool hasUnread, @JsonKey(name: 'ended_at')  String? endedAt, @JsonKey(name: 'related_ad_type')  String? relatedAdType, @JsonKey(name: 'related_ad_id')  String? relatedAdId)  $default,) {final _that = this;
switch (_that) {
case _ConversationSummaryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'other_user')  OtherUserSummaryModel? otherUser, @JsonKey(name: 'last_message')  MessageModel? lastMessage, @JsonKey(name: 'has_unread')  bool hasUnread, @JsonKey(name: 'ended_at')  String? endedAt, @JsonKey(name: 'related_ad_type')  String? relatedAdType, @JsonKey(name: 'related_ad_id')  String? relatedAdId)?  $default,) {final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
return $default(_that.id,_that.otherUser,_that.lastMessage,_that.hasUnread,_that.endedAt,_that.relatedAdType,_that.relatedAdId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationSummaryModel extends ConversationSummaryModel {
  const _ConversationSummaryModel({required this.id, @JsonKey(name: 'other_user') this.otherUser, @JsonKey(name: 'last_message') this.lastMessage, @JsonKey(name: 'has_unread') required this.hasUnread, @JsonKey(name: 'ended_at') this.endedAt, @JsonKey(name: 'related_ad_type') this.relatedAdType, @JsonKey(name: 'related_ad_id') this.relatedAdId}): super._();
  factory _ConversationSummaryModel.fromJson(Map<String, dynamic> json) => _$ConversationSummaryModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'other_user') final  OtherUserSummaryModel? otherUser;
@override@JsonKey(name: 'last_message') final  MessageModel? lastMessage;
@override@JsonKey(name: 'has_unread') final  bool hasUnread;
@override@JsonKey(name: 'ended_at') final  String? endedAt;
@override@JsonKey(name: 'related_ad_type') final  String? relatedAdType;
@override@JsonKey(name: 'related_ad_id') final  String? relatedAdId;

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationSummaryModelCopyWith<_ConversationSummaryModel> get copyWith => __$ConversationSummaryModelCopyWithImpl<_ConversationSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.otherUser, otherUser) || other.otherUser == otherUser)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.hasUnread, hasUnread) || other.hasUnread == hasUnread)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.relatedAdType, relatedAdType) || other.relatedAdType == relatedAdType)&&(identical(other.relatedAdId, relatedAdId) || other.relatedAdId == relatedAdId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,otherUser,lastMessage,hasUnread,endedAt,relatedAdType,relatedAdId);

@override
String toString() {
  return 'ConversationSummaryModel(id: $id, otherUser: $otherUser, lastMessage: $lastMessage, hasUnread: $hasUnread, endedAt: $endedAt, relatedAdType: $relatedAdType, relatedAdId: $relatedAdId)';
}


}

/// @nodoc
abstract mixin class _$ConversationSummaryModelCopyWith<$Res> implements $ConversationSummaryModelCopyWith<$Res> {
  factory _$ConversationSummaryModelCopyWith(_ConversationSummaryModel value, $Res Function(_ConversationSummaryModel) _then) = __$ConversationSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'other_user') OtherUserSummaryModel? otherUser,@JsonKey(name: 'last_message') MessageModel? lastMessage,@JsonKey(name: 'has_unread') bool hasUnread,@JsonKey(name: 'ended_at') String? endedAt,@JsonKey(name: 'related_ad_type') String? relatedAdType,@JsonKey(name: 'related_ad_id') String? relatedAdId
});


@override $OtherUserSummaryModelCopyWith<$Res>? get otherUser;@override $MessageModelCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ConversationSummaryModelCopyWithImpl<$Res>
    implements _$ConversationSummaryModelCopyWith<$Res> {
  __$ConversationSummaryModelCopyWithImpl(this._self, this._then);

  final _ConversationSummaryModel _self;
  final $Res Function(_ConversationSummaryModel) _then;

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? otherUser = freezed,Object? lastMessage = freezed,Object? hasUnread = null,Object? endedAt = freezed,Object? relatedAdType = freezed,Object? relatedAdId = freezed,}) {
  return _then(_ConversationSummaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otherUser: freezed == otherUser ? _self.otherUser : otherUser // ignore: cast_nullable_to_non_nullable
as OtherUserSummaryModel?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageModel?,hasUnread: null == hasUnread ? _self.hasUnread : hasUnread // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as String?,relatedAdType: freezed == relatedAdType ? _self.relatedAdType : relatedAdType // ignore: cast_nullable_to_non_nullable
as String?,relatedAdId: freezed == relatedAdId ? _self.relatedAdId : relatedAdId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherUserSummaryModelCopyWith<$Res>? get otherUser {
    if (_self.otherUser == null) {
    return null;
  }

  return $OtherUserSummaryModelCopyWith<$Res>(_self.otherUser!, (value) {
    return _then(_self.copyWith(otherUser: value));
  });
}/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageModelCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageModelCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
