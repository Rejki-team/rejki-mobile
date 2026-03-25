// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsState {

/// Apakah sudah scroll sampai bawah
 bool get hasScrolledToBottom;/// Apakah checkbox sudah dicentang
 bool get hasAgreed;/// Apakah webview loading
 bool get isLoading;/// Progress loading (0-100)
 int get loadingProgress;/// Error message jika ada
 String? get errorMessage;
/// Create a copy of TermsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsStateCopyWith<TermsState> get copyWith => _$TermsStateCopyWithImpl<TermsState>(this as TermsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsState&&(identical(other.hasScrolledToBottom, hasScrolledToBottom) || other.hasScrolledToBottom == hasScrolledToBottom)&&(identical(other.hasAgreed, hasAgreed) || other.hasAgreed == hasAgreed)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,hasScrolledToBottom,hasAgreed,isLoading,loadingProgress,errorMessage);

@override
String toString() {
  return 'TermsState(hasScrolledToBottom: $hasScrolledToBottom, hasAgreed: $hasAgreed, isLoading: $isLoading, loadingProgress: $loadingProgress, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TermsStateCopyWith<$Res>  {
  factory $TermsStateCopyWith(TermsState value, $Res Function(TermsState) _then) = _$TermsStateCopyWithImpl;
@useResult
$Res call({
 bool hasScrolledToBottom, bool hasAgreed, bool isLoading, int loadingProgress, String? errorMessage
});




}
/// @nodoc
class _$TermsStateCopyWithImpl<$Res>
    implements $TermsStateCopyWith<$Res> {
  _$TermsStateCopyWithImpl(this._self, this._then);

  final TermsState _self;
  final $Res Function(TermsState) _then;

/// Create a copy of TermsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasScrolledToBottom = null,Object? hasAgreed = null,Object? isLoading = null,Object? loadingProgress = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
hasScrolledToBottom: null == hasScrolledToBottom ? _self.hasScrolledToBottom : hasScrolledToBottom // ignore: cast_nullable_to_non_nullable
as bool,hasAgreed: null == hasAgreed ? _self.hasAgreed : hasAgreed // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingProgress: null == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsState].
extension TermsStatePatterns on TermsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsState value)  $default,){
final _that = this;
switch (_that) {
case _TermsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsState value)?  $default,){
final _that = this;
switch (_that) {
case _TermsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasScrolledToBottom,  bool hasAgreed,  bool isLoading,  int loadingProgress,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsState() when $default != null:
return $default(_that.hasScrolledToBottom,_that.hasAgreed,_that.isLoading,_that.loadingProgress,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasScrolledToBottom,  bool hasAgreed,  bool isLoading,  int loadingProgress,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TermsState():
return $default(_that.hasScrolledToBottom,_that.hasAgreed,_that.isLoading,_that.loadingProgress,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasScrolledToBottom,  bool hasAgreed,  bool isLoading,  int loadingProgress,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TermsState() when $default != null:
return $default(_that.hasScrolledToBottom,_that.hasAgreed,_that.isLoading,_that.loadingProgress,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TermsState extends TermsState {
  const _TermsState({this.hasScrolledToBottom = false, this.hasAgreed = false, this.isLoading = true, this.loadingProgress = 0, this.errorMessage}): super._();
  

/// Apakah sudah scroll sampai bawah
@override@JsonKey() final  bool hasScrolledToBottom;
/// Apakah checkbox sudah dicentang
@override@JsonKey() final  bool hasAgreed;
/// Apakah webview loading
@override@JsonKey() final  bool isLoading;
/// Progress loading (0-100)
@override@JsonKey() final  int loadingProgress;
/// Error message jika ada
@override final  String? errorMessage;

/// Create a copy of TermsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsStateCopyWith<_TermsState> get copyWith => __$TermsStateCopyWithImpl<_TermsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsState&&(identical(other.hasScrolledToBottom, hasScrolledToBottom) || other.hasScrolledToBottom == hasScrolledToBottom)&&(identical(other.hasAgreed, hasAgreed) || other.hasAgreed == hasAgreed)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,hasScrolledToBottom,hasAgreed,isLoading,loadingProgress,errorMessage);

@override
String toString() {
  return 'TermsState(hasScrolledToBottom: $hasScrolledToBottom, hasAgreed: $hasAgreed, isLoading: $isLoading, loadingProgress: $loadingProgress, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TermsStateCopyWith<$Res> implements $TermsStateCopyWith<$Res> {
  factory _$TermsStateCopyWith(_TermsState value, $Res Function(_TermsState) _then) = __$TermsStateCopyWithImpl;
@override @useResult
$Res call({
 bool hasScrolledToBottom, bool hasAgreed, bool isLoading, int loadingProgress, String? errorMessage
});




}
/// @nodoc
class __$TermsStateCopyWithImpl<$Res>
    implements _$TermsStateCopyWith<$Res> {
  __$TermsStateCopyWithImpl(this._self, this._then);

  final _TermsState _self;
  final $Res Function(_TermsState) _then;

/// Create a copy of TermsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasScrolledToBottom = null,Object? hasAgreed = null,Object? isLoading = null,Object? loadingProgress = null,Object? errorMessage = freezed,}) {
  return _then(_TermsState(
hasScrolledToBottom: null == hasScrolledToBottom ? _self.hasScrolledToBottom : hasScrolledToBottom // ignore: cast_nullable_to_non_nullable
as bool,hasAgreed: null == hasAgreed ? _self.hasAgreed : hasAgreed // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingProgress: null == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
