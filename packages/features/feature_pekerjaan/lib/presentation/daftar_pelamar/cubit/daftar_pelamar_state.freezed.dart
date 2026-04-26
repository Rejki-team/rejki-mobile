// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daftar_pelamar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DaftarPelamarState {

// ── Tab Pelamar (status=request) ──────────────────────────────────────────
 DaftarPelamarStatus get pelamarStatus; List<BidEntity> get pelamarList; int get pelamarPage; bool get pelamarHasNext; String? get pelamarError;// ── Tab Pelamar Diterima (status=approve) ─────────────────────────────────
 DaftarPelamarStatus get diterimaStatus; List<BidEntity> get diterimaList; int get diterimaPage; bool get diterimaHasNext; String? get diterimaError;// ── Mutation (Terima / Tolak) ─────────────────────────────────────────────
 DaftarPelamarMutationStatus get mutationStatus; String? get mutationSuccessMessage; String? get mutationErrorMessage;
/// Create a copy of DaftarPelamarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaftarPelamarStateCopyWith<DaftarPelamarState> get copyWith => _$DaftarPelamarStateCopyWithImpl<DaftarPelamarState>(this as DaftarPelamarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaftarPelamarState&&(identical(other.pelamarStatus, pelamarStatus) || other.pelamarStatus == pelamarStatus)&&const DeepCollectionEquality().equals(other.pelamarList, pelamarList)&&(identical(other.pelamarPage, pelamarPage) || other.pelamarPage == pelamarPage)&&(identical(other.pelamarHasNext, pelamarHasNext) || other.pelamarHasNext == pelamarHasNext)&&(identical(other.pelamarError, pelamarError) || other.pelamarError == pelamarError)&&(identical(other.diterimaStatus, diterimaStatus) || other.diterimaStatus == diterimaStatus)&&const DeepCollectionEquality().equals(other.diterimaList, diterimaList)&&(identical(other.diterimaPage, diterimaPage) || other.diterimaPage == diterimaPage)&&(identical(other.diterimaHasNext, diterimaHasNext) || other.diterimaHasNext == diterimaHasNext)&&(identical(other.diterimaError, diterimaError) || other.diterimaError == diterimaError)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,pelamarStatus,const DeepCollectionEquality().hash(pelamarList),pelamarPage,pelamarHasNext,pelamarError,diterimaStatus,const DeepCollectionEquality().hash(diterimaList),diterimaPage,diterimaHasNext,diterimaError,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'DaftarPelamarState(pelamarStatus: $pelamarStatus, pelamarList: $pelamarList, pelamarPage: $pelamarPage, pelamarHasNext: $pelamarHasNext, pelamarError: $pelamarError, diterimaStatus: $diterimaStatus, diterimaList: $diterimaList, diterimaPage: $diterimaPage, diterimaHasNext: $diterimaHasNext, diterimaError: $diterimaError, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $DaftarPelamarStateCopyWith<$Res>  {
  factory $DaftarPelamarStateCopyWith(DaftarPelamarState value, $Res Function(DaftarPelamarState) _then) = _$DaftarPelamarStateCopyWithImpl;
