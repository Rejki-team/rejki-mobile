// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingDetailState {

 TrainingDetailModel? get training; bool get isLoading; bool get isFailure; String? get errorMessage; bool get isRegistering; bool get isRegistrationSuccess; bool get isOwner;
/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingDetailStateCopyWith<TrainingDetailState> get copyWith => _$TrainingDetailStateCopyWithImpl<TrainingDetailState>(this as TrainingDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingDetailState&&(identical(other.training, training) || other.training == training)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isRegistering, isRegistering) || other.isRegistering == isRegistering)&&(identical(other.isRegistrationSuccess, isRegistrationSuccess) || other.isRegistrationSuccess == isRegistrationSuccess)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner));
}


@override
int get hashCode => Object.hash(runtimeType,training,isLoading,isFailure,errorMessage,isRegistering,isRegistrationSuccess,isOwner);

@override
String toString() {
  return 'TrainingDetailState(training: $training, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, isRegistering: $isRegistering, isRegistrationSuccess: $isRegistrationSuccess, isOwner: $isOwner)';
}


}

/// @nodoc
abstract mixin class $TrainingDetailStateCopyWith<$Res>  {
  factory $TrainingDetailStateCopyWith(TrainingDetailState value, $Res Function(TrainingDetailState) _then) = _$TrainingDetailStateCopyWithImpl;
@useResult
$Res call({
 TrainingDetailModel? training, bool isLoading, bool isFailure, String? errorMessage, bool isRegistering, bool isRegistrationSuccess, bool isOwner
});


$TrainingDetailModelCopyWith<$Res>? get training;

}
/// @nodoc
class _$TrainingDetailStateCopyWithImpl<$Res>
    implements $TrainingDetailStateCopyWith<$Res> {
  _$TrainingDetailStateCopyWithImpl(this._self, this._then);

  final TrainingDetailState _self;
  final $Res Function(TrainingDetailState) _then;

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? training = freezed,Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? isRegistering = null,Object? isRegistrationSuccess = null,Object? isOwner = null,}) {
  return _then(_self.copyWith(
training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as TrainingDetailModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isRegistering: null == isRegistering ? _self.isRegistering : isRegistering // ignore: cast_nullable_to_non_nullable
as bool,isRegistrationSuccess: null == isRegistrationSuccess ? _self.isRegistrationSuccess : isRegistrationSuccess // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingDetailModelCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingDetailModelCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainingDetailState].
extension TrainingDetailStatePatterns on TrainingDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TrainingDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TrainingDetailModel? training,  bool isLoading,  bool isFailure,  String? errorMessage,  bool isRegistering,  bool isRegistrationSuccess,  bool isOwner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingDetailState() when $default != null:
return $default(_that.training,_that.isLoading,_that.isFailure,_that.errorMessage,_that.isRegistering,_that.isRegistrationSuccess,_that.isOwner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TrainingDetailModel? training,  bool isLoading,  bool isFailure,  String? errorMessage,  bool isRegistering,  bool isRegistrationSuccess,  bool isOwner)  $default,) {final _that = this;
switch (_that) {
case _TrainingDetailState():
return $default(_that.training,_that.isLoading,_that.isFailure,_that.errorMessage,_that.isRegistering,_that.isRegistrationSuccess,_that.isOwner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TrainingDetailModel? training,  bool isLoading,  bool isFailure,  String? errorMessage,  bool isRegistering,  bool isRegistrationSuccess,  bool isOwner)?  $default,) {final _that = this;
switch (_that) {
case _TrainingDetailState() when $default != null:
return $default(_that.training,_that.isLoading,_that.isFailure,_that.errorMessage,_that.isRegistering,_that.isRegistrationSuccess,_that.isOwner);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingDetailState implements TrainingDetailState {
  const _TrainingDetailState({this.training, this.isLoading = true, this.isFailure = false, this.errorMessage, this.isRegistering = false, this.isRegistrationSuccess = false, this.isOwner = false});


@override final  TrainingDetailModel? training;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFailure;
@override final  String? errorMessage;
@override@JsonKey() final  bool isRegistering;
@override@JsonKey() final  bool isRegistrationSuccess;
@override@JsonKey() final  bool isOwner;

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingDetailStateCopyWith<_TrainingDetailState> get copyWith => __$TrainingDetailStateCopyWithImpl<_TrainingDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingDetailState&&(identical(other.training, training) || other.training == training)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isRegistering, isRegistering) || other.isRegistering == isRegistering)&&(identical(other.isRegistrationSuccess, isRegistrationSuccess) || other.isRegistrationSuccess == isRegistrationSuccess)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner));
}


@override
int get hashCode => Object.hash(runtimeType,training,isLoading,isFailure,errorMessage,isRegistering,isRegistrationSuccess,isOwner);

@override
String toString() {
  return 'TrainingDetailState(training: $training, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, isRegistering: $isRegistering, isRegistrationSuccess: $isRegistrationSuccess, isOwner: $isOwner)';
}


}

/// @nodoc
abstract mixin class _$TrainingDetailStateCopyWith<$Res> implements $TrainingDetailStateCopyWith<$Res> {
  factory _$TrainingDetailStateCopyWith(_TrainingDetailState value, $Res Function(_TrainingDetailState) _then) = __$TrainingDetailStateCopyWithImpl;
@override @useResult
$Res call({
 TrainingDetailModel? training, bool isLoading, bool isFailure, String? errorMessage, bool isRegistering, bool isRegistrationSuccess, bool isOwner
});


@override $TrainingDetailModelCopyWith<$Res>? get training;

}
/// @nodoc
class __$TrainingDetailStateCopyWithImpl<$Res>
    implements _$TrainingDetailStateCopyWith<$Res> {
  __$TrainingDetailStateCopyWithImpl(this._self, this._then);

  final _TrainingDetailState _self;
  final $Res Function(_TrainingDetailState) _then;

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? training = freezed,Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? isRegistering = null,Object? isRegistrationSuccess = null,Object? isOwner = null,}) {
  return _then(_TrainingDetailState(
training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as TrainingDetailModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isRegistering: null == isRegistering ? _self.isRegistering : isRegistering // ignore: cast_nullable_to_non_nullable
as bool,isRegistrationSuccess: null == isRegistrationSuccess ? _self.isRegistrationSuccess : isRegistrationSuccess // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingDetailModelCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingDetailModelCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}

// dart format on
