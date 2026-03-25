// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobsResultEntity {

/// List of job entities
 List<JobEntity> get jobs;/// Pagination metadata
 PaginationEntity get pagination;
/// Create a copy of JobsResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobsResultEntityCopyWith<JobsResultEntity> get copyWith => _$JobsResultEntityCopyWithImpl<JobsResultEntity>(this as JobsResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsResultEntity&&const DeepCollectionEquality().equals(other.jobs, jobs)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(jobs),pagination);

@override
String toString() {
  return 'JobsResultEntity(jobs: $jobs, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $JobsResultEntityCopyWith<$Res>  {
  factory $JobsResultEntityCopyWith(JobsResultEntity value, $Res Function(JobsResultEntity) _then) = _$JobsResultEntityCopyWithImpl;
@useResult
$Res call({
 List<JobEntity> jobs, PaginationEntity pagination
});


$PaginationEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class _$JobsResultEntityCopyWithImpl<$Res>
    implements $JobsResultEntityCopyWith<$Res> {
  _$JobsResultEntityCopyWithImpl(this._self, this._then);

  final JobsResultEntity _self;
  final $Res Function(JobsResultEntity) _then;

/// Create a copy of JobsResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobs = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationEntity,
  ));
}
/// Create a copy of JobsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationEntityCopyWith<$Res> get pagination {
  
  return $PaginationEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobsResultEntity].
extension JobsResultEntityPatterns on JobsResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobsResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobsResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobsResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _JobsResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobsResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _JobsResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JobEntity> jobs,  PaginationEntity pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobsResultEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JobEntity> jobs,  PaginationEntity pagination)  $default,) {final _that = this;
switch (_that) {
case _JobsResultEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JobEntity> jobs,  PaginationEntity pagination)?  $default,) {final _that = this;
switch (_that) {
case _JobsResultEntity() when $default != null:
return $default(_that.jobs,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _JobsResultEntity extends JobsResultEntity {
  const _JobsResultEntity({required final  List<JobEntity> jobs, required this.pagination}): _jobs = jobs,super._();
  

/// List of job entities
 final  List<JobEntity> _jobs;
/// List of job entities
@override List<JobEntity> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

/// Pagination metadata
@override final  PaginationEntity pagination;

/// Create a copy of JobsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobsResultEntityCopyWith<_JobsResultEntity> get copyWith => __$JobsResultEntityCopyWithImpl<_JobsResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobsResultEntity&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jobs),pagination);

@override
String toString() {
  return 'JobsResultEntity(jobs: $jobs, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$JobsResultEntityCopyWith<$Res> implements $JobsResultEntityCopyWith<$Res> {
  factory _$JobsResultEntityCopyWith(_JobsResultEntity value, $Res Function(_JobsResultEntity) _then) = __$JobsResultEntityCopyWithImpl;
@override @useResult
$Res call({
 List<JobEntity> jobs, PaginationEntity pagination
});


@override $PaginationEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class __$JobsResultEntityCopyWithImpl<$Res>
    implements _$JobsResultEntityCopyWith<$Res> {
  __$JobsResultEntityCopyWithImpl(this._self, this._then);

  final _JobsResultEntity _self;
  final $Res Function(_JobsResultEntity) _then;

/// Create a copy of JobsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobs = null,Object? pagination = null,}) {
  return _then(_JobsResultEntity(
jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationEntity,
  ));
}

/// Create a copy of JobsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationEntityCopyWith<$Res> get pagination {
  
  return $PaginationEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
