// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_realtime_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatRealtimeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRealtimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRealtimeEvent()';
}


}

/// @nodoc
class $ChatRealtimeEventCopyWith<$Res>  {
$ChatRealtimeEventCopyWith(ChatRealtimeEvent _, $Res Function(ChatRealtimeEvent) __);
}


/// Adds pattern-matching-related methods to [ChatRealtimeEvent].
extension ChatRealtimeEventPatterns on ChatRealtimeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatRealtimeConnected value)?  connected,TResult Function( ChatRealtimeMessage value)?  message,TResult Function( ChatRealtimeMessageAck value)?  messageAck,TResult Function( ChatRealtimeError value)?  error,TResult Function( ChatRealtimeDisconnected value)?  disconnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatRealtimeConnected() when connected != null:
return connected(_that);case ChatRealtimeMessage() when message != null:
return message(_that);case ChatRealtimeMessageAck() when messageAck != null:
return messageAck(_that);case ChatRealtimeError() when error != null:
return error(_that);case ChatRealtimeDisconnected() when disconnected != null:
return disconnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatRealtimeConnected value)  connected,required TResult Function( ChatRealtimeMessage value)  message,required TResult Function( ChatRealtimeMessageAck value)  messageAck,required TResult Function( ChatRealtimeError value)  error,required TResult Function( ChatRealtimeDisconnected value)  disconnected,}){
final _that = this;
switch (_that) {
case ChatRealtimeConnected():
return connected(_that);case ChatRealtimeMessage():
return message(_that);case ChatRealtimeMessageAck():
return messageAck(_that);case ChatRealtimeError():
return error(_that);case ChatRealtimeDisconnected():
return disconnected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatRealtimeConnected value)?  connected,TResult? Function( ChatRealtimeMessage value)?  message,TResult? Function( ChatRealtimeMessageAck value)?  messageAck,TResult? Function( ChatRealtimeError value)?  error,TResult? Function( ChatRealtimeDisconnected value)?  disconnected,}){
final _that = this;
switch (_that) {
case ChatRealtimeConnected() when connected != null:
return connected(_that);case ChatRealtimeMessage() when message != null:
return message(_that);case ChatRealtimeMessageAck() when messageAck != null:
return messageAck(_that);case ChatRealtimeError() when error != null:
return error(_that);case ChatRealtimeDisconnected() when disconnected != null:
return disconnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connected,TResult Function( MessageEntity message)?  message,TResult Function( String messageId)?  messageAck,TResult Function( String code,  String message)?  error,TResult Function()?  disconnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatRealtimeConnected() when connected != null:
return connected();case ChatRealtimeMessage() when message != null:
return message(_that.message);case ChatRealtimeMessageAck() when messageAck != null:
return messageAck(_that.messageId);case ChatRealtimeError() when error != null:
return error(_that.code,_that.message);case ChatRealtimeDisconnected() when disconnected != null:
return disconnected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connected,required TResult Function( MessageEntity message)  message,required TResult Function( String messageId)  messageAck,required TResult Function( String code,  String message)  error,required TResult Function()  disconnected,}) {final _that = this;
switch (_that) {
case ChatRealtimeConnected():
return connected();case ChatRealtimeMessage():
return message(_that.message);case ChatRealtimeMessageAck():
return messageAck(_that.messageId);case ChatRealtimeError():
return error(_that.code,_that.message);case ChatRealtimeDisconnected():
return disconnected();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connected,TResult? Function( MessageEntity message)?  message,TResult? Function( String messageId)?  messageAck,TResult? Function( String code,  String message)?  error,TResult? Function()?  disconnected,}) {final _that = this;
switch (_that) {
case ChatRealtimeConnected() when connected != null:
return connected();case ChatRealtimeMessage() when message != null:
return message(_that.message);case ChatRealtimeMessageAck() when messageAck != null:
return messageAck(_that.messageId);case ChatRealtimeError() when error != null:
return error(_that.code,_that.message);case ChatRealtimeDisconnected() when disconnected != null:
return disconnected();case _:
  return null;

}
}

}

