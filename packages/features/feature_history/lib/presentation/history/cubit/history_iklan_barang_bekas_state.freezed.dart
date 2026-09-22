// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_iklan_barang_bekas_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryIklanBarangBekasState {

 HistoryIklanBarangBekasStatus get status; List<SecondhandEntity> get ads; int get page; bool get hasNext; String? get errorMessage;
/// Create a copy of HistoryIklanBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryIklanBarangBekasStateCopyWith<HistoryIklanBarangBekasState> get copyWith => _$HistoryIklanBarangBekasStateCopyWithImpl<HistoryIklanBarangBekasState>(this as HistoryIklanBarangBekasState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryIklanBarangBekasState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ads, ads)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(ads),page,hasNext,errorMessage);

@override
String toString() {
  return 'HistoryIklanBarangBekasState(status: $status, ads: $ads, page: $page, hasNext: $hasNext, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryIklanBarangBekasStateCopyWith<$Res>  {
  factory $HistoryIklanBarangBekasStateCopyWith(HistoryIklanBarangBekasState value, $Res Function(HistoryIklanBarangBekasState) _then) = _$HistoryIklanBarangBekasStateCopyWithImpl;
@useResult
$Res call({
 HistoryIklanBarangBekasStatus status, List<SecondhandEntity> ads, int page, bool hasNext, String? errorMessage
});




}
/// @nodoc
class _$HistoryIklanBarangBekasStateCopyWithImpl<$Res>
    implements $HistoryIklanBarangBekasStateCopyWith<$Res> {
  _$HistoryIklanBarangBekasStateCopyWithImpl(this._self, this._then);

  final HistoryIklanBarangBekasState _self;
  final $Res Function(HistoryIklanBarangBekasState) _then;

/// Create a copy of HistoryIklanBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? ads = null,Object? page = null,Object? hasNext = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryIklanBarangBekasStatus,ads: null == ads ? _self.ads : ads // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryIklanBarangBekasState].
extension HistoryIklanBarangBekasStatePatterns on HistoryIklanBarangBekasState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryIklanBarangBekasState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryIklanBarangBekasState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryIklanBarangBekasState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryIklanBarangBekasState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryIklanBarangBekasState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryIklanBarangBekasState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryIklanBarangBekasStatus status,  List<SecondhandEntity> ads,  int page,  bool hasNext,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryIklanBarangBekasState() when $default != null:
return $default(_that.status,_that.ads,_that.page,_that.hasNext,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryIklanBarangBekasStatus status,  List<SecondhandEntity> ads,  int page,  bool hasNext,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryIklanBarangBekasState():
return $default(_that.status,_that.ads,_that.page,_that.hasNext,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryIklanBarangBekasStatus status,  List<SecondhandEntity> ads,  int page,  bool hasNext,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryIklanBarangBekasState() when $default != null:
return $default(_that.status,_that.ads,_that.page,_that.hasNext,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryIklanBarangBekasState implements HistoryIklanBarangBekasState {
  const _HistoryIklanBarangBekasState({this.status = HistoryIklanBarangBekasStatus.initial, final  List<SecondhandEntity> ads = const [], this.page = 1, this.hasNext = true, this.errorMessage}): _ads = ads;
  

@override@JsonKey() final  HistoryIklanBarangBekasStatus status;
 final  List<SecondhandEntity> _ads;
@override@JsonKey() List<SecondhandEntity> get ads {
  if (_ads is EqualUnmodifiableListView) return _ads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ads);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasNext;
@override final  String? errorMessage;

/// Create a copy of HistoryIklanBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryIklanBarangBekasStateCopyWith<_HistoryIklanBarangBekasState> get copyWith => __$HistoryIklanBarangBekasStateCopyWithImpl<_HistoryIklanBarangBekasState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryIklanBarangBekasState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._ads, _ads)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_ads),page,hasNext,errorMessage);

@override
String toString() {
  return 'HistoryIklanBarangBekasState(status: $status, ads: $ads, page: $page, hasNext: $hasNext, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryIklanBarangBekasStateCopyWith<$Res> implements $HistoryIklanBarangBekasStateCopyWith<$Res> {
  factory _$HistoryIklanBarangBekasStateCopyWith(_HistoryIklanBarangBekasState value, $Res Function(_HistoryIklanBarangBekasState) _then) = __$HistoryIklanBarangBekasStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryIklanBarangBekasStatus status, List<SecondhandEntity> ads, int page, bool hasNext, String? errorMessage
});




}
/// @nodoc
class __$HistoryIklanBarangBekasStateCopyWithImpl<$Res>
    implements _$HistoryIklanBarangBekasStateCopyWith<$Res> {
  __$HistoryIklanBarangBekasStateCopyWithImpl(this._self, this._then);

  final _HistoryIklanBarangBekasState _self;
  final $Res Function(_HistoryIklanBarangBekasState) _then;

/// Create a copy of HistoryIklanBarangBekasState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? ads = null,Object? page = null,Object? hasNext = null,Object? errorMessage = freezed,}) {
  return _then(_HistoryIklanBarangBekasState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryIklanBarangBekasStatus,ads: null == ads ? _self._ads : ads // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
