// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FabState {

/// Whether the menu is currently open
 bool get isMenuOpen;
/// Create a copy of FabState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FabStateCopyWith<FabState> get copyWith => _$FabStateCopyWithImpl<FabState>(this as FabState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FabState&&(identical(other.isMenuOpen, isMenuOpen) || other.isMenuOpen == isMenuOpen));
}


@override
int get hashCode => Object.hash(runtimeType,isMenuOpen);

@override
String toString() {
  return 'FabState(isMenuOpen: $isMenuOpen)';
}


}

/// @nodoc
abstract mixin class $FabStateCopyWith<$Res>  {
  factory $FabStateCopyWith(FabState value, $Res Function(FabState) _then) = _$FabStateCopyWithImpl;
@useResult
$Res call({
 bool isMenuOpen
});




}
/// @nodoc
class _$FabStateCopyWithImpl<$Res>
    implements $FabStateCopyWith<$Res> {
  _$FabStateCopyWithImpl(this._self, this._then);

  final FabState _self;
  final $Res Function(FabState) _then;

/// Create a copy of FabState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMenuOpen = null,}) {
  return _then(_self.copyWith(
isMenuOpen: null == isMenuOpen ? _self.isMenuOpen : isMenuOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FabState].
extension FabStatePatterns on FabState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FabState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FabState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FabState value)  $default,){
final _that = this;
switch (_that) {
case _FabState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FabState value)?  $default,){
final _that = this;
switch (_that) {
case _FabState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMenuOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FabState() when $default != null:
return $default(_that.isMenuOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMenuOpen)  $default,) {final _that = this;
switch (_that) {
case _FabState():
return $default(_that.isMenuOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMenuOpen)?  $default,) {final _that = this;
switch (_that) {
case _FabState() when $default != null:
return $default(_that.isMenuOpen);case _:
  return null;

}
}

}

/// @nodoc


class _FabState extends FabState {
  const _FabState({this.isMenuOpen = false}): super._();
  

/// Whether the menu is currently open
@override@JsonKey() final  bool isMenuOpen;

/// Create a copy of FabState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FabStateCopyWith<_FabState> get copyWith => __$FabStateCopyWithImpl<_FabState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FabState&&(identical(other.isMenuOpen, isMenuOpen) || other.isMenuOpen == isMenuOpen));
}


@override
int get hashCode => Object.hash(runtimeType,isMenuOpen);

@override
String toString() {
  return 'FabState(isMenuOpen: $isMenuOpen)';
}


}

/// @nodoc
abstract mixin class _$FabStateCopyWith<$Res> implements $FabStateCopyWith<$Res> {
  factory _$FabStateCopyWith(_FabState value, $Res Function(_FabState) _then) = __$FabStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMenuOpen
});




}
/// @nodoc
class __$FabStateCopyWithImpl<$Res>
    implements _$FabStateCopyWith<$Res> {
  __$FabStateCopyWithImpl(this._self, this._then);

  final _FabState _self;
  final $Res Function(_FabState) _then;

/// Create a copy of FabState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMenuOpen = null,}) {
  return _then(_FabState(
isMenuOpen: null == isMenuOpen ? _self.isMenuOpen : isMenuOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
