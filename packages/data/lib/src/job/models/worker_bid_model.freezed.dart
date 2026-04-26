// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_bid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkerBidModel {

 String get id;@JsonKey(name: 'user_id') String? get userId; double? get rating;@JsonKey(name: 'review_count') int? get reviewCount; int? get wage;@JsonKey(name: 'salary_type') String? get salaryType; WorkerUserBidModel? get user; List<WorkerImageBidModel> get images;
/// Create a copy of WorkerBidModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerBidModelCopyWith<WorkerBidModel> get copyWith => _$WorkerBidModelCopyWithImpl<WorkerBidModel>(this as WorkerBidModel, _$identity);

  /// Serializes this WorkerBidModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerBidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wage, wage) || other.wage == wage)&&(identical(other.salaryType, salaryType) || other.salaryType == salaryType)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,rating,reviewCount,wage,salaryType,user,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'WorkerBidModel(id: $id, userId: $userId, rating: $rating, reviewCount: $reviewCount, wage: $wage, salaryType: $salaryType, user: $user, images: $images)';
}


}

/// @nodoc
abstract mixin class $WorkerBidModelCopyWith<$Res>  {
  factory $WorkerBidModelCopyWith(WorkerBidModel value, $Res Function(WorkerBidModel) _then) = _$WorkerBidModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId, double? rating,@JsonKey(name: 'review_count') int? reviewCount, int? wage,@JsonKey(name: 'salary_type') String? salaryType, WorkerUserBidModel? user, List<WorkerImageBidModel> images
});


$WorkerUserBidModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$WorkerBidModelCopyWithImpl<$Res>
    implements $WorkerBidModelCopyWith<$Res> {
  _$WorkerBidModelCopyWithImpl(this._self, this._then);

  final WorkerBidModel _self;
  final $Res Function(WorkerBidModel) _then;

/// Create a copy of WorkerBidModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? wage = freezed,Object? salaryType = freezed,Object? user = freezed,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,wage: freezed == wage ? _self.wage : wage // ignore: cast_nullable_to_non_nullable
as int?,salaryType: freezed == salaryType ? _self.salaryType : salaryType // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as WorkerUserBidModel?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<WorkerImageBidModel>,
  ));
}
/// Create a copy of WorkerBidModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerUserBidModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $WorkerUserBidModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkerBidModel].
extension WorkerBidModelPatterns on WorkerBidModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerBidModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerBidModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerBidModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkerBidModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerBidModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerBidModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId,  double? rating, @JsonKey(name: 'review_count')  int? reviewCount,  int? wage, @JsonKey(name: 'salary_type')  String? salaryType,  WorkerUserBidModel? user,  List<WorkerImageBidModel> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerBidModel() when $default != null:
return $default(_that.id,_that.userId,_that.rating,_that.reviewCount,_that.wage,_that.salaryType,_that.user,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId,  double? rating, @JsonKey(name: 'review_count')  int? reviewCount,  int? wage, @JsonKey(name: 'salary_type')  String? salaryType,  WorkerUserBidModel? user,  List<WorkerImageBidModel> images)  $default,) {final _that = this;
switch (_that) {
case _WorkerBidModel():
return $default(_that.id,_that.userId,_that.rating,_that.reviewCount,_that.wage,_that.salaryType,_that.user,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String? userId,  double? rating, @JsonKey(name: 'review_count')  int? reviewCount,  int? wage, @JsonKey(name: 'salary_type')  String? salaryType,  WorkerUserBidModel? user,  List<WorkerImageBidModel> images)?  $default,) {final _that = this;
switch (_that) {
case _WorkerBidModel() when $default != null:
return $default(_that.id,_that.userId,_that.rating,_that.reviewCount,_that.wage,_that.salaryType,_that.user,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkerBidModel extends WorkerBidModel {
  const _WorkerBidModel({required this.id, @JsonKey(name: 'user_id') this.userId, this.rating, @JsonKey(name: 'review_count') this.reviewCount, this.wage, @JsonKey(name: 'salary_type') this.salaryType, this.user, final  List<WorkerImageBidModel> images = const []}): _images = images,super._();
  factory _WorkerBidModel.fromJson(Map<String, dynamic> json) => _$WorkerBidModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override final  double? rating;
@override@JsonKey(name: 'review_count') final  int? reviewCount;
@override final  int? wage;
@override@JsonKey(name: 'salary_type') final  String? salaryType;
@override final  WorkerUserBidModel? user;
 final  List<WorkerImageBidModel> _images;
@override@JsonKey() List<WorkerImageBidModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of WorkerBidModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerBidModelCopyWith<_WorkerBidModel> get copyWith => __$WorkerBidModelCopyWithImpl<_WorkerBidModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkerBidModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerBidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wage, wage) || other.wage == wage)&&(identical(other.salaryType, salaryType) || other.salaryType == salaryType)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,rating,reviewCount,wage,salaryType,user,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'WorkerBidModel(id: $id, userId: $userId, rating: $rating, reviewCount: $reviewCount, wage: $wage, salaryType: $salaryType, user: $user, images: $images)';
}


}

/// @nodoc
abstract mixin class _$WorkerBidModelCopyWith<$Res> implements $WorkerBidModelCopyWith<$Res> {
  factory _$WorkerBidModelCopyWith(_WorkerBidModel value, $Res Function(_WorkerBidModel) _then) = __$WorkerBidModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId, double? rating,@JsonKey(name: 'review_count') int? reviewCount, int? wage,@JsonKey(name: 'salary_type') String? salaryType, WorkerUserBidModel? user, List<WorkerImageBidModel> images
});


