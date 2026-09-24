// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_listing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerListingState {

 List<WorkerModel> get workers; bool get isLoading; bool get isFailure; String? get errorMessage; String get jobCountDisplayText; String get locationDisplayText; String? get searchQuery; int get distanceKm; bool get isDistanceFilterApplied; WorkerSortOption? get appliedSortOption; bool get isSortFilterApplied;/// Koordinat device saat ini (F-1/F-2) — `null` bila GPS belum
/// tersedia/ditolak. Disimpan di state (bukan parameter method) supaya
/// pemanggilan ulang `loadWorkers()` (filter/sort/refresh) tetap
/// memakai koordinat terakhir, bukan default (0.0, 0.0).
 double? get latitude; double? get longitude;
/// Create a copy of WorkerListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerListingStateCopyWith<WorkerListingState> get copyWith => _$WorkerListingStateCopyWithImpl<WorkerListingState>(this as WorkerListingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerListingState&&const DeepCollectionEquality().equals(other.workers, workers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.jobCountDisplayText, jobCountDisplayText) || other.jobCountDisplayText == jobCountDisplayText)&&(identical(other.locationDisplayText, locationDisplayText) || other.locationDisplayText == locationDisplayText)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.isDistanceFilterApplied, isDistanceFilterApplied) || other.isDistanceFilterApplied == isDistanceFilterApplied)&&(identical(other.appliedSortOption, appliedSortOption) || other.appliedSortOption == appliedSortOption)&&(identical(other.isSortFilterApplied, isSortFilterApplied) || other.isSortFilterApplied == isSortFilterApplied)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(workers),isLoading,isFailure,errorMessage,jobCountDisplayText,locationDisplayText,searchQuery,distanceKm,isDistanceFilterApplied,appliedSortOption,isSortFilterApplied,latitude,longitude);

@override
String toString() {
  return 'WorkerListingState(workers: $workers, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, jobCountDisplayText: $jobCountDisplayText, locationDisplayText: $locationDisplayText, searchQuery: $searchQuery, distanceKm: $distanceKm, isDistanceFilterApplied: $isDistanceFilterApplied, appliedSortOption: $appliedSortOption, isSortFilterApplied: $isSortFilterApplied, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $WorkerListingStateCopyWith<$Res>  {
  factory $WorkerListingStateCopyWith(WorkerListingState value, $Res Function(WorkerListingState) _then) = _$WorkerListingStateCopyWithImpl;
@useResult
$Res call({
 List<WorkerModel> workers, bool isLoading, bool isFailure, String? errorMessage, String jobCountDisplayText, String locationDisplayText, String? searchQuery, int distanceKm, bool isDistanceFilterApplied, WorkerSortOption? appliedSortOption, bool isSortFilterApplied, double? latitude, double? longitude
});




}
/// @nodoc
class _$WorkerListingStateCopyWithImpl<$Res>
    implements $WorkerListingStateCopyWith<$Res> {
  _$WorkerListingStateCopyWithImpl(this._self, this._then);

  final WorkerListingState _self;
  final $Res Function(WorkerListingState) _then;

/// Create a copy of WorkerListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workers = null,Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? jobCountDisplayText = null,Object? locationDisplayText = null,Object? searchQuery = freezed,Object? distanceKm = null,Object? isDistanceFilterApplied = null,Object? appliedSortOption = freezed,Object? isSortFilterApplied = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
workers: null == workers ? _self.workers : workers // ignore: cast_nullable_to_non_nullable
as List<WorkerModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,jobCountDisplayText: null == jobCountDisplayText ? _self.jobCountDisplayText : jobCountDisplayText // ignore: cast_nullable_to_non_nullable
as String,locationDisplayText: null == locationDisplayText ? _self.locationDisplayText : locationDisplayText // ignore: cast_nullable_to_non_nullable
as String,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as int,isDistanceFilterApplied: null == isDistanceFilterApplied ? _self.isDistanceFilterApplied : isDistanceFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,appliedSortOption: freezed == appliedSortOption ? _self.appliedSortOption : appliedSortOption // ignore: cast_nullable_to_non_nullable
as WorkerSortOption?,isSortFilterApplied: null == isSortFilterApplied ? _self.isSortFilterApplied : isSortFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerListingState].
extension WorkerListingStatePatterns on WorkerListingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerListingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerListingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerListingState value)  $default,){
final _that = this;
switch (_that) {
case _WorkerListingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerListingState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerListingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkerModel> workers,  bool isLoading,  bool isFailure,  String? errorMessage,  String jobCountDisplayText,  String locationDisplayText,  String? searchQuery,  int distanceKm,  bool isDistanceFilterApplied,  WorkerSortOption? appliedSortOption,  bool isSortFilterApplied,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerListingState() when $default != null:
return $default(_that.workers,_that.isLoading,_that.isFailure,_that.errorMessage,_that.jobCountDisplayText,_that.locationDisplayText,_that.searchQuery,_that.distanceKm,_that.isDistanceFilterApplied,_that.appliedSortOption,_that.isSortFilterApplied,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkerModel> workers,  bool isLoading,  bool isFailure,  String? errorMessage,  String jobCountDisplayText,  String locationDisplayText,  String? searchQuery,  int distanceKm,  bool isDistanceFilterApplied,  WorkerSortOption? appliedSortOption,  bool isSortFilterApplied,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _WorkerListingState():
return $default(_that.workers,_that.isLoading,_that.isFailure,_that.errorMessage,_that.jobCountDisplayText,_that.locationDisplayText,_that.searchQuery,_that.distanceKm,_that.isDistanceFilterApplied,_that.appliedSortOption,_that.isSortFilterApplied,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkerModel> workers,  bool isLoading,  bool isFailure,  String? errorMessage,  String jobCountDisplayText,  String locationDisplayText,  String? searchQuery,  int distanceKm,  bool isDistanceFilterApplied,  WorkerSortOption? appliedSortOption,  bool isSortFilterApplied,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _WorkerListingState() when $default != null:
return $default(_that.workers,_that.isLoading,_that.isFailure,_that.errorMessage,_that.jobCountDisplayText,_that.locationDisplayText,_that.searchQuery,_that.distanceKm,_that.isDistanceFilterApplied,_that.appliedSortOption,_that.isSortFilterApplied,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerListingState implements WorkerListingState {
  const _WorkerListingState({final  List<WorkerModel> workers = const [], this.isLoading = false, this.isFailure = false, this.errorMessage, this.jobCountDisplayText = 'Memuat...', this.locationDisplayText = 'Radius 2 km', this.searchQuery, this.distanceKm = 2, this.isDistanceFilterApplied = false, this.appliedSortOption, this.isSortFilterApplied = false, this.latitude, this.longitude}): _workers = workers;
  

 final  List<WorkerModel> _workers;
@override@JsonKey() List<WorkerModel> get workers {
  if (_workers is EqualUnmodifiableListView) return _workers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workers);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFailure;
@override final  String? errorMessage;
@override@JsonKey() final  String jobCountDisplayText;
@override@JsonKey() final  String locationDisplayText;
@override final  String? searchQuery;
@override@JsonKey() final  int distanceKm;
@override@JsonKey() final  bool isDistanceFilterApplied;
@override final  WorkerSortOption? appliedSortOption;
@override@JsonKey() final  bool isSortFilterApplied;
/// Koordinat device saat ini (F-1/F-2) — `null` bila GPS belum
/// tersedia/ditolak. Disimpan di state (bukan parameter method) supaya
/// pemanggilan ulang `loadWorkers()` (filter/sort/refresh) tetap
/// memakai koordinat terakhir, bukan default (0.0, 0.0).
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of WorkerListingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerListingStateCopyWith<_WorkerListingState> get copyWith => __$WorkerListingStateCopyWithImpl<_WorkerListingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerListingState&&const DeepCollectionEquality().equals(other._workers, _workers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailure, isFailure) || other.isFailure == isFailure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.jobCountDisplayText, jobCountDisplayText) || other.jobCountDisplayText == jobCountDisplayText)&&(identical(other.locationDisplayText, locationDisplayText) || other.locationDisplayText == locationDisplayText)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.isDistanceFilterApplied, isDistanceFilterApplied) || other.isDistanceFilterApplied == isDistanceFilterApplied)&&(identical(other.appliedSortOption, appliedSortOption) || other.appliedSortOption == appliedSortOption)&&(identical(other.isSortFilterApplied, isSortFilterApplied) || other.isSortFilterApplied == isSortFilterApplied)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workers),isLoading,isFailure,errorMessage,jobCountDisplayText,locationDisplayText,searchQuery,distanceKm,isDistanceFilterApplied,appliedSortOption,isSortFilterApplied,latitude,longitude);

