// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdsSummaryModel {

@JsonKey(name: 'total_job_ads') int get totalJobAds;@JsonKey(name: 'total_worker_ads') int get totalWorkerAds;@JsonKey(name: 'total_secondhand_ads') int get totalSecondhandAds;@JsonKey(name: 'total_training_ads') int get totalTrainingAds;@JsonKey(name: 'total_ads') int get totalAds;
/// Create a copy of AdsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdsSummaryModelCopyWith<AdsSummaryModel> get copyWith => _$AdsSummaryModelCopyWithImpl<AdsSummaryModel>(this as AdsSummaryModel, _$identity);

  /// Serializes this AdsSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdsSummaryModel&&(identical(other.totalJobAds, totalJobAds) || other.totalJobAds == totalJobAds)&&(identical(other.totalWorkerAds, totalWorkerAds) || other.totalWorkerAds == totalWorkerAds)&&(identical(other.totalSecondhandAds, totalSecondhandAds) || other.totalSecondhandAds == totalSecondhandAds)&&(identical(other.totalTrainingAds, totalTrainingAds) || other.totalTrainingAds == totalTrainingAds)&&(identical(other.totalAds, totalAds) || other.totalAds == totalAds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalJobAds,totalWorkerAds,totalSecondhandAds,totalTrainingAds,totalAds);

@override
String toString() {
  return 'AdsSummaryModel(totalJobAds: $totalJobAds, totalWorkerAds: $totalWorkerAds, totalSecondhandAds: $totalSecondhandAds, totalTrainingAds: $totalTrainingAds, totalAds: $totalAds)';
}


}

