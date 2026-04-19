// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_pekerjaan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryPekerjaanState {

 HistoryPekerjaanStatus get status; List<BidEntity> get bids; int get page; bool get hasNext; String? get errorMessage;// Mutation states (Tandai Selesai & Beri Rating)
 HistoryPekerjaanMutationStatus get mutationStatus; String? get mutationSuccessMessage; String? get mutationErrorMessage;
/// Create a copy of HistoryPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryPekerjaanStateCopyWith<HistoryPekerjaanState> get copyWith => _$HistoryPekerjaanStateCopyWithImpl<HistoryPekerjaanState>(this as HistoryPekerjaanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryPekerjaanState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.bids, bids)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(bids),page,hasNext,errorMessage,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'HistoryPekerjaanState(status: $status, bids: $bids, page: $page, hasNext: $hasNext, errorMessage: $errorMessage, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryPekerjaanStateCopyWith<$Res>  {
  factory $HistoryPekerjaanStateCopyWith(HistoryPekerjaanState value, $Res Function(HistoryPekerjaanState) _then) = _$HistoryPekerjaanStateCopyWithImpl;
@useResult
$Res call({
 HistoryPekerjaanStatus status, List<BidEntity> bids, int page, bool hasNext, String? errorMessage, HistoryPekerjaanMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class _$HistoryPekerjaanStateCopyWithImpl<$Res>
    implements $HistoryPekerjaanStateCopyWith<$Res> {
  _$HistoryPekerjaanStateCopyWithImpl(this._self, this._then);

  final HistoryPekerjaanState _self;
  final $Res Function(HistoryPekerjaanState) _then;

/// Create a copy of HistoryPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? bids = null,Object? page = null,Object? hasNext = null,Object? errorMessage = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaanStatus,bids: null == bids ? _self.bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaanMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryPekerjaanState].
extension HistoryPekerjaanStatePatterns on HistoryPekerjaanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryPekerjaanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryPekerjaanState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryPekerjaanState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryPekerjaanState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryPekerjaanState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryPekerjaanState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryPekerjaanStatus status,  List<BidEntity> bids,  int page,  bool hasNext,  String? errorMessage,  HistoryPekerjaanMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryPekerjaanState() when $default != null:
return $default(_that.status,_that.bids,_that.page,_that.hasNext,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryPekerjaanStatus status,  List<BidEntity> bids,  int page,  bool hasNext,  String? errorMessage,  HistoryPekerjaanMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryPekerjaanState():
return $default(_that.status,_that.bids,_that.page,_that.hasNext,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryPekerjaanStatus status,  List<BidEntity> bids,  int page,  bool hasNext,  String? errorMessage,  HistoryPekerjaanMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryPekerjaanState() when $default != null:
return $default(_that.status,_that.bids,_that.page,_that.hasNext,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryPekerjaanState implements HistoryPekerjaanState {
  const _HistoryPekerjaanState({this.status = HistoryPekerjaanStatus.initial, final  List<BidEntity> bids = const [], this.page = 1, this.hasNext = true, this.errorMessage, this.mutationStatus = HistoryPekerjaanMutationStatus.initial, this.mutationSuccessMessage, this.mutationErrorMessage}): _bids = bids;
  

@override@JsonKey() final  HistoryPekerjaanStatus status;
 final  List<BidEntity> _bids;
@override@JsonKey() List<BidEntity> get bids {
  if (_bids is EqualUnmodifiableListView) return _bids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bids);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasNext;
@override final  String? errorMessage;
// Mutation states (Tandai Selesai & Beri Rating)
@override@JsonKey() final  HistoryPekerjaanMutationStatus mutationStatus;
@override final  String? mutationSuccessMessage;
@override final  String? mutationErrorMessage;

/// Create a copy of HistoryPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryPekerjaanStateCopyWith<_HistoryPekerjaanState> get copyWith => __$HistoryPekerjaanStateCopyWithImpl<_HistoryPekerjaanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryPekerjaanState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._bids, _bids)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_bids),page,hasNext,errorMessage,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'HistoryPekerjaanState(status: $status, bids: $bids, page: $page, hasNext: $hasNext, errorMessage: $errorMessage, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryPekerjaanStateCopyWith<$Res> implements $HistoryPekerjaanStateCopyWith<$Res> {
  factory _$HistoryPekerjaanStateCopyWith(_HistoryPekerjaanState value, $Res Function(_HistoryPekerjaanState) _then) = __$HistoryPekerjaanStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryPekerjaanStatus status, List<BidEntity> bids, int page, bool hasNext, String? errorMessage, HistoryPekerjaanMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class __$HistoryPekerjaanStateCopyWithImpl<$Res>
    implements _$HistoryPekerjaanStateCopyWith<$Res> {
  __$HistoryPekerjaanStateCopyWithImpl(this._self, this._then);

  final _HistoryPekerjaanState _self;
  final $Res Function(_HistoryPekerjaanState) _then;

/// Create a copy of HistoryPekerjaanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? bids = null,Object? page = null,Object? hasNext = null,Object? errorMessage = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_HistoryPekerjaanState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaanStatus,bids: null == bids ? _self._bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaanMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
