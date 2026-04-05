// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecondhandFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SecondhandFailure()';
}


}

/// @nodoc
class $SecondhandFailureCopyWith<$Res>  {
$SecondhandFailureCopyWith(SecondhandFailure _, $Res Function(SecondhandFailure) __);
}


/// Adds pattern-matching-related methods to [SecondhandFailure].
extension SecondhandFailurePatterns on SecondhandFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerError value)?  serverError,TResult Function( _NetworkError value)?  networkError,TResult Function( _Unauthorized value)?  unauthorized,TResult Function( _NotFound value)?  notFound,TResult Function( _ValidationError value)?  validationError,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _ValidationError() when validationError != null:
return validationError(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerError value)  serverError,required TResult Function( _NetworkError value)  networkError,required TResult Function( _Unauthorized value)  unauthorized,required TResult Function( _NotFound value)  notFound,required TResult Function( _ValidationError value)  validationError,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that);case _NetworkError():
return networkError(_that);case _Unauthorized():
return unauthorized(_that);case _NotFound():
return notFound(_that);case _ValidationError():
return validationError(_that);case _Unknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerError value)?  serverError,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _Unauthorized value)?  unauthorized,TResult? Function( _NotFound value)?  notFound,TResult? Function( _ValidationError value)?  validationError,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _ValidationError() when validationError != null:
return validationError(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  serverError,TResult Function()?  networkError,TResult Function()?  unauthorized,TResult Function()?  notFound,TResult Function( String message)?  validationError,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkError() when networkError != null:
return networkError();case _Unauthorized() when unauthorized != null:
return unauthorized();case _NotFound() when notFound != null:
return notFound();case _ValidationError() when validationError != null:
return validationError(_that.message);case _Unknown() when unknown != null:
return unknown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  serverError,required TResult Function()  networkError,required TResult Function()  unauthorized,required TResult Function()  notFound,required TResult Function( String message)  validationError,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that.message);case _NetworkError():
return networkError();case _Unauthorized():
return unauthorized();case _NotFound():
return notFound();case _ValidationError():
return validationError(_that.message);case _Unknown():
return unknown();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  serverError,TResult? Function()?  networkError,TResult? Function()?  unauthorized,TResult? Function()?  notFound,TResult? Function( String message)?  validationError,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkError() when networkError != null:
return networkError();case _Unauthorized() when unauthorized != null:
return unauthorized();case _NotFound() when notFound != null:
return notFound();case _ValidationError() when validationError != null:
return validationError(_that.message);case _Unknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class _ServerError implements SecondhandFailure {
  const _ServerError([this.message]);
  

 final  String? message;

/// Create a copy of SecondhandFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SecondhandFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $SecondhandFailureCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of SecondhandFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ServerError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NetworkError implements SecondhandFailure {
  const _NetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SecondhandFailure.networkError()';
}


}




/// @nodoc


class _Unauthorized implements SecondhandFailure {
  const _Unauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SecondhandFailure.unauthorized()';
}


}




/// @nodoc


class _NotFound implements SecondhandFailure {
  const _NotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SecondhandFailure.notFound()';
}


}




/// @nodoc


class _ValidationError implements SecondhandFailure {
  const _ValidationError(this.message);
  

 final  String message;

/// Create a copy of SecondhandFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationErrorCopyWith<_ValidationError> get copyWith => __$ValidationErrorCopyWithImpl<_ValidationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SecondhandFailure.validationError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationErrorCopyWith<$Res> implements $SecondhandFailureCopyWith<$Res> {
  factory _$ValidationErrorCopyWith(_ValidationError value, $Res Function(_ValidationError) _then) = __$ValidationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ValidationErrorCopyWithImpl<$Res>
    implements _$ValidationErrorCopyWith<$Res> {
  __$ValidationErrorCopyWithImpl(this._self, this._then);

  final _ValidationError _self;
  final $Res Function(_ValidationError) _then;

/// Create a copy of SecondhandFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ValidationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements SecondhandFailure {
  const _Unknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SecondhandFailure.unknown()';
}


}




// dart format on
