// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_room_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationRoomState {

 ConversationRoomStatus get status; String? get conversationId; String? get currentUserId;/// Terbaru dulu (index 0 = pesan terbaru) — cocok untuk `ListView(reverse: true)`.
 List<MessageEntity> get messages; bool get isSending; bool get isConnected; DateTime? get endedAt; String? get errorMessage;
/// Create a copy of ConversationRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationRoomStateCopyWith<ConversationRoomState> get copyWith => _$ConversationRoomStateCopyWithImpl<ConversationRoomState>(this as ConversationRoomState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationRoomState&&(identical(other.status, status) || other.status == status)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,conversationId,currentUserId,const DeepCollectionEquality().hash(messages),isSending,isConnected,endedAt,errorMessage);

@override
String toString() {
  return 'ConversationRoomState(status: $status, conversationId: $conversationId, currentUserId: $currentUserId, messages: $messages, isSending: $isSending, isConnected: $isConnected, endedAt: $endedAt, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ConversationRoomStateCopyWith<$Res>  {
  factory $ConversationRoomStateCopyWith(ConversationRoomState value, $Res Function(ConversationRoomState) _then) = _$ConversationRoomStateCopyWithImpl;
@useResult
$Res call({
 ConversationRoomStatus status, String? conversationId, String? currentUserId, List<MessageEntity> messages, bool isSending, bool isConnected, DateTime? endedAt, String? errorMessage
});




}
/// @nodoc
class _$ConversationRoomStateCopyWithImpl<$Res>
    implements $ConversationRoomStateCopyWith<$Res> {
  _$ConversationRoomStateCopyWithImpl(this._self, this._then);

  final ConversationRoomState _self;
  final $Res Function(ConversationRoomState) _then;

/// Create a copy of ConversationRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? conversationId = freezed,Object? currentUserId = freezed,Object? messages = null,Object? isSending = null,Object? isConnected = null,Object? endedAt = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConversationRoomStatus,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String?,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationRoomState].
extension ConversationRoomStatePatterns on ConversationRoomState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationRoomState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationRoomState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationRoomState value)  $default,){
final _that = this;
switch (_that) {
case _ConversationRoomState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationRoomState value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationRoomState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConversationRoomStatus status,  String? conversationId,  String? currentUserId,  List<MessageEntity> messages,  bool isSending,  bool isConnected,  DateTime? endedAt,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationRoomState() when $default != null:
return $default(_that.status,_that.conversationId,_that.currentUserId,_that.messages,_that.isSending,_that.isConnected,_that.endedAt,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConversationRoomStatus status,  String? conversationId,  String? currentUserId,  List<MessageEntity> messages,  bool isSending,  bool isConnected,  DateTime? endedAt,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ConversationRoomState():
return $default(_that.status,_that.conversationId,_that.currentUserId,_that.messages,_that.isSending,_that.isConnected,_that.endedAt,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConversationRoomStatus status,  String? conversationId,  String? currentUserId,  List<MessageEntity> messages,  bool isSending,  bool isConnected,  DateTime? endedAt,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ConversationRoomState() when $default != null:
return $default(_that.status,_that.conversationId,_that.currentUserId,_that.messages,_that.isSending,_that.isConnected,_that.endedAt,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationRoomState extends ConversationRoomState {
  const _ConversationRoomState({this.status = ConversationRoomStatus.initial, this.conversationId, this.currentUserId, final  List<MessageEntity> messages = const [], this.isSending = false, this.isConnected = true, this.endedAt, this.errorMessage}): _messages = messages,super._();
  

@override@JsonKey() final  ConversationRoomStatus status;
@override final  String? conversationId;
@override final  String? currentUserId;
/// Terbaru dulu (index 0 = pesan terbaru) — cocok untuk `ListView(reverse: true)`.
 final  List<MessageEntity> _messages;
/// Terbaru dulu (index 0 = pesan terbaru) — cocok untuk `ListView(reverse: true)`.
@override@JsonKey() List<MessageEntity> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool isSending;
@override@JsonKey() final  bool isConnected;
@override final  DateTime? endedAt;
@override final  String? errorMessage;

/// Create a copy of ConversationRoomState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationRoomStateCopyWith<_ConversationRoomState> get copyWith => __$ConversationRoomStateCopyWithImpl<_ConversationRoomState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationRoomState&&(identical(other.status, status) || other.status == status)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,conversationId,currentUserId,const DeepCollectionEquality().hash(_messages),isSending,isConnected,endedAt,errorMessage);

@override
String toString() {
  return 'ConversationRoomState(status: $status, conversationId: $conversationId, currentUserId: $currentUserId, messages: $messages, isSending: $isSending, isConnected: $isConnected, endedAt: $endedAt, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ConversationRoomStateCopyWith<$Res> implements $ConversationRoomStateCopyWith<$Res> {
  factory _$ConversationRoomStateCopyWith(_ConversationRoomState value, $Res Function(_ConversationRoomState) _then) = __$ConversationRoomStateCopyWithImpl;
@override @useResult
$Res call({
 ConversationRoomStatus status, String? conversationId, String? currentUserId, List<MessageEntity> messages, bool isSending, bool isConnected, DateTime? endedAt, String? errorMessage
});




}
/// @nodoc
class __$ConversationRoomStateCopyWithImpl<$Res>
    implements _$ConversationRoomStateCopyWith<$Res> {
  __$ConversationRoomStateCopyWithImpl(this._self, this._then);

  final _ConversationRoomState _self;
  final $Res Function(_ConversationRoomState) _then;

/// Create a copy of ConversationRoomState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? conversationId = freezed,Object? currentUserId = freezed,Object? messages = null,Object? isSending = null,Object? isConnected = null,Object? endedAt = freezed,Object? errorMessage = freezed,}) {
  return _then(_ConversationRoomState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConversationRoomStatus,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String?,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
