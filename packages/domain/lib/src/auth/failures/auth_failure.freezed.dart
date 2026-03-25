// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {

 String get message;
/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this as AuthFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>  {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InvalidCredentials value)?  invalidCredentials,TResult Function( ServerError value)?  serverError,TResult Function( NetworkError value)?  networkError,TResult Function( SessionExpired value)?  sessionExpired,TResult Function( UnexpectedError value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case ServerError() when serverError != null:
return serverError(_that);case NetworkError() when networkError != null:
return networkError(_that);case SessionExpired() when sessionExpired != null:
return sessionExpired(_that);case UnexpectedError() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InvalidCredentials value)  invalidCredentials,required TResult Function( ServerError value)  serverError,required TResult Function( NetworkError value)  networkError,required TResult Function( SessionExpired value)  sessionExpired,required TResult Function( UnexpectedError value)  unexpected,}){
final _that = this;
switch (_that) {
case InvalidCredentials():
return invalidCredentials(_that);case ServerError():
return serverError(_that);case NetworkError():
return networkError(_that);case SessionExpired():
return sessionExpired(_that);case UnexpectedError():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InvalidCredentials value)?  invalidCredentials,TResult? Function( ServerError value)?  serverError,TResult? Function( NetworkError value)?  networkError,TResult? Function( SessionExpired value)?  sessionExpired,TResult? Function( UnexpectedError value)?  unexpected,}){
final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that);case ServerError() when serverError != null:
return serverError(_that);case NetworkError() when networkError != null:
return networkError(_that);case SessionExpired() when sessionExpired != null:
return sessionExpired(_that);case UnexpectedError() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  invalidCredentials,TResult Function( String message)?  serverError,TResult Function( String message)?  networkError,TResult Function( String message)?  sessionExpired,TResult Function( String message)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that.message);case ServerError() when serverError != null:
return serverError(_that.message);case NetworkError() when networkError != null:
return networkError(_that.message);case SessionExpired() when sessionExpired != null:
return sessionExpired(_that.message);case UnexpectedError() when unexpected != null:
return unexpected(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  invalidCredentials,required TResult Function( String message)  serverError,required TResult Function( String message)  networkError,required TResult Function( String message)  sessionExpired,required TResult Function( String message)  unexpected,}) {final _that = this;
switch (_that) {
case InvalidCredentials():
return invalidCredentials(_that.message);case ServerError():
return serverError(_that.message);case NetworkError():
return networkError(_that.message);case SessionExpired():
return sessionExpired(_that.message);case UnexpectedError():
return unexpected(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  invalidCredentials,TResult? Function( String message)?  serverError,TResult? Function( String message)?  networkError,TResult? Function( String message)?  sessionExpired,TResult? Function( String message)?  unexpected,}) {final _that = this;
switch (_that) {
case InvalidCredentials() when invalidCredentials != null:
return invalidCredentials(_that.message);case ServerError() when serverError != null:
return serverError(_that.message);case NetworkError() when networkError != null:
return networkError(_that.message);case SessionExpired() when sessionExpired != null:
return sessionExpired(_that.message);case UnexpectedError() when unexpected != null:
return unexpected(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InvalidCredentials implements AuthFailure {
  const InvalidCredentials({this.message = 'Email atau password salah'});
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidCredentialsCopyWith<InvalidCredentials> get copyWith => _$InvalidCredentialsCopyWithImpl<InvalidCredentials>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidCredentials&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.invalidCredentials(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidCredentialsCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $InvalidCredentialsCopyWith(InvalidCredentials value, $Res Function(InvalidCredentials) _then) = _$InvalidCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidCredentialsCopyWithImpl<$Res>
    implements $InvalidCredentialsCopyWith<$Res> {
  _$InvalidCredentialsCopyWithImpl(this._self, this._then);

  final InvalidCredentials _self;
  final $Res Function(InvalidCredentials) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidCredentials(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerError implements AuthFailure {
  const ServerError({this.message = 'Terjadi kesalahan pada server'});
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkError implements AuthFailure {
  const NetworkError({this.message = 'Tidak dapat terhubung ke server'});
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkErrorCopyWith<NetworkError> get copyWith => _$NetworkErrorCopyWithImpl<NetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.networkError(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkErrorCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $NetworkErrorCopyWith(NetworkError value, $Res Function(NetworkError) _then) = _$NetworkErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._self, this._then);

  final NetworkError _self;
  final $Res Function(NetworkError) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SessionExpired implements AuthFailure {
  const SessionExpired({this.message = 'Sesi telah berakhir, silakan login kembali'});
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionExpiredCopyWith<SessionExpired> get copyWith => _$SessionExpiredCopyWithImpl<SessionExpired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionExpired&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.sessionExpired(message: $message)';
}


}

/// @nodoc
abstract mixin class $SessionExpiredCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $SessionExpiredCopyWith(SessionExpired value, $Res Function(SessionExpired) _then) = _$SessionExpiredCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SessionExpiredCopyWithImpl<$Res>
    implements $SessionExpiredCopyWith<$Res> {
  _$SessionExpiredCopyWithImpl(this._self, this._then);

  final SessionExpired _self;
  final $Res Function(SessionExpired) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SessionExpired(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnexpectedError implements AuthFailure {
  const UnexpectedError({this.message = 'Terjadi kesalahan tidak terduga'});
  

@override@JsonKey() final  String message;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedErrorCopyWith<UnexpectedError> get copyWith => _$UnexpectedErrorCopyWithImpl<UnexpectedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFailure.unexpected(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnexpectedErrorCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(UnexpectedError value, $Res Function(UnexpectedError) _then) = _$UnexpectedErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(this._self, this._then);

  final UnexpectedError _self;
  final $Res Function(UnexpectedError) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnexpectedError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
