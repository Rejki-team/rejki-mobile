// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_listing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingListingState {

 List<TrainingModel> get trainings; bool get isLoading; bool get isFailure; String? get errorMessage; String get summaryDisplayText; String get locationDisplayText;
/// Create a copy of TrainingListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingListingStateCopyWith<TrainingListingState> get copyWith => _$TrainingListingStateCopyWithImpl<TrainingListingState>(this as TrainingListingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingListingState&&const DeepCollectionEquality().equals(other.trainings, trainings)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.summaryDisplayText, summaryDisplayText) || other.summaryDisplayText == summaryDisplayText)&&(identical(other.locationDisplayText, locationDisplayText) || other.locationDisplayText == locationDisplayText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(trainings),isLoading,isFailure,errorMessage,summaryDisplayText,locationDisplayText);

@override
String toString() {
  return 'TrainingListingState(trainings: $trainings, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, summaryDisplayText: $summaryDisplayText, locationDisplayText: $locationDisplayText)';
}


}

/// @nodoc
abstract mixin class $TrainingListingStateCopyWith<$Res>  {
  factory $TrainingListingStateCopyWith(TrainingListingState value, $Res Function(TrainingListingState) _then) = _$TrainingListingStateCopyWithImpl;
@useResult
$Res call({
 List<TrainingModel> trainings, bool isLoading, bool isFailure, String? errorMessage, String summaryDisplayText, String locationDisplayText
});




}
/// @nodoc
class _$TrainingListingStateCopyWithImpl<$Res>
    implements $TrainingListingStateCopyWith<$Res> {
  _$TrainingListingStateCopyWithImpl(this._self, this._then);

  final TrainingListingState _self;
  final $Res Function(TrainingListingState) _then;

/// Create a copy of TrainingListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainings = null,Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? summaryDisplayText = null,Object? locationDisplayText = null,}) {
  return _then(_self.copyWith(
trainings: null == trainings ? _self.trainings : trainings // ignore: cast_nullable_to_non_nullable
as List<TrainingModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,summaryDisplayText: null == summaryDisplayText ? _self.summaryDisplayText : summaryDisplayText // ignore: cast_nullable_to_non_nullable
as String,locationDisplayText: null == locationDisplayText ? _self.locationDisplayText : locationDisplayText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingListingState].
extension TrainingListingStatePatterns on TrainingListingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingListingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingListingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingListingState value)  $default,){
final _that = this;
switch (_that) {
case _TrainingListingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingListingState value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingListingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrainingModel> trainings,  bool isLoading,  bool isFailure,  String? errorMessage,  String summaryDisplayText,  String locationDisplayText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingListingState() when $default != null:
return $default(_that.trainings,_that.isLoading,_that.isFailure,_that.errorMessage,_that.summaryDisplayText,_that.locationDisplayText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrainingModel> trainings,  bool isLoading,  bool isFailure,  String? errorMessage,  String summaryDisplayText,  String locationDisplayText)  $default,) {final _that = this;
switch (_that) {
case _TrainingListingState():
return $default(_that.trainings,_that.isLoading,_that.isFailure,_that.errorMessage,_that.summaryDisplayText,_that.locationDisplayText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrainingModel> trainings,  bool isLoading,  bool isFailure,  String? errorMessage,  String summaryDisplayText,  String locationDisplayText)?  $default,) {final _that = this;
switch (_that) {
case _TrainingListingState() when $default != null:
return $default(_that.trainings,_that.isLoading,_that.isFailure,_that.errorMessage,_that.summaryDisplayText,_that.locationDisplayText);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingListingState implements TrainingListingState {
  const _TrainingListingState({final  List<TrainingModel> trainings = const [], this.isLoading = true, this.isFailure = false, this.errorMessage, this.summaryDisplayText = '16 Pelatihan tersedia', this.locationDisplayText = 'Bekasi - 2 km'}): _trainings = trainings;
  

 final  List<TrainingModel> _trainings;
@override@JsonKey() List<TrainingModel> get trainings {
  if (_trainings is EqualUnmodifiableListView) return _trainings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainings);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFailure;
@override final  String? errorMessage;
@override@JsonKey() final  String summaryDisplayText;
@override@JsonKey() final  String locationDisplayText;

/// Create a copy of TrainingListingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingListingStateCopyWith<_TrainingListingState> get copyWith => __$TrainingListingStateCopyWithImpl<_TrainingListingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingListingState&&const DeepCollectionEquality().equals(other._trainings, _trainings)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.summaryDisplayText, summaryDisplayText) || other.summaryDisplayText == summaryDisplayText)&&(identical(other.locationDisplayText, locationDisplayText) || other.locationDisplayText == locationDisplayText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trainings),isLoading,isFailure,errorMessage,summaryDisplayText,locationDisplayText);

@override
String toString() {
  return 'TrainingListingState(trainings: $trainings, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, summaryDisplayText: $summaryDisplayText, locationDisplayText: $locationDisplayText)';
}


}

/// @nodoc
abstract mixin class _$TrainingListingStateCopyWith<$Res> implements $TrainingListingStateCopyWith<$Res> {
  factory _$TrainingListingStateCopyWith(_TrainingListingState value, $Res Function(_TrainingListingState) _then) = __$TrainingListingStateCopyWithImpl;
@override @useResult
$Res call({
 List<TrainingModel> trainings, bool isLoading, bool isFailure, String? errorMessage, String summaryDisplayText, String locationDisplayText
});




}
/// @nodoc
class __$TrainingListingStateCopyWithImpl<$Res>
    implements _$TrainingListingStateCopyWith<$Res> {
  __$TrainingListingStateCopyWithImpl(this._self, this._then);

  final _TrainingListingState _self;
  final $Res Function(_TrainingListingState) _then;

/// Create a copy of TrainingListingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainings = null,Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? summaryDisplayText = null,Object? locationDisplayText = null,}) {
  return _then(_TrainingListingState(
trainings: null == trainings ? _self._trainings : trainings // ignore: cast_nullable_to_non_nullable
as List<TrainingModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,summaryDisplayText: null == summaryDisplayText ? _self.summaryDisplayText : summaryDisplayText // ignore: cast_nullable_to_non_nullable
as String,locationDisplayText: null == locationDisplayText ? _self.locationDisplayText : locationDisplayText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
