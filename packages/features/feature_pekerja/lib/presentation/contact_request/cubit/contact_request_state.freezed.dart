// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactRequestState {

// ── Tab Permintaan (status=request) ───────────────────────────────────────
 ContactRequestStatus get permintaanStatus; List<IncomingContactEntity> get permintaanList; int get permintaanPage; bool get permintaanHasNext; String? get permintaanError;// ── Tab Diterima (status=approve) ─────────────────────────────────────────
 ContactRequestStatus get diterimaStatus; List<IncomingContactEntity> get diterimaList; int get diterimaPage; bool get diterimaHasNext; String? get diterimaError;// ── Mutation (Terima / Tolak) ─────────────────────────────────────────────
 ContactRequestMutationStatus get mutationStatus; String? get mutationSuccessMessage; String? get mutationErrorMessage;
/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactRequestStateCopyWith<ContactRequestState> get copyWith => _$ContactRequestStateCopyWithImpl<ContactRequestState>(this as ContactRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactRequestState&&(identical(other.permintaanStatus, permintaanStatus) || other.permintaanStatus == permintaanStatus)&&const DeepCollectionEquality().equals(other.permintaanList, permintaanList)&&(identical(other.permintaanPage, permintaanPage) || other.permintaanPage == permintaanPage)&&(identical(other.permintaanHasNext, permintaanHasNext) || other.permintaanHasNext == permintaanHasNext)&&(identical(other.permintaanError, permintaanError) || other.permintaanError == permintaanError)&&(identical(other.diterimaStatus, diterimaStatus) || other.diterimaStatus == diterimaStatus)&&const DeepCollectionEquality().equals(other.diterimaList, diterimaList)&&(identical(other.diterimaPage, diterimaPage) || other.diterimaPage == diterimaPage)&&(identical(other.diterimaHasNext, diterimaHasNext) || other.diterimaHasNext == diterimaHasNext)&&(identical(other.diterimaError, diterimaError) || other.diterimaError == diterimaError)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,permintaanStatus,const DeepCollectionEquality().hash(permintaanList),permintaanPage,permintaanHasNext,permintaanError,diterimaStatus,const DeepCollectionEquality().hash(diterimaList),diterimaPage,diterimaHasNext,diterimaError,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'ContactRequestState(permintaanStatus: $permintaanStatus, permintaanList: $permintaanList, permintaanPage: $permintaanPage, permintaanHasNext: $permintaanHasNext, permintaanError: $permintaanError, diterimaStatus: $diterimaStatus, diterimaList: $diterimaList, diterimaPage: $diterimaPage, diterimaHasNext: $diterimaHasNext, diterimaError: $diterimaError, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $ContactRequestStateCopyWith<$Res>  {
  factory $ContactRequestStateCopyWith(ContactRequestState value, $Res Function(ContactRequestState) _then) = _$ContactRequestStateCopyWithImpl;
@useResult
$Res call({
 ContactRequestStatus permintaanStatus, List<IncomingContactEntity> permintaanList, int permintaanPage, bool permintaanHasNext, String? permintaanError, ContactRequestStatus diterimaStatus, List<IncomingContactEntity> diterimaList, int diterimaPage, bool diterimaHasNext, String? diterimaError, ContactRequestMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class _$ContactRequestStateCopyWithImpl<$Res>
    implements $ContactRequestStateCopyWith<$Res> {
  _$ContactRequestStateCopyWithImpl(this._self, this._then);

  final ContactRequestState _self;
  final $Res Function(ContactRequestState) _then;

/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permintaanStatus = null,Object? permintaanList = null,Object? permintaanPage = null,Object? permintaanHasNext = null,Object? permintaanError = freezed,Object? diterimaStatus = null,Object? diterimaList = null,Object? diterimaPage = null,Object? diterimaHasNext = null,Object? diterimaError = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
permintaanStatus: null == permintaanStatus ? _self.permintaanStatus : permintaanStatus // ignore: cast_nullable_to_non_nullable
as ContactRequestStatus,permintaanList: null == permintaanList ? _self.permintaanList : permintaanList // ignore: cast_nullable_to_non_nullable
as List<IncomingContactEntity>,permintaanPage: null == permintaanPage ? _self.permintaanPage : permintaanPage // ignore: cast_nullable_to_non_nullable
as int,permintaanHasNext: null == permintaanHasNext ? _self.permintaanHasNext : permintaanHasNext // ignore: cast_nullable_to_non_nullable
as bool,permintaanError: freezed == permintaanError ? _self.permintaanError : permintaanError // ignore: cast_nullable_to_non_nullable
as String?,diterimaStatus: null == diterimaStatus ? _self.diterimaStatus : diterimaStatus // ignore: cast_nullable_to_non_nullable
as ContactRequestStatus,diterimaList: null == diterimaList ? _self.diterimaList : diterimaList // ignore: cast_nullable_to_non_nullable
as List<IncomingContactEntity>,diterimaPage: null == diterimaPage ? _self.diterimaPage : diterimaPage // ignore: cast_nullable_to_non_nullable
as int,diterimaHasNext: null == diterimaHasNext ? _self.diterimaHasNext : diterimaHasNext // ignore: cast_nullable_to_non_nullable
as bool,diterimaError: freezed == diterimaError ? _self.diterimaError : diterimaError // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as ContactRequestMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactRequestState].
extension ContactRequestStatePatterns on ContactRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactRequestState value)  $default,){
final _that = this;
switch (_that) {
case _ContactRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContactRequestStatus permintaanStatus,  List<IncomingContactEntity> permintaanList,  int permintaanPage,  bool permintaanHasNext,  String? permintaanError,  ContactRequestStatus diterimaStatus,  List<IncomingContactEntity> diterimaList,  int diterimaPage,  bool diterimaHasNext,  String? diterimaError,  ContactRequestMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
return $default(_that.permintaanStatus,_that.permintaanList,_that.permintaanPage,_that.permintaanHasNext,_that.permintaanError,_that.diterimaStatus,_that.diterimaList,_that.diterimaPage,_that.diterimaHasNext,_that.diterimaError,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContactRequestStatus permintaanStatus,  List<IncomingContactEntity> permintaanList,  int permintaanPage,  bool permintaanHasNext,  String? permintaanError,  ContactRequestStatus diterimaStatus,  List<IncomingContactEntity> diterimaList,  int diterimaPage,  bool diterimaHasNext,  String? diterimaError,  ContactRequestMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _ContactRequestState():
return $default(_that.permintaanStatus,_that.permintaanList,_that.permintaanPage,_that.permintaanHasNext,_that.permintaanError,_that.diterimaStatus,_that.diterimaList,_that.diterimaPage,_that.diterimaHasNext,_that.diterimaError,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContactRequestStatus permintaanStatus,  List<IncomingContactEntity> permintaanList,  int permintaanPage,  bool permintaanHasNext,  String? permintaanError,  ContactRequestStatus diterimaStatus,  List<IncomingContactEntity> diterimaList,  int diterimaPage,  bool diterimaHasNext,  String? diterimaError,  ContactRequestMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
return $default(_that.permintaanStatus,_that.permintaanList,_that.permintaanPage,_that.permintaanHasNext,_that.permintaanError,_that.diterimaStatus,_that.diterimaList,_that.diterimaPage,_that.diterimaHasNext,_that.diterimaError,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ContactRequestState implements ContactRequestState {
  const _ContactRequestState({this.permintaanStatus = ContactRequestStatus.initial, final  List<IncomingContactEntity> permintaanList = const [], this.permintaanPage = 1, this.permintaanHasNext = true, this.permintaanError, this.diterimaStatus = ContactRequestStatus.initial, final  List<IncomingContactEntity> diterimaList = const [], this.diterimaPage = 1, this.diterimaHasNext = true, this.diterimaError, this.mutationStatus = ContactRequestMutationStatus.initial, this.mutationSuccessMessage, this.mutationErrorMessage}): _permintaanList = permintaanList,_diterimaList = diterimaList;
  

// ── Tab Permintaan (status=request) ───────────────────────────────────────
@override@JsonKey() final  ContactRequestStatus permintaanStatus;
 final  List<IncomingContactEntity> _permintaanList;
@override@JsonKey() List<IncomingContactEntity> get permintaanList {
  if (_permintaanList is EqualUnmodifiableListView) return _permintaanList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permintaanList);
}

@override@JsonKey() final  int permintaanPage;
@override@JsonKey() final  bool permintaanHasNext;
@override final  String? permintaanError;
// ── Tab Diterima (status=approve) ─────────────────────────────────────────
@override@JsonKey() final  ContactRequestStatus diterimaStatus;
 final  List<IncomingContactEntity> _diterimaList;
@override@JsonKey() List<IncomingContactEntity> get diterimaList {
  if (_diterimaList is EqualUnmodifiableListView) return _diterimaList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diterimaList);
}

@override@JsonKey() final  int diterimaPage;
@override@JsonKey() final  bool diterimaHasNext;
@override final  String? diterimaError;
// ── Mutation (Terima / Tolak) ─────────────────────────────────────────────
@override@JsonKey() final  ContactRequestMutationStatus mutationStatus;
@override final  String? mutationSuccessMessage;
@override final  String? mutationErrorMessage;

/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactRequestStateCopyWith<_ContactRequestState> get copyWith => __$ContactRequestStateCopyWithImpl<_ContactRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactRequestState&&(identical(other.permintaanStatus, permintaanStatus) || other.permintaanStatus == permintaanStatus)&&const DeepCollectionEquality().equals(other._permintaanList, _permintaanList)&&(identical(other.permintaanPage, permintaanPage) || other.permintaanPage == permintaanPage)&&(identical(other.permintaanHasNext, permintaanHasNext) || other.permintaanHasNext == permintaanHasNext)&&(identical(other.permintaanError, permintaanError) || other.permintaanError == permintaanError)&&(identical(other.diterimaStatus, diterimaStatus) || other.diterimaStatus == diterimaStatus)&&const DeepCollectionEquality().equals(other._diterimaList, _diterimaList)&&(identical(other.diterimaPage, diterimaPage) || other.diterimaPage == diterimaPage)&&(identical(other.diterimaHasNext, diterimaHasNext) || other.diterimaHasNext == diterimaHasNext)&&(identical(other.diterimaError, diterimaError) || other.diterimaError == diterimaError)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,permintaanStatus,const DeepCollectionEquality().hash(_permintaanList),permintaanPage,permintaanHasNext,permintaanError,diterimaStatus,const DeepCollectionEquality().hash(_diterimaList),diterimaPage,diterimaHasNext,diterimaError,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'ContactRequestState(permintaanStatus: $permintaanStatus, permintaanList: $permintaanList, permintaanPage: $permintaanPage, permintaanHasNext: $permintaanHasNext, permintaanError: $permintaanError, diterimaStatus: $diterimaStatus, diterimaList: $diterimaList, diterimaPage: $diterimaPage, diterimaHasNext: $diterimaHasNext, diterimaError: $diterimaError, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$ContactRequestStateCopyWith<$Res> implements $ContactRequestStateCopyWith<$Res> {
  factory _$ContactRequestStateCopyWith(_ContactRequestState value, $Res Function(_ContactRequestState) _then) = __$ContactRequestStateCopyWithImpl;
@override @useResult
$Res call({
 ContactRequestStatus permintaanStatus, List<IncomingContactEntity> permintaanList, int permintaanPage, bool permintaanHasNext, String? permintaanError, ContactRequestStatus diterimaStatus, List<IncomingContactEntity> diterimaList, int diterimaPage, bool diterimaHasNext, String? diterimaError, ContactRequestMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class __$ContactRequestStateCopyWithImpl<$Res>
    implements _$ContactRequestStateCopyWith<$Res> {
  __$ContactRequestStateCopyWithImpl(this._self, this._then);

  final _ContactRequestState _self;
  final $Res Function(_ContactRequestState) _then;

/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permintaanStatus = null,Object? permintaanList = null,Object? permintaanPage = null,Object? permintaanHasNext = null,Object? permintaanError = freezed,Object? diterimaStatus = null,Object? diterimaList = null,Object? diterimaPage = null,Object? diterimaHasNext = null,Object? diterimaError = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_ContactRequestState(
permintaanStatus: null == permintaanStatus ? _self.permintaanStatus : permintaanStatus // ignore: cast_nullable_to_non_nullable
as ContactRequestStatus,permintaanList: null == permintaanList ? _self._permintaanList : permintaanList // ignore: cast_nullable_to_non_nullable
as List<IncomingContactEntity>,permintaanPage: null == permintaanPage ? _self.permintaanPage : permintaanPage // ignore: cast_nullable_to_non_nullable
as int,permintaanHasNext: null == permintaanHasNext ? _self.permintaanHasNext : permintaanHasNext // ignore: cast_nullable_to_non_nullable
as bool,permintaanError: freezed == permintaanError ? _self.permintaanError : permintaanError // ignore: cast_nullable_to_non_nullable
as String?,diterimaStatus: null == diterimaStatus ? _self.diterimaStatus : diterimaStatus // ignore: cast_nullable_to_non_nullable
as ContactRequestStatus,diterimaList: null == diterimaList ? _self._diterimaList : diterimaList // ignore: cast_nullable_to_non_nullable
as List<IncomingContactEntity>,diterimaPage: null == diterimaPage ? _self.diterimaPage : diterimaPage // ignore: cast_nullable_to_non_nullable
as int,diterimaHasNext: null == diterimaHasNext ? _self.diterimaHasNext : diterimaHasNext // ignore: cast_nullable_to_non_nullable
as bool,diterimaError: freezed == diterimaError ? _self.diterimaError : diterimaError // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as ContactRequestMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
