// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobFailure()';
}


}

/// @nodoc
class $JobFailureCopyWith<$Res>  {
$JobFailureCopyWith(JobFailure _, $Res Function(JobFailure) __);
}


/// Adds pattern-matching-related methods to [JobFailure].
extension JobFailurePatterns on JobFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerError value)?  serverError,TResult Function( _NetworkError value)?  networkError,TResult Function( _Unauthorized value)?  unauthorized,TResult Function( _NotFound value)?  notFound,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerError value)  serverError,required TResult Function( _NetworkError value)  networkError,required TResult Function( _Unauthorized value)  unauthorized,required TResult Function( _NotFound value)  notFound,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that);case _NetworkError():
return networkError(_that);case _Unauthorized():
return unauthorized(_that);case _NotFound():
return notFound(_that);case _Unknown():
return unknown(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerError value)?  serverError,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _Unauthorized value)?  unauthorized,TResult? Function( _NotFound value)?  notFound,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  serverError,TResult Function()?  networkError,TResult Function()?  unauthorized,TResult Function()?  notFound,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkError() when networkError != null:
return networkError();case _Unauthorized() when unauthorized != null:
return unauthorized();case _NotFound() when notFound != null:
return notFound();case _Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  serverError,required TResult Function()  networkError,required TResult Function()  unauthorized,required TResult Function()  notFound,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that.message);case _NetworkError():
return networkError();case _Unauthorized():
return unauthorized();case _NotFound():
return notFound();case _Unknown():
return unknown();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  serverError,TResult? Function()?  networkError,TResult? Function()?  unauthorized,TResult? Function()?  notFound,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkError() when networkError != null:
return networkError();case _Unauthorized() when unauthorized != null:
return unauthorized();case _NotFound() when notFound != null:
return notFound();case _Unknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class _ServerError extends JobFailure {
  const _ServerError([this.message]): super._();
  

 final  String? message;

/// Create a copy of JobFailure
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
  return 'JobFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $JobFailureCopyWith<$Res> {
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

/// Create a copy of JobFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ServerError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NetworkError extends JobFailure {
  const _NetworkError(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobFailure.networkError()';
}


}




/// @nodoc


class _Unauthorized extends JobFailure {
  const _Unauthorized(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobFailure.unauthorized()';
}


}




/// @nodoc


class _NotFound extends JobFailure {
  const _NotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobFailure.notFound()';
}


}




/// @nodoc


class _Unknown extends JobFailure {
  const _Unknown(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobFailure.unknown()';
}


}




// dart format on
