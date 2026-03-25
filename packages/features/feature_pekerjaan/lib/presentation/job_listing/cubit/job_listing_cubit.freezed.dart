// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_listing_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobListingState {

/// Current loading status
 JobListingStatus get status;/// List of jobs
 List<JobEntity> get jobs;/// Search query
 String get searchQuery;/// Current location name for display
 String get locationName;/// Current device latitude (null if unavailable)
 double? get latitude;/// Current device longitude (null if unavailable)
 double? get longitude;/// Distance/radius in KM (0–2, default 2 = max radius / "not applied")
 int get distanceKm;/// Whether the user has explicitly applied a distance filter.
///
/// false = slider renders at max position without the "applied" highlight style.
/// true  = slider renders with the active color, distance chip shows applied.
 bool get isDistanceFilterApplied;/// Sort option — only used when [isSortFilterApplied] is true.
 JobSortOption get sortOption;/// Whether the user has explicitly applied a sort filter.
///
/// false = no radio highlighted in sort sheet; API uses `created_at desc`.
/// true  = radio highlights [sortOption]; API uses mapped sort param.
 bool get isSortFilterApplied;/// Total job count
 int get totalJobs;/// Error message if any
 String? get errorMessage;
/// Create a copy of JobListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobListingStateCopyWith<JobListingState> get copyWith => _$JobListingStateCopyWithImpl<JobListingState>(this as JobListingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobListingState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.jobs, jobs)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.isDistanceFilterApplied, isDistanceFilterApplied) || other.isDistanceFilterApplied == isDistanceFilterApplied)&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption)&&(identical(other.isSortFilterApplied, isSortFilterApplied) || other.isSortFilterApplied == isSortFilterApplied)&&(identical(other.totalJobs, totalJobs) || other.totalJobs == totalJobs)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(jobs),searchQuery,locationName,latitude,longitude,distanceKm,isDistanceFilterApplied,sortOption,isSortFilterApplied,totalJobs,errorMessage);

