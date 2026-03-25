// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobsResponseModel {

/// List of job models
 List<JobModel> get jobs;/// Pagination metadata
 PaginationModel get pagination;
/// Create a copy of JobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobsResponseModelCopyWith<JobsResponseModel> get copyWith => _$JobsResponseModelCopyWithImpl<JobsResponseModel>(this as JobsResponseModel, _$identity);

  /// Serializes this JobsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsResponseModel&&const DeepCollectionEquality().equals(other.jobs, jobs)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(jobs),pagination);

@override
String toString() {
  return 'JobsResponseModel(jobs: $jobs, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $JobsResponseModelCopyWith<$Res>  {
  factory $JobsResponseModelCopyWith(JobsResponseModel value, $Res Function(JobsResponseModel) _then) = _$JobsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<JobModel> jobs, PaginationModel pagination
});


$PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$JobsResponseModelCopyWithImpl<$Res>
    implements $JobsResponseModelCopyWith<$Res> {
  _$JobsResponseModelCopyWithImpl(this._self, this._then);

  final JobsResponseModel _self;
  final $Res Function(JobsResponseModel) _then;

/// Create a copy of JobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobs = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}
/// Create a copy of JobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobsResponseModel].
extension JobsResponseModelPatterns on JobsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _JobsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JobModel> jobs,  PaginationModel pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobsResponseModel() when $default != null:
return $default(_that.jobs,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JobModel> jobs,  PaginationModel pagination)  $default,) {final _that = this;
switch (_that) {
case _JobsResponseModel():
return $default(_that.jobs,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JobModel> jobs,  PaginationModel pagination)?  $default,) {final _that = this;
switch (_that) {
case _JobsResponseModel() when $default != null:
return $default(_that.jobs,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobsResponseModel extends JobsResponseModel {
  const _JobsResponseModel({required final  List<JobModel> jobs, required this.pagination}): _jobs = jobs,super._();
  factory _JobsResponseModel.fromJson(Map<String, dynamic> json) => _$JobsResponseModelFromJson(json);

/// List of job models
 final  List<JobModel> _jobs;
/// List of job models
@override List<JobModel> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

/// Pagination metadata
@override final  PaginationModel pagination;

/// Create a copy of JobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobsResponseModelCopyWith<_JobsResponseModel> get copyWith => __$JobsResponseModelCopyWithImpl<_JobsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobsResponseModel&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jobs),pagination);

@override
String toString() {
  return 'JobsResponseModel(jobs: $jobs, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$JobsResponseModelCopyWith<$Res> implements $JobsResponseModelCopyWith<$Res> {
  factory _$JobsResponseModelCopyWith(_JobsResponseModel value, $Res Function(_JobsResponseModel) _then) = __$JobsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<JobModel> jobs, PaginationModel pagination
});


@override $PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$JobsResponseModelCopyWithImpl<$Res>
    implements _$JobsResponseModelCopyWith<$Res> {
  __$JobsResponseModelCopyWithImpl(this._self, this._then);

  final _JobsResponseModel _self;
  final $Res Function(_JobsResponseModel) _then;

/// Create a copy of JobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobs = null,Object? pagination = null,}) {
  return _then(_JobsResponseModel(
jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}

/// Create a copy of JobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
