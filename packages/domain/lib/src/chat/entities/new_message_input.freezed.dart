// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_message_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewMessageInput {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewMessageInput);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewMessageInput()';
}


}

/// @nodoc
class $NewMessageInputCopyWith<$Res>  {
$NewMessageInputCopyWith(NewMessageInput _, $Res Function(NewMessageInput) __);
}


/// Adds pattern-matching-related methods to [NewMessageInput].
extension NewMessageInputPatterns on NewMessageInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NewMessageInputText value)?  text,TResult Function( NewMessageInputLocation value)?  location,TResult Function( NewMessageInputPhoto value)?  photo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NewMessageInputText() when text != null:
return text(_that);case NewMessageInputLocation() when location != null:
return location(_that);case NewMessageInputPhoto() when photo != null:
return photo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NewMessageInputText value)  text,required TResult Function( NewMessageInputLocation value)  location,required TResult Function( NewMessageInputPhoto value)  photo,}){
final _that = this;
switch (_that) {
case NewMessageInputText():
return text(_that);case NewMessageInputLocation():
return location(_that);case NewMessageInputPhoto():
return photo(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NewMessageInputText value)?  text,TResult? Function( NewMessageInputLocation value)?  location,TResult? Function( NewMessageInputPhoto value)?  photo,}){
final _that = this;
switch (_that) {
case NewMessageInputText() when text != null:
return text(_that);case NewMessageInputLocation() when location != null:
return location(_that);case NewMessageInputPhoto() when photo != null:
return photo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String content)?  text,TResult Function( double lat,  double lng)?  location,TResult Function( String photoObjectKey)?  photo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NewMessageInputText() when text != null:
return text(_that.content);case NewMessageInputLocation() when location != null:
return location(_that.lat,_that.lng);case NewMessageInputPhoto() when photo != null:
return photo(_that.photoObjectKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String content)  text,required TResult Function( double lat,  double lng)  location,required TResult Function( String photoObjectKey)  photo,}) {final _that = this;
switch (_that) {
case NewMessageInputText():
return text(_that.content);case NewMessageInputLocation():
return location(_that.lat,_that.lng);case NewMessageInputPhoto():
return photo(_that.photoObjectKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String content)?  text,TResult? Function( double lat,  double lng)?  location,TResult? Function( String photoObjectKey)?  photo,}) {final _that = this;
switch (_that) {
case NewMessageInputText() when text != null:
return text(_that.content);case NewMessageInputLocation() when location != null:
return location(_that.lat,_that.lng);case NewMessageInputPhoto() when photo != null:
return photo(_that.photoObjectKey);case _:
  return null;

}
}

}

/// @nodoc


class NewMessageInputText implements NewMessageInput {
  const NewMessageInputText(this.content);
  

 final  String content;

/// Create a copy of NewMessageInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewMessageInputTextCopyWith<NewMessageInputText> get copyWith => _$NewMessageInputTextCopyWithImpl<NewMessageInputText>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewMessageInputText&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'NewMessageInput.text(content: $content)';
}


}

/// @nodoc
abstract mixin class $NewMessageInputTextCopyWith<$Res> implements $NewMessageInputCopyWith<$Res> {
  factory $NewMessageInputTextCopyWith(NewMessageInputText value, $Res Function(NewMessageInputText) _then) = _$NewMessageInputTextCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$NewMessageInputTextCopyWithImpl<$Res>
    implements $NewMessageInputTextCopyWith<$Res> {
  _$NewMessageInputTextCopyWithImpl(this._self, this._then);

  final NewMessageInputText _self;
  final $Res Function(NewMessageInputText) _then;

/// Create a copy of NewMessageInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(NewMessageInputText(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NewMessageInputLocation implements NewMessageInput {
  const NewMessageInputLocation({required this.lat, required this.lng});
  

 final  double lat;
 final  double lng;

/// Create a copy of NewMessageInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewMessageInputLocationCopyWith<NewMessageInputLocation> get copyWith => _$NewMessageInputLocationCopyWithImpl<NewMessageInputLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewMessageInputLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'NewMessageInput.location(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $NewMessageInputLocationCopyWith<$Res> implements $NewMessageInputCopyWith<$Res> {
  factory $NewMessageInputLocationCopyWith(NewMessageInputLocation value, $Res Function(NewMessageInputLocation) _then) = _$NewMessageInputLocationCopyWithImpl;
@useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class _$NewMessageInputLocationCopyWithImpl<$Res>
    implements $NewMessageInputLocationCopyWith<$Res> {
  _$NewMessageInputLocationCopyWithImpl(this._self, this._then);

  final NewMessageInputLocation _self;
  final $Res Function(NewMessageInputLocation) _then;

/// Create a copy of NewMessageInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(NewMessageInputLocation(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class NewMessageInputPhoto implements NewMessageInput {
  const NewMessageInputPhoto(this.photoObjectKey);
  

 final  String photoObjectKey;

/// Create a copy of NewMessageInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewMessageInputPhotoCopyWith<NewMessageInputPhoto> get copyWith => _$NewMessageInputPhotoCopyWithImpl<NewMessageInputPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewMessageInputPhoto&&(identical(other.photoObjectKey, photoObjectKey) || other.photoObjectKey == photoObjectKey));
}


@override
int get hashCode => Object.hash(runtimeType,photoObjectKey);

@override
String toString() {
  return 'NewMessageInput.photo(photoObjectKey: $photoObjectKey)';
}


}

/// @nodoc
abstract mixin class $NewMessageInputPhotoCopyWith<$Res> implements $NewMessageInputCopyWith<$Res> {
  factory $NewMessageInputPhotoCopyWith(NewMessageInputPhoto value, $Res Function(NewMessageInputPhoto) _then) = _$NewMessageInputPhotoCopyWithImpl;
@useResult
$Res call({
 String photoObjectKey
});




}
/// @nodoc
class _$NewMessageInputPhotoCopyWithImpl<$Res>
    implements $NewMessageInputPhotoCopyWith<$Res> {
  _$NewMessageInputPhotoCopyWithImpl(this._self, this._then);

  final NewMessageInputPhoto _self;
  final $Res Function(NewMessageInputPhoto) _then;

/// Create a copy of NewMessageInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? photoObjectKey = null,}) {
  return _then(NewMessageInputPhoto(
null == photoObjectKey ? _self.photoObjectKey : photoObjectKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
