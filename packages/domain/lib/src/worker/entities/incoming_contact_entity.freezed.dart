// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incoming_contact_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncomingContactEmployerEntity {

 String get id; String get fullName;
/// Create a copy of IncomingContactEmployerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomingContactEmployerEntityCopyWith<IncomingContactEmployerEntity> get copyWith => _$IncomingContactEmployerEntityCopyWithImpl<IncomingContactEmployerEntity>(this as IncomingContactEmployerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomingContactEmployerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName);

@override
String toString() {
  return 'IncomingContactEmployerEntity(id: $id, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $IncomingContactEmployerEntityCopyWith<$Res>  {
  factory $IncomingContactEmployerEntityCopyWith(IncomingContactEmployerEntity value, $Res Function(IncomingContactEmployerEntity) _then) = _$IncomingContactEmployerEntityCopyWithImpl;
@useResult
$Res call({
 String id, String fullName
});




}
/// @nodoc
class _$IncomingContactEmployerEntityCopyWithImpl<$Res>
    implements $IncomingContactEmployerEntityCopyWith<$Res> {
  _$IncomingContactEmployerEntityCopyWithImpl(this._self, this._then);

  final IncomingContactEmployerEntity _self;
  final $Res Function(IncomingContactEmployerEntity) _then;

/// Create a copy of IncomingContactEmployerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomingContactEmployerEntity].
extension IncomingContactEmployerEntityPatterns on IncomingContactEmployerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomingContactEmployerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomingContactEmployerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomingContactEmployerEntity value)  $default,){
final _that = this;
switch (_that) {
case _IncomingContactEmployerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomingContactEmployerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IncomingContactEmployerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomingContactEmployerEntity() when $default != null:
return $default(_that.id,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName)  $default,) {final _that = this;
switch (_that) {
case _IncomingContactEmployerEntity():
return $default(_that.id,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _IncomingContactEmployerEntity() when $default != null:
return $default(_that.id,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc


class _IncomingContactEmployerEntity implements IncomingContactEmployerEntity {
  const _IncomingContactEmployerEntity({required this.id, required this.fullName});
  

@override final  String id;
@override final  String fullName;

/// Create a copy of IncomingContactEmployerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomingContactEmployerEntityCopyWith<_IncomingContactEmployerEntity> get copyWith => __$IncomingContactEmployerEntityCopyWithImpl<_IncomingContactEmployerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomingContactEmployerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName);

@override
String toString() {
  return 'IncomingContactEmployerEntity(id: $id, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$IncomingContactEmployerEntityCopyWith<$Res> implements $IncomingContactEmployerEntityCopyWith<$Res> {
  factory _$IncomingContactEmployerEntityCopyWith(_IncomingContactEmployerEntity value, $Res Function(_IncomingContactEmployerEntity) _then) = __$IncomingContactEmployerEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName
});




}
/// @nodoc
class __$IncomingContactEmployerEntityCopyWithImpl<$Res>
    implements _$IncomingContactEmployerEntityCopyWith<$Res> {
  __$IncomingContactEmployerEntityCopyWithImpl(this._self, this._then);

  final _IncomingContactEmployerEntity _self;
  final $Res Function(_IncomingContactEmployerEntity) _then;

/// Create a copy of IncomingContactEmployerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,}) {
  return _then(_IncomingContactEmployerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$IncomingContactEntity {

 String get id; String get workerId; String get status; String get createdAt; String get updatedAt; IncomingContactEmployerEntity get employer;
/// Create a copy of IncomingContactEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomingContactEntityCopyWith<IncomingContactEntity> get copyWith => _$IncomingContactEntityCopyWithImpl<IncomingContactEntity>(this as IncomingContactEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomingContactEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.employer, employer) || other.employer == employer));
}


@override
int get hashCode => Object.hash(runtimeType,id,workerId,status,createdAt,updatedAt,employer);

@override
String toString() {
  return 'IncomingContactEntity(id: $id, workerId: $workerId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, employer: $employer)';
}


}

/// @nodoc
abstract mixin class $IncomingContactEntityCopyWith<$Res>  {
  factory $IncomingContactEntityCopyWith(IncomingContactEntity value, $Res Function(IncomingContactEntity) _then) = _$IncomingContactEntityCopyWithImpl;
@useResult
$Res call({
 String id, String workerId, String status, String createdAt, String updatedAt, IncomingContactEmployerEntity employer
});


$IncomingContactEmployerEntityCopyWith<$Res> get employer;

}
/// @nodoc
class _$IncomingContactEntityCopyWithImpl<$Res>
    implements $IncomingContactEntityCopyWith<$Res> {
  _$IncomingContactEntityCopyWithImpl(this._self, this._then);

  final IncomingContactEntity _self;
  final $Res Function(IncomingContactEntity) _then;

/// Create a copy of IncomingContactEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workerId = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? employer = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,employer: null == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as IncomingContactEmployerEntity,
  ));
}
/// Create a copy of IncomingContactEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncomingContactEmployerEntityCopyWith<$Res> get employer {
  
  return $IncomingContactEmployerEntityCopyWith<$Res>(_self.employer, (value) {
    return _then(_self.copyWith(employer: value));
  });
}
}


/// Adds pattern-matching-related methods to [IncomingContactEntity].
extension IncomingContactEntityPatterns on IncomingContactEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomingContactEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomingContactEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomingContactEntity value)  $default,){
final _that = this;
switch (_that) {
case _IncomingContactEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomingContactEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IncomingContactEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String workerId,  String status,  String createdAt,  String updatedAt,  IncomingContactEmployerEntity employer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomingContactEntity() when $default != null:
return $default(_that.id,_that.workerId,_that.status,_that.createdAt,_that.updatedAt,_that.employer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String workerId,  String status,  String createdAt,  String updatedAt,  IncomingContactEmployerEntity employer)  $default,) {final _that = this;
switch (_that) {
case _IncomingContactEntity():
return $default(_that.id,_that.workerId,_that.status,_that.createdAt,_that.updatedAt,_that.employer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String workerId,  String status,  String createdAt,  String updatedAt,  IncomingContactEmployerEntity employer)?  $default,) {final _that = this;
switch (_that) {
case _IncomingContactEntity() when $default != null:
return $default(_that.id,_that.workerId,_that.status,_that.createdAt,_that.updatedAt,_that.employer);case _:
  return null;

}
}

}

/// @nodoc


class _IncomingContactEntity implements IncomingContactEntity {
  const _IncomingContactEntity({required this.id, required this.workerId, required this.status, required this.createdAt, required this.updatedAt, required this.employer});
  

@override final  String id;
@override final  String workerId;
@override final  String status;
@override final  String createdAt;
@override final  String updatedAt;
@override final  IncomingContactEmployerEntity employer;

/// Create a copy of IncomingContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomingContactEntityCopyWith<_IncomingContactEntity> get copyWith => __$IncomingContactEntityCopyWithImpl<_IncomingContactEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomingContactEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.employer, employer) || other.employer == employer));
}


@override
int get hashCode => Object.hash(runtimeType,id,workerId,status,createdAt,updatedAt,employer);

@override
String toString() {
  return 'IncomingContactEntity(id: $id, workerId: $workerId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, employer: $employer)';
}


}

