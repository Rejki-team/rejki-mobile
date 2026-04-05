// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondhandUserInfoModel {

@JsonKey(name: 'full_name') String get fullName;
/// Create a copy of SecondhandUserInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandUserInfoModelCopyWith<SecondhandUserInfoModel> get copyWith => _$SecondhandUserInfoModelCopyWithImpl<SecondhandUserInfoModel>(this as SecondhandUserInfoModel, _$identity);

  /// Serializes this SecondhandUserInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandUserInfoModel&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName);

@override
String toString() {
  return 'SecondhandUserInfoModel(fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $SecondhandUserInfoModelCopyWith<$Res>  {
  factory $SecondhandUserInfoModelCopyWith(SecondhandUserInfoModel value, $Res Function(SecondhandUserInfoModel) _then) = _$SecondhandUserInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName
});




}
/// @nodoc
class _$SecondhandUserInfoModelCopyWithImpl<$Res>
    implements $SecondhandUserInfoModelCopyWith<$Res> {
  _$SecondhandUserInfoModelCopyWithImpl(this._self, this._then);

  final SecondhandUserInfoModel _self;
  final $Res Function(SecondhandUserInfoModel) _then;

/// Create a copy of SecondhandUserInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandUserInfoModel].
extension SecondhandUserInfoModelPatterns on SecondhandUserInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandUserInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandUserInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandUserInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandUserInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandUserInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandUserInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandUserInfoModel() when $default != null:
return $default(_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName)  $default,) {final _that = this;
switch (_that) {
case _SecondhandUserInfoModel():
return $default(_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandUserInfoModel() when $default != null:
return $default(_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondhandUserInfoModel implements SecondhandUserInfoModel {
  const _SecondhandUserInfoModel({@JsonKey(name: 'full_name') this.fullName = ''});
  factory _SecondhandUserInfoModel.fromJson(Map<String, dynamic> json) => _$SecondhandUserInfoModelFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;

/// Create a copy of SecondhandUserInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandUserInfoModelCopyWith<_SecondhandUserInfoModel> get copyWith => __$SecondhandUserInfoModelCopyWithImpl<_SecondhandUserInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondhandUserInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandUserInfoModel&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName);

@override
String toString() {
  return 'SecondhandUserInfoModel(fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$SecondhandUserInfoModelCopyWith<$Res> implements $SecondhandUserInfoModelCopyWith<$Res> {
  factory _$SecondhandUserInfoModelCopyWith(_SecondhandUserInfoModel value, $Res Function(_SecondhandUserInfoModel) _then) = __$SecondhandUserInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName
});




}
/// @nodoc
class __$SecondhandUserInfoModelCopyWithImpl<$Res>
    implements _$SecondhandUserInfoModelCopyWith<$Res> {
  __$SecondhandUserInfoModelCopyWithImpl(this._self, this._then);

  final _SecondhandUserInfoModel _self;
  final $Res Function(_SecondhandUserInfoModel) _then;

/// Create a copy of SecondhandUserInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,}) {
  return _then(_SecondhandUserInfoModel(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