@override
String toString() {
  return 'JobListingState(status: $status, jobs: $jobs, searchQuery: $searchQuery, locationName: $locationName, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, isDistanceFilterApplied: $isDistanceFilterApplied, sortOption: $sortOption, isSortFilterApplied: $isSortFilterApplied, totalJobs: $totalJobs, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $JobListingStateCopyWith<$Res>  {
  factory $JobListingStateCopyWith(JobListingState value, $Res Function(JobListingState) _then) = _$JobListingStateCopyWithImpl;
@useResult
$Res call({
 JobListingStatus status, List<JobEntity> jobs, String searchQuery, String locationName, double? latitude, double? longitude, int distanceKm, bool isDistanceFilterApplied, JobSortOption sortOption, bool isSortFilterApplied, int totalJobs, String? errorMessage
});




}
/// @nodoc
class _$JobListingStateCopyWithImpl<$Res>
    implements $JobListingStateCopyWith<$Res> {
  _$JobListingStateCopyWithImpl(this._self, this._then);

  final JobListingState _self;
  final $Res Function(JobListingState) _then;

/// Create a copy of JobListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? jobs = null,Object? searchQuery = null,Object? locationName = null,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = null,Object? isDistanceFilterApplied = null,Object? sortOption = null,Object? isSortFilterApplied = null,Object? totalJobs = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JobListingStatus,jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as int,isDistanceFilterApplied: null == isDistanceFilterApplied ? _self.isDistanceFilterApplied : isDistanceFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,sortOption: null == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as JobSortOption,isSortFilterApplied: null == isSortFilterApplied ? _self.isSortFilterApplied : isSortFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,totalJobs: null == totalJobs ? _self.totalJobs : totalJobs // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobListingState].
extension JobListingStatePatterns on JobListingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobListingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobListingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobListingState value)  $default,){
final _that = this;
switch (_that) {
case _JobListingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobListingState value)?  $default,){
final _that = this;
switch (_that) {
case _JobListingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JobListingStatus status,  List<JobEntity> jobs,  String searchQuery,  String locationName,  double? latitude,  double? longitude,  int distanceKm,  bool isDistanceFilterApplied,  JobSortOption sortOption,  bool isSortFilterApplied,  int totalJobs,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobListingState() when $default != null:
return $default(_that.status,_that.jobs,_that.searchQuery,_that.locationName,_that.latitude,_that.longitude,_that.distanceKm,_that.isDistanceFilterApplied,_that.sortOption,_that.isSortFilterApplied,_that.totalJobs,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JobListingStatus status,  List<JobEntity> jobs,  String searchQuery,  String locationName,  double? latitude,  double? longitude,  int distanceKm,  bool isDistanceFilterApplied,  JobSortOption sortOption,  bool isSortFilterApplied,  int totalJobs,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _JobListingState():
return $default(_that.status,_that.jobs,_that.searchQuery,_that.locationName,_that.latitude,_that.longitude,_that.distanceKm,_that.isDistanceFilterApplied,_that.sortOption,_that.isSortFilterApplied,_that.totalJobs,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JobListingStatus status,  List<JobEntity> jobs,  String searchQuery,  String locationName,  double? latitude,  double? longitude,  int distanceKm,  bool isDistanceFilterApplied,  JobSortOption sortOption,  bool isSortFilterApplied,  int totalJobs,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _JobListingState() when $default != null:
return $default(_that.status,_that.jobs,_that.searchQuery,_that.locationName,_that.latitude,_that.longitude,_that.distanceKm,_that.isDistanceFilterApplied,_that.sortOption,_that.isSortFilterApplied,_that.totalJobs,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _JobListingState extends JobListingState {
  const _JobListingState({this.status = JobListingStatus.initial, final  List<JobEntity> jobs = const [], this.searchQuery = '', this.locationName = 'Lokasi Anda', this.latitude, this.longitude, this.distanceKm = 2, this.isDistanceFilterApplied = false, this.sortOption = JobSortOption.nearestDistance, this.isSortFilterApplied = false, this.totalJobs = 0, this.errorMessage}): _jobs = jobs,super._();
  

/// Current loading status
@override@JsonKey() final  JobListingStatus status;
/// List of jobs
 final  List<JobEntity> _jobs;
/// List of jobs
@override@JsonKey() List<JobEntity> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

/// Search query
@override@JsonKey() final  String searchQuery;
/// Current location name for display
@override@JsonKey() final  String locationName;
/// Current device latitude (null if unavailable)
@override final  double? latitude;
/// Current device longitude (null if unavailable)
@override final  double? longitude;
/// Distance/radius in KM (0–2, default 2 = max radius / "not applied")
@override@JsonKey() final  int distanceKm;
/// Whether the user has explicitly applied a distance filter.
///
/// false = slider renders at max position without the "applied" highlight style.
/// true  = slider renders with the active color, distance chip shows applied.
@override@JsonKey() final  bool isDistanceFilterApplied;
/// Sort option — only used when [isSortFilterApplied] is true.
@override@JsonKey() final  JobSortOption sortOption;
/// Whether the user has explicitly applied a sort filter.
///
/// false = no radio highlighted in sort sheet; API uses `created_at desc`.
/// true  = radio highlights [sortOption]; API uses mapped sort param.
@override@JsonKey() final  bool isSortFilterApplied;
/// Total job count
@override@JsonKey() final  int totalJobs;
/// Error message if any
@override final  String? errorMessage;

/// Create a copy of JobListingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobListingStateCopyWith<_JobListingState> get copyWith => __$JobListingStateCopyWithImpl<_JobListingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobListingState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.isDistanceFilterApplied, isDistanceFilterApplied) || other.isDistanceFilterApplied == isDistanceFilterApplied)&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption)&&(identical(other.isSortFilterApplied, isSortFilterApplied) || other.isSortFilterApplied == isSortFilterApplied)&&(identical(other.totalJobs, totalJobs) || other.totalJobs == totalJobs)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_jobs),searchQuery,locationName,latitude,longitude,distanceKm,isDistanceFilterApplied,sortOption,isSortFilterApplied,totalJobs,errorMessage);

@override
String toString() {
  return 'JobListingState(status: $status, jobs: $jobs, searchQuery: $searchQuery, locationName: $locationName, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, isDistanceFilterApplied: $isDistanceFilterApplied, sortOption: $sortOption, isSortFilterApplied: $isSortFilterApplied, totalJobs: $totalJobs, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$JobListingStateCopyWith<$Res> implements $JobListingStateCopyWith<$Res> {
  factory _$JobListingStateCopyWith(_JobListingState value, $Res Function(_JobListingState) _then) = __$JobListingStateCopyWithImpl;
@override @useResult
$Res call({
 JobListingStatus status, List<JobEntity> jobs, String searchQuery, String locationName, double? latitude, double? longitude, int distanceKm, bool isDistanceFilterApplied, JobSortOption sortOption, bool isSortFilterApplied, int totalJobs, String? errorMessage
});




}
/// @nodoc
class __$JobListingStateCopyWithImpl<$Res>
    implements _$JobListingStateCopyWith<$Res> {
  __$JobListingStateCopyWithImpl(this._self, this._then);

  final _JobListingState _self;
  final $Res Function(_JobListingState) _then;

/// Create a copy of JobListingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? jobs = null,Object? searchQuery = null,Object? locationName = null,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = null,Object? isDistanceFilterApplied = null,Object? sortOption = null,Object? isSortFilterApplied = null,Object? totalJobs = null,Object? errorMessage = freezed,}) {
  return _then(_JobListingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JobListingStatus,jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as int,isDistanceFilterApplied: null == isDistanceFilterApplied ? _self.isDistanceFilterApplied : isDistanceFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,sortOption: null == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as JobSortOption,isSortFilterApplied: null == isSortFilterApplied ? _self.isSortFilterApplied : isSortFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,totalJobs: null == totalJobs ? _self.totalJobs : totalJobs // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
