// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_used_goods_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailUsedGoodsAdState {

 SecondhandEntity? get secondhand; bool get isLoading; String? get errorMessage;
/// Create a copy of DetailUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailUsedGoodsAdStateCopyWith<DetailUsedGoodsAdState> get copyWith => _$DetailUsedGoodsAdStateCopyWithImpl<DetailUsedGoodsAdState>(this as DetailUsedGoodsAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailUsedGoodsAdState&&(identical(other.secondhand, secondhand) || other.secondhand == secondhand)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,secondhand,isLoading,errorMessage);

@override
String toString() {
  return 'DetailUsedGoodsAdState(secondhand: $secondhand, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DetailUsedGoodsAdStateCopyWith<$Res>  {
  factory $DetailUsedGoodsAdStateCopyWith(DetailUsedGoodsAdState value, $Res Function(DetailUsedGoodsAdState) _then) = _$DetailUsedGoodsAdStateCopyWithImpl;
@useResult
$Res call({
 SecondhandEntity? secondhand, bool isLoading, String? errorMessage
});


$SecondhandEntityCopyWith<$Res>? get secondhand;

}
/// @nodoc
class _$DetailUsedGoodsAdStateCopyWithImpl<$Res>
    implements $DetailUsedGoodsAdStateCopyWith<$Res> {
  _$DetailUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final DetailUsedGoodsAdState _self;
  final $Res Function(DetailUsedGoodsAdState) _then;

/// Create a copy of DetailUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secondhand = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
secondhand: freezed == secondhand ? _self.secondhand : secondhand // ignore: cast_nullable_to_non_nullable
as SecondhandEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DetailUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SecondhandEntityCopyWith<$Res>? get secondhand {
    if (_self.secondhand == null) {
    return null;
  }

  return $SecondhandEntityCopyWith<$Res>(_self.secondhand!, (value) {
    return _then(_self.copyWith(secondhand: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailUsedGoodsAdState].
extension DetailUsedGoodsAdStatePatterns on DetailUsedGoodsAdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailUsedGoodsAdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailUsedGoodsAdState value)  $default,){
final _that = this;
switch (_that) {
case _DetailUsedGoodsAdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailUsedGoodsAdState value)?  $default,){
final _that = this;
switch (_that) {
case _DetailUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SecondhandEntity? secondhand,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailUsedGoodsAdState() when $default != null:
return $default(_that.secondhand,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SecondhandEntity? secondhand,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DetailUsedGoodsAdState():
return $default(_that.secondhand,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SecondhandEntity? secondhand,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DetailUsedGoodsAdState() when $default != null:
return $default(_that.secondhand,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DetailUsedGoodsAdState implements DetailUsedGoodsAdState {
  const _DetailUsedGoodsAdState({this.secondhand, this.isLoading = false, this.errorMessage});
  

@override final  SecondhandEntity? secondhand;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of DetailUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailUsedGoodsAdStateCopyWith<_DetailUsedGoodsAdState> get copyWith => __$DetailUsedGoodsAdStateCopyWithImpl<_DetailUsedGoodsAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailUsedGoodsAdState&&(identical(other.secondhand, secondhand) || other.secondhand == secondhand)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,secondhand,isLoading,errorMessage);

@override
String toString() {
  return 'DetailUsedGoodsAdState(secondhand: $secondhand, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DetailUsedGoodsAdStateCopyWith<$Res> implements $DetailUsedGoodsAdStateCopyWith<$Res> {
  factory _$DetailUsedGoodsAdStateCopyWith(_DetailUsedGoodsAdState value, $Res Function(_DetailUsedGoodsAdState) _then) = __$DetailUsedGoodsAdStateCopyWithImpl;
@override @useResult
$Res call({
 SecondhandEntity? secondhand, bool isLoading, String? errorMessage
});


@override $SecondhandEntityCopyWith<$Res>? get secondhand;

}
/// @nodoc
class __$DetailUsedGoodsAdStateCopyWithImpl<$Res>
    implements _$DetailUsedGoodsAdStateCopyWith<$Res> {
  __$DetailUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final _DetailUsedGoodsAdState _self;
  final $Res Function(_DetailUsedGoodsAdState) _then;

/// Create a copy of DetailUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secondhand = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_DetailUsedGoodsAdState(
secondhand: freezed == secondhand ? _self.secondhand : secondhand // ignore: cast_nullable_to_non_nullable
as SecondhandEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DetailUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SecondhandEntityCopyWith<$Res>? get secondhand {
    if (_self.secondhand == null) {
    return null;
  }

  return $SecondhandEntityCopyWith<$Res>(_self.secondhand!, (value) {
    return _then(_self.copyWith(secondhand: value));
  });
}
}

// dart format on