/// @nodoc
abstract mixin class _$IncomingContactEntityCopyWith<$Res> implements $IncomingContactEntityCopyWith<$Res> {
  factory _$IncomingContactEntityCopyWith(_IncomingContactEntity value, $Res Function(_IncomingContactEntity) _then) = __$IncomingContactEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String workerId, String status, String createdAt, String updatedAt, IncomingContactEmployerEntity employer
});


@override $IncomingContactEmployerEntityCopyWith<$Res> get employer;

}
/// @nodoc
class __$IncomingContactEntityCopyWithImpl<$Res>
    implements _$IncomingContactEntityCopyWith<$Res> {
  __$IncomingContactEntityCopyWithImpl(this._self, this._then);

  final _IncomingContactEntity _self;
  final $Res Function(_IncomingContactEntity) _then;

/// Create a copy of IncomingContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workerId = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? employer = null,}) {
  return _then(_IncomingContactEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,employer: null == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as IncomingContactEmployerEntity,
  ));
}

/// Create a copy of IncomingContactEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncomingContactEmployerEntityCopyWith<$Res> get employer {
  
  return $IncomingContactEmployerEntityCopyWith<$Res>(_self.employer, (value) {
    return _then(_self.copyWith(employer: value));
  });
}
}

/// @nodoc
mixin _$IncomingContactsResultEntity {

 List<IncomingContactEntity> get contacts; int get totalRows; int get totalPages; int get currentPage; bool get hasNext;
/// Create a copy of IncomingContactsResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomingContactsResultEntityCopyWith<IncomingContactsResultEntity> get copyWith => _$IncomingContactsResultEntityCopyWithImpl<IncomingContactsResultEntity>(this as IncomingContactsResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomingContactsResultEntity&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contacts),totalRows,totalPages,currentPage,hasNext);

@override
String toString() {
  return 'IncomingContactsResultEntity(contacts: $contacts, totalRows: $totalRows, totalPages: $totalPages, currentPage: $currentPage, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $IncomingContactsResultEntityCopyWith<$Res>  {
  factory $IncomingContactsResultEntityCopyWith(IncomingContactsResultEntity value, $Res Function(IncomingContactsResultEntity) _then) = _$IncomingContactsResultEntityCopyWithImpl;
@useResult
$Res call({
 List<IncomingContactEntity> contacts, int totalRows, int totalPages, int currentPage, bool hasNext
});




}
/// @nodoc
class _$IncomingContactsResultEntityCopyWithImpl<$Res>
    implements $IncomingContactsResultEntityCopyWith<$Res> {
  _$IncomingContactsResultEntityCopyWithImpl(this._self, this._then);

  final IncomingContactsResultEntity _self;
  final $Res Function(IncomingContactsResultEntity) _then;

/// Create a copy of IncomingContactsResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contacts = null,Object? totalRows = null,Object? totalPages = null,Object? currentPage = null,Object? hasNext = null,}) {
  return _then(_self.copyWith(
contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<IncomingContactEntity>,totalRows: null == totalRows ? _self.totalRows : totalRows // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomingContactsResultEntity].
extension IncomingContactsResultEntityPatterns on IncomingContactsResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomingContactsResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomingContactsResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomingContactsResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _IncomingContactsResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomingContactsResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IncomingContactsResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IncomingContactEntity> contacts,  int totalRows,  int totalPages,  int currentPage,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomingContactsResultEntity() when $default != null:
return $default(_that.contacts,_that.totalRows,_that.totalPages,_that.currentPage,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IncomingContactEntity> contacts,  int totalRows,  int totalPages,  int currentPage,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _IncomingContactsResultEntity():
return $default(_that.contacts,_that.totalRows,_that.totalPages,_that.currentPage,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IncomingContactEntity> contacts,  int totalRows,  int totalPages,  int currentPage,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _IncomingContactsResultEntity() when $default != null:
return $default(_that.contacts,_that.totalRows,_that.totalPages,_that.currentPage,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc


class _IncomingContactsResultEntity implements IncomingContactsResultEntity {
  const _IncomingContactsResultEntity({required final  List<IncomingContactEntity> contacts, required this.totalRows, required this.totalPages, required this.currentPage, required this.hasNext}): _contacts = contacts;
  

 final  List<IncomingContactEntity> _contacts;
@override List<IncomingContactEntity> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  int totalRows;
@override final  int totalPages;
@override final  int currentPage;
@override final  bool hasNext;

/// Create a copy of IncomingContactsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomingContactsResultEntityCopyWith<_IncomingContactsResultEntity> get copyWith => __$IncomingContactsResultEntityCopyWithImpl<_IncomingContactsResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomingContactsResultEntity&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contacts),totalRows,totalPages,currentPage,hasNext);

@override
String toString() {
  return 'IncomingContactsResultEntity(contacts: $contacts, totalRows: $totalRows, totalPages: $totalPages, currentPage: $currentPage, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$IncomingContactsResultEntityCopyWith<$Res> implements $IncomingContactsResultEntityCopyWith<$Res> {
  factory _$IncomingContactsResultEntityCopyWith(_IncomingContactsResultEntity value, $Res Function(_IncomingContactsResultEntity) _then) = __$IncomingContactsResultEntityCopyWithImpl;
@override @useResult
$Res call({
 List<IncomingContactEntity> contacts, int totalRows, int totalPages, int currentPage, bool hasNext
});




}
/// @nodoc
class __$IncomingContactsResultEntityCopyWithImpl<$Res>
    implements _$IncomingContactsResultEntityCopyWith<$Res> {
  __$IncomingContactsResultEntityCopyWithImpl(this._self, this._then);

  final _IncomingContactsResultEntity _self;
  final $Res Function(_IncomingContactsResultEntity) _then;

/// Create a copy of IncomingContactsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contacts = null,Object? totalRows = null,Object? totalPages = null,Object? currentPage = null,Object? hasNext = null,}) {
  return _then(_IncomingContactsResultEntity(
contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<IncomingContactEntity>,totalRows: null == totalRows ? _self.totalRows : totalRows // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