/// @nodoc
abstract mixin class $AdsSummaryModelCopyWith<$Res>  {
  factory $AdsSummaryModelCopyWith(AdsSummaryModel value, $Res Function(AdsSummaryModel) _then) = _$AdsSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_job_ads') int totalJobAds,@JsonKey(name: 'total_worker_ads') int totalWorkerAds,@JsonKey(name: 'total_secondhand_ads') int totalSecondhandAds,@JsonKey(name: 'total_training_ads') int totalTrainingAds,@JsonKey(name: 'total_ads') int totalAds
});




}
/// @nodoc
class _$AdsSummaryModelCopyWithImpl<$Res>
    implements $AdsSummaryModelCopyWith<$Res> {
  _$AdsSummaryModelCopyWithImpl(this._self, this._then);

  final AdsSummaryModel _self;
  final $Res Function(AdsSummaryModel) _then;

/// Create a copy of AdsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalJobAds = null,Object? totalWorkerAds = null,Object? totalSecondhandAds = null,Object? totalTrainingAds = null,Object? totalAds = null,}) {
  return _then(_self.copyWith(
totalJobAds: null == totalJobAds ? _self.totalJobAds : totalJobAds // ignore: cast_nullable_to_non_nullable
as int,totalWorkerAds: null == totalWorkerAds ? _self.totalWorkerAds : totalWorkerAds // ignore: cast_nullable_to_non_nullable
as int,totalSecondhandAds: null == totalSecondhandAds ? _self.totalSecondhandAds : totalSecondhandAds // ignore: cast_nullable_to_non_nullable
as int,totalTrainingAds: null == totalTrainingAds ? _self.totalTrainingAds : totalTrainingAds // ignore: cast_nullable_to_non_nullable
as int,totalAds: null == totalAds ? _self.totalAds : totalAds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdsSummaryModel].
extension AdsSummaryModelPatterns on AdsSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdsSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdsSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdsSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _AdsSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdsSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdsSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_job_ads')  int totalJobAds, @JsonKey(name: 'total_worker_ads')  int totalWorkerAds, @JsonKey(name: 'total_secondhand_ads')  int totalSecondhandAds, @JsonKey(name: 'total_training_ads')  int totalTrainingAds, @JsonKey(name: 'total_ads')  int totalAds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdsSummaryModel() when $default != null:
return $default(_that.totalJobAds,_that.totalWorkerAds,_that.totalSecondhandAds,_that.totalTrainingAds,_that.totalAds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_job_ads')  int totalJobAds, @JsonKey(name: 'total_worker_ads')  int totalWorkerAds, @JsonKey(name: 'total_secondhand_ads')  int totalSecondhandAds, @JsonKey(name: 'total_training_ads')  int totalTrainingAds, @JsonKey(name: 'total_ads')  int totalAds)  $default,) {final _that = this;
switch (_that) {
case _AdsSummaryModel():
return $default(_that.totalJobAds,_that.totalWorkerAds,_that.totalSecondhandAds,_that.totalTrainingAds,_that.totalAds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_job_ads')  int totalJobAds, @JsonKey(name: 'total_worker_ads')  int totalWorkerAds, @JsonKey(name: 'total_secondhand_ads')  int totalSecondhandAds, @JsonKey(name: 'total_training_ads')  int totalTrainingAds, @JsonKey(name: 'total_ads')  int totalAds)?  $default,) {final _that = this;
switch (_that) {
case _AdsSummaryModel() when $default != null:
return $default(_that.totalJobAds,_that.totalWorkerAds,_that.totalSecondhandAds,_that.totalTrainingAds,_that.totalAds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdsSummaryModel implements AdsSummaryModel {
  const _AdsSummaryModel({@JsonKey(name: 'total_job_ads') this.totalJobAds = 0, @JsonKey(name: 'total_worker_ads') this.totalWorkerAds = 0, @JsonKey(name: 'total_secondhand_ads') this.totalSecondhandAds = 0, @JsonKey(name: 'total_training_ads') this.totalTrainingAds = 0, @JsonKey(name: 'total_ads') this.totalAds = 0});
  factory _AdsSummaryModel.fromJson(Map<String, dynamic> json) => _$AdsSummaryModelFromJson(json);

@override@JsonKey(name: 'total_job_ads') final  int totalJobAds;
@override@JsonKey(name: 'total_worker_ads') final  int totalWorkerAds;
@override@JsonKey(name: 'total_secondhand_ads') final  int totalSecondhandAds;
@override@JsonKey(name: 'total_training_ads') final  int totalTrainingAds;
@override@JsonKey(name: 'total_ads') final  int totalAds;

/// Create a copy of AdsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdsSummaryModelCopyWith<_AdsSummaryModel> get copyWith => __$AdsSummaryModelCopyWithImpl<_AdsSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdsSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdsSummaryModel&&(identical(other.totalJobAds, totalJobAds) || other.totalJobAds == totalJobAds)&&(identical(other.totalWorkerAds, totalWorkerAds) || other.totalWorkerAds == totalWorkerAds)&&(identical(other.totalSecondhandAds, totalSecondhandAds) || other.totalSecondhandAds == totalSecondhandAds)&&(identical(other.totalTrainingAds, totalTrainingAds) || other.totalTrainingAds == totalTrainingAds)&&(identical(other.totalAds, totalAds) || other.totalAds == totalAds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalJobAds,totalWorkerAds,totalSecondhandAds,totalTrainingAds,totalAds);

@override
String toString() {
  return 'AdsSummaryModel(totalJobAds: $totalJobAds, totalWorkerAds: $totalWorkerAds, totalSecondhandAds: $totalSecondhandAds, totalTrainingAds: $totalTrainingAds, totalAds: $totalAds)';
}


}

/// @nodoc
abstract mixin class _$AdsSummaryModelCopyWith<$Res> implements $AdsSummaryModelCopyWith<$Res> {
  factory _$AdsSummaryModelCopyWith(_AdsSummaryModel value, $Res Function(_AdsSummaryModel) _then) = __$AdsSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_job_ads') int totalJobAds,@JsonKey(name: 'total_worker_ads') int totalWorkerAds,@JsonKey(name: 'total_secondhand_ads') int totalSecondhandAds,@JsonKey(name: 'total_training_ads') int totalTrainingAds,@JsonKey(name: 'total_ads') int totalAds
});




}
/// @nodoc
class __$AdsSummaryModelCopyWithImpl<$Res>
    implements _$AdsSummaryModelCopyWith<$Res> {
  __$AdsSummaryModelCopyWithImpl(this._self, this._then);

  final _AdsSummaryModel _self;
  final $Res Function(_AdsSummaryModel) _then;

/// Create a copy of AdsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalJobAds = null,Object? totalWorkerAds = null,Object? totalSecondhandAds = null,Object? totalTrainingAds = null,Object? totalAds = null,}) {
  return _then(_AdsSummaryModel(
totalJobAds: null == totalJobAds ? _self.totalJobAds : totalJobAds // ignore: cast_nullable_to_non_nullable
as int,totalWorkerAds: null == totalWorkerAds ? _self.totalWorkerAds : totalWorkerAds // ignore: cast_nullable_to_non_nullable
as int,totalSecondhandAds: null == totalSecondhandAds ? _self.totalSecondhandAds : totalSecondhandAds // ignore: cast_nullable_to_non_nullable
as int,totalTrainingAds: null == totalTrainingAds ? _self.totalTrainingAds : totalTrainingAds // ignore: cast_nullable_to_non_nullable
as int,totalAds: null == totalAds ? _self.totalAds : totalAds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
