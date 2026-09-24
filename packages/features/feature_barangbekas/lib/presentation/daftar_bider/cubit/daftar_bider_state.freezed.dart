// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daftar_bider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DaftarBiderState {

 DaftarBiderStatus get status; List<BiderEntity> get biderList; String? get errorMessage;// ── Mutation (Setujui / Withdraw) ────────────────────────────────────────
 DaftarBiderMutationStatus get mutationStatus; String? get mutationSuccessMessage; String? get mutationErrorMessage;
/// Create a copy of DaftarBiderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaftarBiderStateCopyWith<DaftarBiderState> get copyWith => _$DaftarBiderStateCopyWithImpl<DaftarBiderState>(this as DaftarBiderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaftarBiderState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.biderList, biderList)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(biderList),errorMessage,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'DaftarBiderState(status: $status, biderList: $biderList, errorMessage: $errorMessage, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $DaftarBiderStateCopyWith<$Res>  {
  factory $DaftarBiderStateCopyWith(DaftarBiderState value, $Res Function(DaftarBiderState) _then) = _$DaftarBiderStateCopyWithImpl;
@useResult
$Res call({
 DaftarBiderStatus status, List<BiderEntity> biderList, String? errorMessage, DaftarBiderMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class _$DaftarBiderStateCopyWithImpl<$Res>
    implements $DaftarBiderStateCopyWith<$Res> {
  _$DaftarBiderStateCopyWithImpl(this._self, this._then);

  final DaftarBiderState _self;
  final $Res Function(DaftarBiderState) _then;

/// Create a copy of DaftarBiderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? biderList = null,Object? errorMessage = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DaftarBiderStatus,biderList: null == biderList ? _self.biderList : biderList // ignore: cast_nullable_to_non_nullable
as List<BiderEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as DaftarBiderMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DaftarBiderState].
extension DaftarBiderStatePatterns on DaftarBiderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DaftarBiderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DaftarBiderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DaftarBiderState value)  $default,){
final _that = this;
switch (_that) {
case _DaftarBiderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DaftarBiderState value)?  $default,){
final _that = this;
switch (_that) {
case _DaftarBiderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DaftarBiderStatus status,  List<BiderEntity> biderList,  String? errorMessage,  DaftarBiderMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DaftarBiderState() when $default != null:
return $default(_that.status,_that.biderList,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DaftarBiderStatus status,  List<BiderEntity> biderList,  String? errorMessage,  DaftarBiderMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _DaftarBiderState():
return $default(_that.status,_that.biderList,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DaftarBiderStatus status,  List<BiderEntity> biderList,  String? errorMessage,  DaftarBiderMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DaftarBiderState() when $default != null:
return $default(_that.status,_that.biderList,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DaftarBiderState implements DaftarBiderState {
  const _DaftarBiderState({this.status = DaftarBiderStatus.initial, final  List<BiderEntity> biderList = const [], this.errorMessage, this.mutationStatus = DaftarBiderMutationStatus.initial, this.mutationSuccessMessage, this.mutationErrorMessage}): _biderList = biderList;
  

@override@JsonKey() final  DaftarBiderStatus status;
 final  List<BiderEntity> _biderList;
@override@JsonKey() List<BiderEntity> get biderList {
  if (_biderList is EqualUnmodifiableListView) return _biderList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biderList);
}

@override final  String? errorMessage;
// ── Mutation (Setujui / Withdraw) ────────────────────────────────────────
@override@JsonKey() final  DaftarBiderMutationStatus mutationStatus;
@override final  String? mutationSuccessMessage;
@override final  String? mutationErrorMessage;

/// Create a copy of DaftarBiderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaftarBiderStateCopyWith<_DaftarBiderState> get copyWith => __$DaftarBiderStateCopyWithImpl<_DaftarBiderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaftarBiderState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._biderList, _biderList)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_biderList),errorMessage,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'DaftarBiderState(status: $status, biderList: $biderList, errorMessage: $errorMessage, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$DaftarBiderStateCopyWith<$Res> implements $DaftarBiderStateCopyWith<$Res> {
  factory _$DaftarBiderStateCopyWith(_DaftarBiderState value, $Res Function(_DaftarBiderState) _then) = __$DaftarBiderStateCopyWithImpl;
@override @useResult
$Res call({
 DaftarBiderStatus status, List<BiderEntity> biderList, String? errorMessage, DaftarBiderMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
});




}
/// @nodoc
class __$DaftarBiderStateCopyWithImpl<$Res>
    implements _$DaftarBiderStateCopyWith<$Res> {
  __$DaftarBiderStateCopyWithImpl(this._self, this._then);

  final _DaftarBiderState _self;
  final $Res Function(_DaftarBiderState) _then;

/// Create a copy of DaftarBiderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? biderList = null,Object? errorMessage = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_DaftarBiderState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DaftarBiderStatus,biderList: null == biderList ? _self._biderList : biderList // ignore: cast_nullable_to_non_nullable
as List<BiderEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as DaftarBiderMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