@override $WorkerUserBidModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$WorkerBidModelCopyWithImpl<$Res>
    implements _$WorkerBidModelCopyWith<$Res> {
  __$WorkerBidModelCopyWithImpl(this._self, this._then);

  final _WorkerBidModel _self;
  final $Res Function(_WorkerBidModel) _then;

/// Create a copy of WorkerBidModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? wage = freezed,Object? salaryType = freezed,Object? user = freezed,Object? images = null,}) {
  return _then(_WorkerBidModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,wage: freezed == wage ? _self.wage : wage // ignore: cast_nullable_to_non_nullable
as int?,salaryType: freezed == salaryType ? _self.salaryType : salaryType // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as WorkerUserBidModel?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<WorkerImageBidModel>,
  ));
}

/// Create a copy of WorkerBidModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerUserBidModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $WorkerUserBidModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$WorkerUserBidModel {

 String get id;@JsonKey(name: 'user_info') WorkerUserInfoBidModel? get userInfo;
/// Create a copy of WorkerUserBidModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerUserBidModelCopyWith<WorkerUserBidModel> get copyWith => _$WorkerUserBidModelCopyWithImpl<WorkerUserBidModel>(this as WorkerUserBidModel, _$identity);

  /// Serializes this WorkerUserBidModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerUserBidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userInfo);

@override
String toString() {
  return 'WorkerUserBidModel(id: $id, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $WorkerUserBidModelCopyWith<$Res>  {
  factory $WorkerUserBidModelCopyWith(WorkerUserBidModel value, $Res Function(WorkerUserBidModel) _then) = _$WorkerUserBidModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_info') WorkerUserInfoBidModel? userInfo
});


$WorkerUserInfoBidModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class _$WorkerUserBidModelCopyWithImpl<$Res>
    implements $WorkerUserBidModelCopyWith<$Res> {
  _$WorkerUserBidModelCopyWithImpl(this._self, this._then);

  final WorkerUserBidModel _self;
  final $Res Function(WorkerUserBidModel) _then;

/// Create a copy of WorkerUserBidModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userInfo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as WorkerUserInfoBidModel?,
  ));
}
/// Create a copy of WorkerUserBidModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerUserInfoBidModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $WorkerUserInfoBidModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkerUserBidModel].
extension WorkerUserBidModelPatterns on WorkerUserBidModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerUserBidModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerUserBidModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerUserBidModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkerUserBidModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerUserBidModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerUserBidModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_info')  WorkerUserInfoBidModel? userInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerUserBidModel() when $default != null:
return $default(_that.id,_that.userInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_info')  WorkerUserInfoBidModel? userInfo)  $default,) {final _that = this;
switch (_that) {
case _WorkerUserBidModel():
return $default(_that.id,_that.userInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_info')  WorkerUserInfoBidModel? userInfo)?  $default,) {final _that = this;
switch (_that) {
case _WorkerUserBidModel() when $default != null:
return $default(_that.id,_that.userInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkerUserBidModel implements WorkerUserBidModel {
  const _WorkerUserBidModel({required this.id, @JsonKey(name: 'user_info') this.userInfo});
  factory _WorkerUserBidModel.fromJson(Map<String, dynamic> json) => _$WorkerUserBidModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_info') final  WorkerUserInfoBidModel? userInfo;

/// Create a copy of WorkerUserBidModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerUserBidModelCopyWith<_WorkerUserBidModel> get copyWith => __$WorkerUserBidModelCopyWithImpl<_WorkerUserBidModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkerUserBidModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerUserBidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userInfo);

@override
String toString() {
  return 'WorkerUserBidModel(id: $id, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class _$WorkerUserBidModelCopyWith<$Res> implements $WorkerUserBidModelCopyWith<$Res> {
  factory _$WorkerUserBidModelCopyWith(_WorkerUserBidModel value, $Res Function(_WorkerUserBidModel) _then) = __$WorkerUserBidModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_info') WorkerUserInfoBidModel? userInfo
});


@override $WorkerUserInfoBidModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class __$WorkerUserBidModelCopyWithImpl<$Res>
    implements _$WorkerUserBidModelCopyWith<$Res> {
  __$WorkerUserBidModelCopyWithImpl(this._self, this._then);

  final _WorkerUserBidModel _self;
  final $Res Function(_WorkerUserBidModel) _then;

/// Create a copy of WorkerUserBidModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userInfo = freezed,}) {
  return _then(_WorkerUserBidModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as WorkerUserInfoBidModel?,
  ));
}

/// Create a copy of WorkerUserBidModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerUserInfoBidModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $WorkerUserInfoBidModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// @nodoc
mixin _$WorkerUserInfoBidModel {

@JsonKey(name: 'full_name') String? get fullName; String? get dob;
/// Create a copy of WorkerUserInfoBidModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerUserInfoBidModelCopyWith<WorkerUserInfoBidModel> get copyWith => _$WorkerUserInfoBidModelCopyWithImpl<WorkerUserInfoBidModel>(this as WorkerUserInfoBidModel, _$identity);

  /// Serializes this WorkerUserInfoBidModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerUserInfoBidModel&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,dob);

@override
String toString() {
  return 'WorkerUserInfoBidModel(fullName: $fullName, dob: $dob)';
}


}

/// @nodoc
abstract mixin class $WorkerUserInfoBidModelCopyWith<$Res>  {
  factory $WorkerUserInfoBidModelCopyWith(WorkerUserInfoBidModel value, $Res Function(WorkerUserInfoBidModel) _then) = _$WorkerUserInfoBidModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName, String? dob
});




}
/// @nodoc
class _$WorkerUserInfoBidModelCopyWithImpl<$Res>
    implements $WorkerUserInfoBidModelCopyWith<$Res> {
  _$WorkerUserInfoBidModelCopyWithImpl(this._self, this._then);

  final WorkerUserInfoBidModel _self;
  final $Res Function(WorkerUserInfoBidModel) _then;

/// Create a copy of WorkerUserInfoBidModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? dob = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerUserInfoBidModel].
extension WorkerUserInfoBidModelPatterns on WorkerUserInfoBidModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerUserInfoBidModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerUserInfoBidModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerUserInfoBidModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkerUserInfoBidModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerUserInfoBidModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerUserInfoBidModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName,  String? dob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerUserInfoBidModel() when $default != null:
return $default(_that.fullName,_that.dob);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName,  String? dob)  $default,) {final _that = this;
switch (_that) {
case _WorkerUserInfoBidModel():
return $default(_that.fullName,_that.dob);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String? fullName,  String? dob)?  $default,) {final _that = this;
switch (_that) {
case _WorkerUserInfoBidModel() when $default != null:
return $default(_that.fullName,_that.dob);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkerUserInfoBidModel implements WorkerUserInfoBidModel {
  const _WorkerUserInfoBidModel({@JsonKey(name: 'full_name') this.fullName, this.dob});
  factory _WorkerUserInfoBidModel.fromJson(Map<String, dynamic> json) => _$WorkerUserInfoBidModelFromJson(json);

@override@JsonKey(name: 'full_name') final  String? fullName;
@override final  String? dob;

/// Create a copy of WorkerUserInfoBidModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerUserInfoBidModelCopyWith<_WorkerUserInfoBidModel> get copyWith => __$WorkerUserInfoBidModelCopyWithImpl<_WorkerUserInfoBidModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkerUserInfoBidModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerUserInfoBidModel&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,dob);

@override
String toString() {
  return 'WorkerUserInfoBidModel(fullName: $fullName, dob: $dob)';
}


}

/// @nodoc
abstract mixin class _$WorkerUserInfoBidModelCopyWith<$Res> implements $WorkerUserInfoBidModelCopyWith<$Res> {
  factory _$WorkerUserInfoBidModelCopyWith(_WorkerUserInfoBidModel value, $Res Function(_WorkerUserInfoBidModel) _then) = __$WorkerUserInfoBidModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName, String? dob
});




}
/// @nodoc
class __$WorkerUserInfoBidModelCopyWithImpl<$Res>
    implements _$WorkerUserInfoBidModelCopyWith<$Res> {
  __$WorkerUserInfoBidModelCopyWithImpl(this._self, this._then);

  final _WorkerUserInfoBidModel _self;
  final $Res Function(_WorkerUserInfoBidModel) _then;

/// Create a copy of WorkerUserInfoBidModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? dob = freezed,}) {
  return _then(_WorkerUserInfoBidModel(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WorkerImageBidModel {

 String get id;@JsonKey(name: 'uri_path') String get uriPath;
/// Create a copy of WorkerImageBidModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerImageBidModelCopyWith<WorkerImageBidModel> get copyWith => _$WorkerImageBidModelCopyWithImpl<WorkerImageBidModel>(this as WorkerImageBidModel, _$identity);

  /// Serializes this WorkerImageBidModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerImageBidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uriPath);

@override
String toString() {
  return 'WorkerImageBidModel(id: $id, uriPath: $uriPath)';
}


}

/// @nodoc
abstract mixin class $WorkerImageBidModelCopyWith<$Res>  {
  factory $WorkerImageBidModelCopyWith(WorkerImageBidModel value, $Res Function(WorkerImageBidModel) _then) = _$WorkerImageBidModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'uri_path') String uriPath
});




}
/// @nodoc
class _$WorkerImageBidModelCopyWithImpl<$Res>
    implements $WorkerImageBidModelCopyWith<$Res> {
  _$WorkerImageBidModelCopyWithImpl(this._self, this._then);

  final WorkerImageBidModel _self;
  final $Res Function(WorkerImageBidModel) _then;

/// Create a copy of WorkerImageBidModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uriPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerImageBidModel].
extension WorkerImageBidModelPatterns on WorkerImageBidModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerImageBidModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerImageBidModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerImageBidModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkerImageBidModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerImageBidModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerImageBidModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'uri_path')  String uriPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerImageBidModel() when $default != null:
return $default(_that.id,_that.uriPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'uri_path')  String uriPath)  $default,) {final _that = this;
switch (_that) {
case _WorkerImageBidModel():
return $default(_that.id,_that.uriPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'uri_path')  String uriPath)?  $default,) {final _that = this;
switch (_that) {
case _WorkerImageBidModel() when $default != null:
return $default(_that.id,_that.uriPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkerImageBidModel implements WorkerImageBidModel {
  const _WorkerImageBidModel({required this.id, @JsonKey(name: 'uri_path') required this.uriPath});
  factory _WorkerImageBidModel.fromJson(Map<String, dynamic> json) => _$WorkerImageBidModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'uri_path') final  String uriPath;

/// Create a copy of WorkerImageBidModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerImageBidModelCopyWith<_WorkerImageBidModel> get copyWith => __$WorkerImageBidModelCopyWithImpl<_WorkerImageBidModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkerImageBidModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerImageBidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uriPath);

@override
String toString() {
  return 'WorkerImageBidModel(id: $id, uriPath: $uriPath)';
}


}

/// @nodoc
abstract mixin class _$WorkerImageBidModelCopyWith<$Res> implements $WorkerImageBidModelCopyWith<$Res> {
  factory _$WorkerImageBidModelCopyWith(_WorkerImageBidModel value, $Res Function(_WorkerImageBidModel) _then) = __$WorkerImageBidModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'uri_path') String uriPath
});




}
/// @nodoc
class __$WorkerImageBidModelCopyWithImpl<$Res>
    implements _$WorkerImageBidModelCopyWith<$Res> {
  __$WorkerImageBidModelCopyWithImpl(this._self, this._then);

  final _WorkerImageBidModel _self;
  final $Res Function(_WorkerImageBidModel) _then;

/// Create a copy of WorkerImageBidModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uriPath = null,}) {
  return _then(_WorkerImageBidModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
