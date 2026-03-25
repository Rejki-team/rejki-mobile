// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsentModel {

/// Apakah user sudah setuju
 bool get hasAgreed;/// Waktu persetujuan
 DateTime get agreedAt;/// Versi terms yang disetujui
 String get termsVersion;/// Source terms (asset atau url)
 String? get termsSource;
/// Create a copy of ConsentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsentModelCopyWith<ConsentModel> get copyWith => _$ConsentModelCopyWithImpl<ConsentModel>(this as ConsentModel, _$identity);

  /// Serializes this ConsentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsentModel&&(identical(other.hasAgreed, hasAgreed) || other.hasAgreed == hasAgreed)&&(identical(other.agreedAt, agreedAt) || other.agreedAt == agreedAt)&&(identical(other.termsVersion, termsVersion) || other.termsVersion == termsVersion)&&(identical(other.termsSource, termsSource) || other.termsSource == termsSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasAgreed,agreedAt,termsVersion,termsSource);

@override
String toString() {
  return 'ConsentModel(hasAgreed: $hasAgreed, agreedAt: $agreedAt, termsVersion: $termsVersion, termsSource: $termsSource)';
}


}

/// @nodoc
abstract mixin class $ConsentModelCopyWith<$Res>  {
  factory $ConsentModelCopyWith(ConsentModel value, $Res Function(ConsentModel) _then) = _$ConsentModelCopyWithImpl;
@useResult
$Res call({
 bool hasAgreed, DateTime agreedAt, String termsVersion, String? termsSource
});




}
/// @nodoc
class _$ConsentModelCopyWithImpl<$Res>
    implements $ConsentModelCopyWith<$Res> {
  _$ConsentModelCopyWithImpl(this._self, this._then);

  final ConsentModel _self;
  final $Res Function(ConsentModel) _then;

/// Create a copy of ConsentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasAgreed = null,Object? agreedAt = null,Object? termsVersion = null,Object? termsSource = freezed,}) {
  return _then(_self.copyWith(
hasAgreed: null == hasAgreed ? _self.hasAgreed : hasAgreed // ignore: cast_nullable_to_non_nullable
as bool,agreedAt: null == agreedAt ? _self.agreedAt : agreedAt // ignore: cast_nullable_to_non_nullable
as DateTime,termsVersion: null == termsVersion ? _self.termsVersion : termsVersion // ignore: cast_nullable_to_non_nullable
as String,termsSource: freezed == termsSource ? _self.termsSource : termsSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsentModel].
extension ConsentModelPatterns on ConsentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsentModel value)  $default,){
final _that = this;
switch (_that) {
case _ConsentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConsentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasAgreed,  DateTime agreedAt,  String termsVersion,  String? termsSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsentModel() when $default != null:
return $default(_that.hasAgreed,_that.agreedAt,_that.termsVersion,_that.termsSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasAgreed,  DateTime agreedAt,  String termsVersion,  String? termsSource)  $default,) {final _that = this;
switch (_that) {
case _ConsentModel():
return $default(_that.hasAgreed,_that.agreedAt,_that.termsVersion,_that.termsSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasAgreed,  DateTime agreedAt,  String termsVersion,  String? termsSource)?  $default,) {final _that = this;
switch (_that) {
case _ConsentModel() when $default != null:
return $default(_that.hasAgreed,_that.agreedAt,_that.termsVersion,_that.termsSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsentModel implements ConsentModel {
  const _ConsentModel({required this.hasAgreed, required this.agreedAt, this.termsVersion = 'v1.0.0', this.termsSource});
  factory _ConsentModel.fromJson(Map<String, dynamic> json) => _$ConsentModelFromJson(json);

/// Apakah user sudah setuju
@override final  bool hasAgreed;
/// Waktu persetujuan
@override final  DateTime agreedAt;
/// Versi terms yang disetujui
@override@JsonKey() final  String termsVersion;
/// Source terms (asset atau url)
@override final  String? termsSource;

/// Create a copy of ConsentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsentModelCopyWith<_ConsentModel> get copyWith => __$ConsentModelCopyWithImpl<_ConsentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsentModel&&(identical(other.hasAgreed, hasAgreed) || other.hasAgreed == hasAgreed)&&(identical(other.agreedAt, agreedAt) || other.agreedAt == agreedAt)&&(identical(other.termsVersion, termsVersion) || other.termsVersion == termsVersion)&&(identical(other.termsSource, termsSource) || other.termsSource == termsSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasAgreed,agreedAt,termsVersion,termsSource);

@override
String toString() {
  return 'ConsentModel(hasAgreed: $hasAgreed, agreedAt: $agreedAt, termsVersion: $termsVersion, termsSource: $termsSource)';
}


}

/// @nodoc
abstract mixin class _$ConsentModelCopyWith<$Res> implements $ConsentModelCopyWith<$Res> {
  factory _$ConsentModelCopyWith(_ConsentModel value, $Res Function(_ConsentModel) _then) = __$ConsentModelCopyWithImpl;
@override @useResult
$Res call({
 bool hasAgreed, DateTime agreedAt, String termsVersion, String? termsSource
});




}
/// @nodoc
class __$ConsentModelCopyWithImpl<$Res>
    implements _$ConsentModelCopyWith<$Res> {
  __$ConsentModelCopyWithImpl(this._self, this._then);

  final _ConsentModel _self;
  final $Res Function(_ConsentModel) _then;

/// Create a copy of ConsentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasAgreed = null,Object? agreedAt = null,Object? termsVersion = null,Object? termsSource = freezed,}) {
  return _then(_ConsentModel(
hasAgreed: null == hasAgreed ? _self.hasAgreed : hasAgreed // ignore: cast_nullable_to_non_nullable
as bool,agreedAt: null == agreedAt ? _self.agreedAt : agreedAt // ignore: cast_nullable_to_non_nullable
as DateTime,termsVersion: null == termsVersion ? _self.termsVersion : termsVersion // ignore: cast_nullable_to_non_nullable
as String,termsSource: freezed == termsSource ? _self.termsSource : termsSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
