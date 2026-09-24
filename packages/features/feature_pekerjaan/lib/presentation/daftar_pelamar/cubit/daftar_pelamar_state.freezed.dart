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

 DaftarPelamarStatus get status; List<LamaranEntity> get allLamaran; String? get errorMessage;// ── Mutation (Terima / Tolak / Batalkan) ──────────────────────────────────
 DaftarPelamarMutationStatus get mutationStatus; String? get mutationSuccessMessage; String? get mutationErrorMessage;
/// Create a copy of DaftarPelamarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaftarPelamarStateCopyWith<DaftarPelamarState> get copyWith => _$DaftarPelamarStateCopyWithImpl<DaftarPelamarState>(this as DaftarPelamarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaftarPelamarState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.allLamaran, allLamaran)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(allLamaran),errorMessage,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'DaftarPelamarState(status: $status, allLamaran: $allLamaran, errorMessage: $errorMessage, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $DaftarPelamarStateCopyWith<$Res>  {
  factory $DaftarPelamarStateCopyWith(DaftarPelamarState value, $Res Function(DaftarPelamarState) _then) = _$DaftarPelamarStateCopyWithImpl;
@useResult
$Res call({
 DaftarPelamarStatus status, List<LamaranEntity> allLamaran, String? errorMessage, DaftarPelamarMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? allLamaran = null,Object? errorMessage = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DaftarPelamarStatus,allLamaran: null == allLamaran ? _self.allLamaran : allLamaran // ignore: cast_nullable_to_non_nullable
as List<LamaranEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DaftarPelamarStatus status,  List<LamaranEntity> allLamaran,  String? errorMessage,  DaftarPelamarMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DaftarPelamarState() when $default != null:
return $default(_that.status,_that.allLamaran,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DaftarPelamarStatus status,  List<LamaranEntity> allLamaran,  String? errorMessage,  DaftarPelamarMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _DaftarPelamarState():
return $default(_that.status,_that.allLamaran,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DaftarPelamarStatus status,  List<LamaranEntity> allLamaran,  String? errorMessage,  DaftarPelamarMutationStatus mutationStatus,  String? mutationSuccessMessage,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DaftarPelamarState() when $default != null:
return $default(_that.status,_that.allLamaran,_that.errorMessage,_that.mutationStatus,_that.mutationSuccessMessage,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DaftarPelamarState extends DaftarPelamarState {
  const _DaftarPelamarState({this.status = DaftarPelamarStatus.initial, final  List<LamaranEntity> allLamaran = const [], this.errorMessage, this.mutationStatus = DaftarPelamarMutationStatus.initial, this.mutationSuccessMessage, this.mutationErrorMessage}): _allLamaran = allLamaran,super._();
  

@override@JsonKey() final  DaftarPelamarStatus status;
 final  List<LamaranEntity> _allLamaran;
@override@JsonKey() List<LamaranEntity> get allLamaran {
  if (_allLamaran is EqualUnmodifiableListView) return _allLamaran;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allLamaran);
}

@override final  String? errorMessage;
// ── Mutation (Terima / Tolak / Batalkan) ──────────────────────────────────
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaftarPelamarState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._allLamaran, _allLamaran)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_allLamaran),errorMessage,mutationStatus,mutationSuccessMessage,mutationErrorMessage);

@override
String toString() {
  return 'DaftarPelamarState(status: $status, allLamaran: $allLamaran, errorMessage: $errorMessage, mutationStatus: $mutationStatus, mutationSuccessMessage: $mutationSuccessMessage, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$DaftarPelamarStateCopyWith<$Res> implements $DaftarPelamarStateCopyWith<$Res> {
  factory _$DaftarPelamarStateCopyWith(_DaftarPelamarState value, $Res Function(_DaftarPelamarState) _then) = __$DaftarPelamarStateCopyWithImpl;
@override @useResult
$Res call({
 DaftarPelamarStatus status, List<LamaranEntity> allLamaran, String? errorMessage, DaftarPelamarMutationStatus mutationStatus, String? mutationSuccessMessage, String? mutationErrorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? allLamaran = null,Object? errorMessage = freezed,Object? mutationStatus = null,Object? mutationSuccessMessage = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_DaftarPelamarState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DaftarPelamarStatus,allLamaran: null == allLamaran ? _self._allLamaran : allLamaran // ignore: cast_nullable_to_non_nullable
as List<LamaranEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as DaftarPelamarMutationStatus,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
