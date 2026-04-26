// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_pekerja_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryPekerjaState {

 HistoryPekerjaStatus get status; List<WorkerContactEntity> get contacts; String? get errorMessage;// Pagination
 int get currentPage; bool get hasNext;// Mutation state (for rating/review)
 HistoryPekerjaMutationStatus get mutationStatus; String? get mutationErrorMessage; String? get mutationSuccessMessage;
/// Create a copy of HistoryPekerjaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryPekerjaStateCopyWith<HistoryPekerjaState> get copyWith => _$HistoryPekerjaStateCopyWithImpl<HistoryPekerjaState>(this as HistoryPekerjaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryPekerjaState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(contacts),errorMessage,currentPage,hasNext,mutationStatus,mutationErrorMessage,mutationSuccessMessage);

@override
String toString() {
  return 'HistoryPekerjaState(status: $status, contacts: $contacts, errorMessage: $errorMessage, currentPage: $currentPage, hasNext: $hasNext, mutationStatus: $mutationStatus, mutationErrorMessage: $mutationErrorMessage, mutationSuccessMessage: $mutationSuccessMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryPekerjaStateCopyWith<$Res>  {
  factory $HistoryPekerjaStateCopyWith(HistoryPekerjaState value, $Res Function(HistoryPekerjaState) _then) = _$HistoryPekerjaStateCopyWithImpl;
@useResult
$Res call({
 HistoryPekerjaStatus status, List<WorkerContactEntity> contacts, String? errorMessage, int currentPage, bool hasNext, HistoryPekerjaMutationStatus mutationStatus, String? mutationErrorMessage, String? mutationSuccessMessage
});




}
/// @nodoc
class _$HistoryPekerjaStateCopyWithImpl<$Res>
    implements $HistoryPekerjaStateCopyWith<$Res> {
  _$HistoryPekerjaStateCopyWithImpl(this._self, this._then);

  final HistoryPekerjaState _self;
  final $Res Function(HistoryPekerjaState) _then;

/// Create a copy of HistoryPekerjaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? contacts = null,Object? errorMessage = freezed,Object? currentPage = null,Object? hasNext = null,Object? mutationStatus = null,Object? mutationErrorMessage = freezed,Object? mutationSuccessMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaStatus,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<WorkerContactEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaMutationStatus,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryPekerjaState].
extension HistoryPekerjaStatePatterns on HistoryPekerjaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryPekerjaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryPekerjaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryPekerjaState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryPekerjaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryPekerjaState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryPekerjaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryPekerjaStatus status,  List<WorkerContactEntity> contacts,  String? errorMessage,  int currentPage,  bool hasNext,  HistoryPekerjaMutationStatus mutationStatus,  String? mutationErrorMessage,  String? mutationSuccessMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryPekerjaState() when $default != null:
return $default(_that.status,_that.contacts,_that.errorMessage,_that.currentPage,_that.hasNext,_that.mutationStatus,_that.mutationErrorMessage,_that.mutationSuccessMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryPekerjaStatus status,  List<WorkerContactEntity> contacts,  String? errorMessage,  int currentPage,  bool hasNext,  HistoryPekerjaMutationStatus mutationStatus,  String? mutationErrorMessage,  String? mutationSuccessMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryPekerjaState():
return $default(_that.status,_that.contacts,_that.errorMessage,_that.currentPage,_that.hasNext,_that.mutationStatus,_that.mutationErrorMessage,_that.mutationSuccessMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryPekerjaStatus status,  List<WorkerContactEntity> contacts,  String? errorMessage,  int currentPage,  bool hasNext,  HistoryPekerjaMutationStatus mutationStatus,  String? mutationErrorMessage,  String? mutationSuccessMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryPekerjaState() when $default != null:
return $default(_that.status,_that.contacts,_that.errorMessage,_that.currentPage,_that.hasNext,_that.mutationStatus,_that.mutationErrorMessage,_that.mutationSuccessMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryPekerjaState implements HistoryPekerjaState {
  const _HistoryPekerjaState({this.status = HistoryPekerjaStatus.initial, final  List<WorkerContactEntity> contacts = const [], this.errorMessage, this.currentPage = 1, this.hasNext = true, this.mutationStatus = HistoryPekerjaMutationStatus.initial, this.mutationErrorMessage, this.mutationSuccessMessage}): _contacts = contacts;
  

@override@JsonKey() final  HistoryPekerjaStatus status;
 final  List<WorkerContactEntity> _contacts;
@override@JsonKey() List<WorkerContactEntity> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  String? errorMessage;
// Pagination
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasNext;
// Mutation state (for rating/review)
@override@JsonKey() final  HistoryPekerjaMutationStatus mutationStatus;
@override final  String? mutationErrorMessage;
@override final  String? mutationSuccessMessage;

/// Create a copy of HistoryPekerjaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryPekerjaStateCopyWith<_HistoryPekerjaState> get copyWith => __$HistoryPekerjaStateCopyWithImpl<_HistoryPekerjaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryPekerjaState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage)&&(identical(other.mutationSuccessMessage, mutationSuccessMessage) || other.mutationSuccessMessage == mutationSuccessMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_contacts),errorMessage,currentPage,hasNext,mutationStatus,mutationErrorMessage,mutationSuccessMessage);

@override
String toString() {
  return 'HistoryPekerjaState(status: $status, contacts: $contacts, errorMessage: $errorMessage, currentPage: $currentPage, hasNext: $hasNext, mutationStatus: $mutationStatus, mutationErrorMessage: $mutationErrorMessage, mutationSuccessMessage: $mutationSuccessMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryPekerjaStateCopyWith<$Res> implements $HistoryPekerjaStateCopyWith<$Res> {
  factory _$HistoryPekerjaStateCopyWith(_HistoryPekerjaState value, $Res Function(_HistoryPekerjaState) _then) = __$HistoryPekerjaStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryPekerjaStatus status, List<WorkerContactEntity> contacts, String? errorMessage, int currentPage, bool hasNext, HistoryPekerjaMutationStatus mutationStatus, String? mutationErrorMessage, String? mutationSuccessMessage
});




}
/// @nodoc
class __$HistoryPekerjaStateCopyWithImpl<$Res>
    implements _$HistoryPekerjaStateCopyWith<$Res> {
  __$HistoryPekerjaStateCopyWithImpl(this._self, this._then);

  final _HistoryPekerjaState _self;
  final $Res Function(_HistoryPekerjaState) _then;

/// Create a copy of HistoryPekerjaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? contacts = null,Object? errorMessage = freezed,Object? currentPage = null,Object? hasNext = null,Object? mutationStatus = null,Object? mutationErrorMessage = freezed,Object? mutationSuccessMessage = freezed,}) {
  return _then(_HistoryPekerjaState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaStatus,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<WorkerContactEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as HistoryPekerjaMutationStatus,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationSuccessMessage: freezed == mutationSuccessMessage ? _self.mutationSuccessMessage : mutationSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