@useResult
$Res call({
 DaftarPelamarStatus pelamarStatus, List<BidEntity> pelamarList, int pelamarPage, bool pelamarHasNext, String? pelamarError, DaftarPelamarStatus diterimaStatus, List<BidEntity> diterimaList, int diterimaPage, bool diterimaHasNext, String? diterimaError, DaftarPelamarMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class _$DaftarPelamarStateCopyWithImpl<$Res>
    implements $DaftarPelamarStateCopyWith<$Res> {
  _$DaftarPelamarStateCopyWithImpl(this._self, this._then);

  final DaftarPelamarState _self;
  final $Res Function(DaftarPelamarState) _then;

/// Create a copy of DaftarPelamarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pelamarStatus = null,Object? pelamarList = null,Object? pelamarPage = null,Object? pelamarHasNext = null,Object? pelamarError = freezed,Object? diterimaStatus = null,Object? diterimaList = null,Object? diterimaPage = null,Object? diterimaHasNext = null,Object? diterimaError = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
pelamarStatus: null == pelamarStatus ? _self.pelamarStatus : pelamarStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarStatus,pelamarList: null == pelamarList ? _self.pelamarList : pelamarList // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,pelamarPage: null == pelamarPage ? _self.pelamarPage : pelamarPage // ignore: cast_nullable_to_non_nullable
as int,pelamarHasNext: null == pelamarHasNext ? _self.pelamarHasNext : pelamarHasNext // ignore: cast_nullable_to_non_nullable
as bool,pelamarError: freezed == pelamarError ? _self.pelamarError : pelamarError // ignore: cast_nullable_to_non_nullable
as String?,diterimaStatus: null == diterimaStatus ? _self.diterimaStatus : diterimaStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarStatus,diterimaList: null == diterimaList ? _self.diterimaList : diterimaList // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,diterimaPage: null == diterimaPage ? _self.diterimaPage : diterimaPage // ignore: cast_nullable_to_non_nullable
as int,diterimaHasNext: null == diterimaHasNext ? _self.diterimaHasNext : diterimaHasNext // ignore: cast_nullable_to_non_nullable
as bool,diterimaError: freezed == diterimaError ? _self.diterimaError : diterimaError // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DaftarPelamarState].
extension DaftarPelamarStatePatterns on DaftarPelamarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DaftarPelamarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DaftarPelamarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DaftarPelamarState value)  $default,){
final _that = this;
switch (_that) {
case _DaftarPelamarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DaftarPelamarState value)?  $default,){
final _that = this;
switch (_that) {
case _DaftarPelamarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DaftarPelamarStatus pelamarStatus,  List<BidEntity> pelamarList,  int pelamarPage,  bool pelamarHasNext,  String? pelamarError,  DaftarPelamarStatus diterimaStatus,  List<BidEntity> diterimaList,  int diterimaPage,  bool diterimaHasNext,  String? diterimaError,  DaftarPelamarMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DaftarPelamarState() when $default != null:
return $default(_that.pelamarStatus,_that.pelamarList,_that.pelamarPage,_that.pelamarHasNext,_that.pelamarError,_that.diterimaStatus,_that.diterimaList,_that.diterimaPage,_that.diterimaHasNext,_that.diterimaError,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DaftarPelamarStatus pelamarStatus,  List<BidEntity> pelamarList,  int pelamarPage,  bool pelamarHasNext,  String? pelamarError,  DaftarPelamarStatus diterimaStatus,  List<BidEntity> diterimaList,  int diterimaPage,  bool diterimaHasNext,  String? diterimaError,  DaftarPelamarMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _DaftarPelamarState():
return $default(_that.pelamarStatus,_that.pelamarList,_that.pelamarPage,_that.pelamarHasNext,_that.pelamarError,_that.diterimaStatus,_that.diterimaList,_that.diterimaPage,_that.diterimaHasNext,_that.diterimaError,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DaftarPelamarStatus pelamarStatus,  List<BidEntity> pelamarList,  int pelamarPage,  bool pelamarHasNext,  String? pelamarError,  DaftarPelamarStatus diterimaStatus,  List<BidEntity> diterimaList,  int diterimaPage,  bool diterimaHasNext,  String? diterimaError,  DaftarPelamarMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DaftarPelamarState() when $default != null:
return $default(_that.pelamarStatus,_that.pelamarList,_that.pelamarPage,_that.pelamarHasNext,_that.pelamarError,_that.diterimaStatus,_that.diterimaList,_that.diterimaPage,_that.diterimaHasNext,_that.diterimaError,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DaftarPelamarState implements DaftarPelamarState {
  const _DaftarPelamarState({this.pelamarStatus = DaftarPelamarStatus.initial, final  List<BidEntity> pelamarList = const [], this.pelamarPage = 1, this.pelamarHasNext = true, this.pelamarError, this.diterimaStatus = DaftarPelamarStatus.initial, final  List<BidEntity> diterimaList = const [], this.diterimaPage = 1, this.diterimaHasNext = true, this.diterimaError, this.mutationStatus = DaftarPelamarMutationStatus.initial, this.mutationSuccessMessage, this.mutationErrorMessage}): _pelamarList = pelamarList,_diterimaList = diterimaList;
  

// ── Tab Pelamar (status=request) ──────────────────────────────────────────
@override@JsonKey() final  DaftarPelamarStatus pelamarStatus;
 final  List<BidEntity> _pelamarList;
@override@JsonKey() List<BidEntity> get pelamarList {
  if (_pelamarList is EqualUnmodifiableListView) return _pelamarList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pelamarList);
}

@override@JsonKey() final  int pelamarPage;
@override@JsonKey() final  bool pelamarHasNext;
@override final  String? pelamarError;
// ── Tab Pelamar Diterima (status=approve) ─────────────────────────────────
@override@JsonKey() final  DaftarPelamarStatus diterimaStatus;
 final  List<BidEntity> _diterimaList;
@override@JsonKey() List<BidEntity> get diterimaList {
  if (_diterimaList is EqualUnmodifiableListView) return _diterimaList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diterimaList);
}

@override@JsonKey() final  int diterimaPage;
@override@JsonKey() final  bool diterimaHasNext;
@override final  String? diterimaError;
// ── Mutation (Terima / Tolak) ─────────────────────────────────────────────
@override@JsonKey() final  DaftarPelamarMutationStatus mutationStatus;
@override final  String? mutationSuccessMessage;
@override final  String? mutationErrorMessage;

/// Create a copy of DaftarPelamarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaftarPelamarStateCopyWith<_DaftarPelamarState> get copyWith => __$DaftarPelamarStateCopyWithImpl<_DaftarPelamarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaftarPelamarState&&(identical(other.pelamarStatus, pelamarStatus) || other.pelamarStatus == pelamarStatus)&&const DeepCollectionEquality().equals(other._pelamarList, _pelamarList)&&(identical(other.pelamarPage, pelamarPage) || other.pelamarPage == pelamarPage)&&(identical(other.pelamarHasNext, pelamarHasNext) || other.pelamarHasNext == pelamarHasNext)&&(identical(other.pelamarError, pelamarError) || other.pelamarError == pelamarError)&&(identical(other.diterimaStatus, diterimaStatus) || other.diterimaStatus == diterimaStatus)&&const DeepCollectionEquality().equals(other._diterimaList, _diterimaList)&&(identical(other.diterimaPage, diterimaPage) || other.diterimaPage == diterimaPage)&&(identical(other.diterimaHasNext, diterimaHasNext) || other.diterimaHasNext == diterimaHasNext)&&(identical(other.diterimaError, diterimaError) || other.diterimaError == diterimaError)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,pelamarStatus,const DeepCollectionEquality().hash(_pelamarList),pelamarPage,pelamarHasNext,pelamarError,diterimaStatus,const DeepCollectionEquality().hash(_diterimaList),diterimaPage,diterimaHasNext,diterimaError,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'DaftarPelamarState(pelamarStatus: $pelamarStatus, pelamarList: $pelamarList, pelamarPage: $pelamarPage, pelamarHasNext: $pelamarHasNext, pelamarError: $pelamarError, diterimaStatus: $diterimaStatus, diterimaList: $diterimaList, diterimaPage: $diterimaPage, diterimaHasNext: $diterimaHasNext, diterimaError: $diterimaError, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$DaftarPelamarStateCopyWith<$Res> implements $DaftarPelamarStateCopyWith<$Res> {
  factory _$DaftarPelamarStateCopyWith(_DaftarPelamarState value, $Res Function(_DaftarPelamarState) _then) = __$DaftarPelamarStateCopyWithImpl;
@override @useResult
$Res call({
 DaftarPelamarStatus pelamarStatus, List<BidEntity> pelamarList, int pelamarPage, bool pelamarHasNext, String? pelamarError, DaftarPelamarStatus diterimaStatus, List<BidEntity> diterimaList, int diterimaPage, bool diterimaHasNext, String? diterimaError, DaftarPelamarMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class __$DaftarPelamarStateCopyWithImpl<$Res>
    implements _$DaftarPelamarStateCopyWith<$Res> {
  __$DaftarPelamarStateCopyWithImpl(this._self, this._then);

  final _DaftarPelamarState _self;
  final $Res Function(_DaftarPelamarState) _then;

/// Create a copy of DaftarPelamarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pelamarStatus = null,Object? pelamarList = null,Object? pelamarPage = null,Object? pelamarHasNext = null,Object? pelamarError = freezed,Object? diterimaStatus = null,Object? diterimaList = null,Object? diterimaPage = null,Object? diterimaHasNext = null,Object? diterimaError = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_DaftarPelamarState(
pelamarStatus: null == pelamarStatus ? _self.pelamarStatus : pelamarStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarStatus,pelamarList: null == pelamarList ? _self._pelamarList : pelamarList // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,pelamarPage: null == pelamarPage ? _self.pelamarPage : pelamarPage // ignore: cast_nullable_to_non_nullable
as int,pelamarHasNext: null == pelamarHasNext ? _self.pelamarHasNext : pelamarHasNext // ignore: cast_nullable_to_non_nullable
as bool,pelamarError: freezed == pelamarError ? _self.pelamarError : pelamarError // ignore: cast_nullable_to_non_nullable
as String?,diterimaStatus: null == diterimaStatus ? _self.diterimaStatus : diterimaStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarStatus,diterimaList: null == diterimaList ? _self._diterimaList : diterimaList // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,diterimaPage: null == diterimaPage ? _self.diterimaPage : diterimaPage // ignore: cast_nullable_to_non_nullable
as int,diterimaHasNext: null == diterimaHasNext ? _self.diterimaHasNext : diterimaHasNext // ignore: cast_nullable_to_non_nullable
as bool,diterimaError: freezed == diterimaError ? _self.diterimaError : diterimaError // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