@override
String toString() {
  return 'WorkerListingState(workers: $workers, isLoading: $isLoading, isFailure: $isFailure, errorMessage: $errorMessage, jobCountDisplayText: $jobCountDisplayText, locationDisplayText: $locationDisplayText, searchQuery: $searchQuery, distanceKm: $distanceKm, isDistanceFilterApplied: $isDistanceFilterApplied, appliedSortOption: $appliedSortOption, isSortFilterApplied: $isSortFilterApplied, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$WorkerListingStateCopyWith<$Res> implements $WorkerListingStateCopyWith<$Res> {
  factory _$WorkerListingStateCopyWith(_WorkerListingState value, $Res Function(_WorkerListingState) _then) = __$WorkerListingStateCopyWithImpl;
@override @useResult
$Res call({
 List<WorkerModel> workers, bool isLoading, bool isFailure, String? errorMessage, String jobCountDisplayText, String locationDisplayText, String? searchQuery, int distanceKm, bool isDistanceFilterApplied, WorkerSortOption? appliedSortOption, bool isSortFilterApplied, double? latitude, double? longitude
});




}
/// @nodoc
class __$WorkerListingStateCopyWithImpl<$Res>
    implements _$WorkerListingStateCopyWith<$Res> {
  __$WorkerListingStateCopyWithImpl(this._self, this._then);

  final _WorkerListingState _self;
  final $Res Function(_WorkerListingState) _then;

/// Create a copy of WorkerListingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workers = null,Object? isLoading = null,Object? isFailure = null,Object? errorMessage = freezed,Object? jobCountDisplayText = null,Object? locationDisplayText = null,Object? searchQuery = freezed,Object? distanceKm = null,Object? isDistanceFilterApplied = null,Object? appliedSortOption = freezed,Object? isSortFilterApplied = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_WorkerListingState(
workers: null == workers ? _self._workers : workers // ignore: cast_nullable_to_non_nullable
as List<WorkerModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailure: null == isFailure ? _self.isFailure : isFailure // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,jobCountDisplayText: null == jobCountDisplayText ? _self.jobCountDisplayText : jobCountDisplayText // ignore: cast_nullable_to_non_nullable
as String,locationDisplayText: null == locationDisplayText ? _self.locationDisplayText : locationDisplayText // ignore: cast_nullable_to_non_nullable
as String,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as int,isDistanceFilterApplied: null == isDistanceFilterApplied ? _self.isDistanceFilterApplied : isDistanceFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,appliedSortOption: freezed == appliedSortOption ? _self.appliedSortOption : appliedSortOption // ignore: cast_nullable_to_non_nullable
as WorkerSortOption?,isSortFilterApplied: null == isSortFilterApplied ? _self.isSortFilterApplied : isSortFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