/// @nodoc


class ChatRealtimeConnected implements ChatRealtimeEvent {
  const ChatRealtimeConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRealtimeConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRealtimeEvent.connected()';
}


}




/// @nodoc


class ChatRealtimeMessage implements ChatRealtimeEvent {
  const ChatRealtimeMessage(this.message);
  

 final  MessageEntity message;

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRealtimeMessageCopyWith<ChatRealtimeMessage> get copyWith => _$ChatRealtimeMessageCopyWithImpl<ChatRealtimeMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRealtimeMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatRealtimeEvent.message(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatRealtimeMessageCopyWith<$Res> implements $ChatRealtimeEventCopyWith<$Res> {
  factory $ChatRealtimeMessageCopyWith(ChatRealtimeMessage value, $Res Function(ChatRealtimeMessage) _then) = _$ChatRealtimeMessageCopyWithImpl;
@useResult
$Res call({
 MessageEntity message
});


$MessageEntityCopyWith<$Res> get message;

}
/// @nodoc
class _$ChatRealtimeMessageCopyWithImpl<$Res>
    implements $ChatRealtimeMessageCopyWith<$Res> {
  _$ChatRealtimeMessageCopyWithImpl(this._self, this._then);

  final ChatRealtimeMessage _self;
  final $Res Function(ChatRealtimeMessage) _then;

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatRealtimeMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageEntity,
  ));
}

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<$Res> get message {
  
  return $MessageEntityCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class ChatRealtimeMessageAck implements ChatRealtimeEvent {
  const ChatRealtimeMessageAck(this.messageId);
  

 final  String messageId;

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRealtimeMessageAckCopyWith<ChatRealtimeMessageAck> get copyWith => _$ChatRealtimeMessageAckCopyWithImpl<ChatRealtimeMessageAck>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRealtimeMessageAck&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'ChatRealtimeEvent.messageAck(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $ChatRealtimeMessageAckCopyWith<$Res> implements $ChatRealtimeEventCopyWith<$Res> {
  factory $ChatRealtimeMessageAckCopyWith(ChatRealtimeMessageAck value, $Res Function(ChatRealtimeMessageAck) _then) = _$ChatRealtimeMessageAckCopyWithImpl;
@useResult
$Res call({
 String messageId
});




}
/// @nodoc
class _$ChatRealtimeMessageAckCopyWithImpl<$Res>
    implements $ChatRealtimeMessageAckCopyWith<$Res> {
  _$ChatRealtimeMessageAckCopyWithImpl(this._self, this._then);

  final ChatRealtimeMessageAck _self;
  final $Res Function(ChatRealtimeMessageAck) _then;

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(ChatRealtimeMessageAck(
null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatRealtimeError implements ChatRealtimeEvent {
  const ChatRealtimeError(this.code, this.message);
  

 final  String code;
 final  String message;

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRealtimeErrorCopyWith<ChatRealtimeError> get copyWith => _$ChatRealtimeErrorCopyWithImpl<ChatRealtimeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRealtimeError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ChatRealtimeEvent.error(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatRealtimeErrorCopyWith<$Res> implements $ChatRealtimeEventCopyWith<$Res> {
  factory $ChatRealtimeErrorCopyWith(ChatRealtimeError value, $Res Function(ChatRealtimeError) _then) = _$ChatRealtimeErrorCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$ChatRealtimeErrorCopyWithImpl<$Res>
    implements $ChatRealtimeErrorCopyWith<$Res> {
  _$ChatRealtimeErrorCopyWithImpl(this._self, this._then);

  final ChatRealtimeError _self;
  final $Res Function(ChatRealtimeError) _then;

/// Create a copy of ChatRealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(ChatRealtimeError(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatRealtimeDisconnected implements ChatRealtimeEvent {
  const ChatRealtimeDisconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRealtimeDisconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRealtimeEvent.disconnected()';
}


}




// dart format on
