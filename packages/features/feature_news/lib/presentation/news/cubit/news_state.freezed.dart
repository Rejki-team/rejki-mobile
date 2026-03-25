// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsState {

 bool get isLoading; String get selectedFilter; String? get errorMessage;
/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsStateCopyWith<NewsState> get copyWith => _$NewsStateCopyWithImpl<NewsState>(this as NewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedFilter,errorMessage);

@override
String toString() {
  return 'NewsState(isLoading: $isLoading, selectedFilter: $selectedFilter, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NewsStateCopyWith<$Res>  {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) _then) = _$NewsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String selectedFilter, String? errorMessage
});




}
/// @nodoc
class _$NewsStateCopyWithImpl<$Res>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._self, this._then);

  final NewsState _self;
  final $Res Function(NewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? selectedFilter = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsState value)  $default,){
final _that = this;
switch (_that) {
case _NewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsState value)?  $default,){
final _that = this;
switch (_that) {
case _NewsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String selectedFilter,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsState() when $default != null:
return $default(_that.isLoading,_that.selectedFilter,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String selectedFilter,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NewsState():
return $default(_that.isLoading,_that.selectedFilter,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String selectedFilter,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NewsState() when $default != null:
return $default(_that.isLoading,_that.selectedFilter,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NewsState implements NewsState {
  const _NewsState({this.isLoading = false, this.selectedFilter = 'Semuanya', this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String selectedFilter;
@override final  String? errorMessage;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsStateCopyWith<_NewsState> get copyWith => __$NewsStateCopyWithImpl<_NewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedFilter,errorMessage);

@override
String toString() {
  return 'NewsState(isLoading: $isLoading, selectedFilter: $selectedFilter, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(_NewsState value, $Res Function(_NewsState) _then) = __$NewsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String selectedFilter, String? errorMessage
});




}
/// @nodoc
class __$NewsStateCopyWithImpl<$Res>
    implements _$NewsStateCopyWith<$Res> {
  __$NewsStateCopyWithImpl(this._self, this._then);

  final _NewsState _self;
  final $Res Function(_NewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? selectedFilter = null,Object? errorMessage = freezed,}) {
  return _then(_NewsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
