// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_barang_bekas_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryBarangBekasState {

 HistoryBarangBekasStatus get status; List<SecondhandEntity> get claims; bool get hasNext; int get currentPage; String? get errorMessage;
/// Create a copy of HistoryBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryBarangBekasStateCopyWith<HistoryBarangBekasState> get copyWith => _$HistoryBarangBekasStateCopyWithImpl<HistoryBarangBekasState>(this as HistoryBarangBekasState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryBarangBekasState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.claims, claims)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(claims),hasNext,currentPage,errorMessage);

@override
String toString() {
  return 'HistoryBarangBekasState(status: $status, claims: $claims, hasNext: $hasNext, currentPage: $currentPage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryBarangBekasStateCopyWith<$Res>  {
  factory $HistoryBarangBekasStateCopyWith(HistoryBarangBekasState value, $Res Function(HistoryBarangBekasState) _then) = _$HistoryBarangBekasStateCopyWithImpl;
@useResult
$Res call({
 HistoryBarangBekasStatus status, List<SecondhandEntity> claims, bool hasNext, int currentPage, String? errorMessage
});




}
/// @nodoc
class _$HistoryBarangBekasStateCopyWithImpl<$Res>
    implements $HistoryBarangBekasStateCopyWith<$Res> {
  _$HistoryBarangBekasStateCopyWithImpl(this._self, this._then);

  final HistoryBarangBekasState _self;
  final $Res Function(HistoryBarangBekasState) _then;

/// Create a copy of HistoryBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? claims = null,Object? hasNext = null,Object? currentPage = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryBarangBekasStatus,claims: null == claims ? _self.claims : claims // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryBarangBekasState].
extension HistoryBarangBekasStatePatterns on HistoryBarangBekasState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryBarangBekasState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryBarangBekasState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryBarangBekasState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryBarangBekasState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryBarangBekasState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryBarangBekasState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryBarangBekasStatus status,  List<SecondhandEntity> claims,  bool hasNext,  int currentPage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryBarangBekasState() when $default != null:
return $default(_that.status,_that.claims,_that.hasNext,_that.currentPage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryBarangBekasStatus status,  List<SecondhandEntity> claims,  bool hasNext,  int currentPage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryBarangBekasState():
return $default(_that.status,_that.claims,_that.hasNext,_that.currentPage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryBarangBekasStatus status,  List<SecondhandEntity> claims,  bool hasNext,  int currentPage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryBarangBekasState() when $default != null:
return $default(_that.status,_that.claims,_that.hasNext,_that.currentPage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryBarangBekasState implements HistoryBarangBekasState {
  const _HistoryBarangBekasState({this.status = HistoryBarangBekasStatus.initial, final  List<SecondhandEntity> claims = const [], this.hasNext = false, this.currentPage = 1, this.errorMessage}): _claims = claims;
  

@override@JsonKey() final  HistoryBarangBekasStatus status;
 final  List<SecondhandEntity> _claims;
@override@JsonKey() List<SecondhandEntity> get claims {
  if (_claims is EqualUnmodifiableListView) return _claims;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_claims);
}

@override@JsonKey() final  bool hasNext;
@override@JsonKey() final  int currentPage;
@override final  String? errorMessage;

/// Create a copy of HistoryBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryBarangBekasStateCopyWith<_HistoryBarangBekasState> get copyWith => __$HistoryBarangBekasStateCopyWithImpl<_HistoryBarangBekasState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryBarangBekasState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._claims, _claims)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_claims),hasNext,currentPage,errorMessage);

@override
String toString() {
  return 'HistoryBarangBekasState(status: $status, claims: $claims, hasNext: $hasNext, currentPage: $currentPage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryBarangBekasStateCopyWith<$Res> implements $HistoryBarangBekasStateCopyWith<$Res> {
  factory _$HistoryBarangBekasStateCopyWith(_HistoryBarangBekasState value, $Res Function(_HistoryBarangBekasState) _then) = __$HistoryBarangBekasStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryBarangBekasStatus status, List<SecondhandEntity> claims, bool hasNext, int currentPage, String? errorMessage
});




}
/// @nodoc
class __$HistoryBarangBekasStateCopyWithImpl<$Res>
    implements _$HistoryBarangBekasStateCopyWith<$Res> {
  __$HistoryBarangBekasStateCopyWithImpl(this._self, this._then);

  final _HistoryBarangBekasState _self;
  final $Res Function(_HistoryBarangBekasState) _then;

/// Create a copy of HistoryBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? claims = null,Object? hasNext = null,Object? currentPage = null,Object? errorMessage = freezed,}) {
  return _then(_HistoryBarangBekasState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryBarangBekasStatus,claims: null == claims ? _self._claims : claims // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
