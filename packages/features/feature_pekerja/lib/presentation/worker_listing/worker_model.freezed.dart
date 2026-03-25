// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerModel {

 String get id; String get name; String get adCode; String get statusLabel; int get age; double get rating; int get reviewCount; int get wage; String? get avatarUrl; bool get isAd;// Ad specific fields
 String? get adTitle; String? get adDescription; String? get adImageUrl;
/// Create a copy of WorkerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerModelCopyWith<WorkerModel> get copyWith => _$WorkerModelCopyWithImpl<WorkerModel>(this as WorkerModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.age, age) || other.age == age)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wage, wage) || other.wage == wage)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isAd, isAd) || other.isAd == isAd)&&(identical(other.adTitle, adTitle) || other.adTitle == adTitle)&&(identical(other.adDescription, adDescription) || other.adDescription == adDescription)&&(identical(other.adImageUrl, adImageUrl) || other.adImageUrl == adImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,adCode,statusLabel,age,rating,reviewCount,wage,avatarUrl,isAd,adTitle,adDescription,adImageUrl);

@override
String toString() {
  return 'WorkerModel(id: $id, name: $name, adCode: $adCode, statusLabel: $statusLabel, age: $age, rating: $rating, reviewCount: $reviewCount, wage: $wage, avatarUrl: $avatarUrl, isAd: $isAd, adTitle: $adTitle, adDescription: $adDescription, adImageUrl: $adImageUrl)';
}


}

/// @nodoc
abstract mixin class $WorkerModelCopyWith<$Res>  {
  factory $WorkerModelCopyWith(WorkerModel value, $Res Function(WorkerModel) _then) = _$WorkerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String adCode, String statusLabel, int age, double rating, int reviewCount, int wage, String? avatarUrl, bool isAd, String? adTitle, String? adDescription, String? adImageUrl
});




}
/// @nodoc
class _$WorkerModelCopyWithImpl<$Res>
    implements $WorkerModelCopyWith<$Res> {
  _$WorkerModelCopyWithImpl(this._self, this._then);

  final WorkerModel _self;
  final $Res Function(WorkerModel) _then;

/// Create a copy of WorkerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? adCode = null,Object? statusLabel = null,Object? age = null,Object? rating = null,Object? reviewCount = null,Object? wage = null,Object? avatarUrl = freezed,Object? isAd = null,Object? adTitle = freezed,Object? adDescription = freezed,Object? adImageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,wage: null == wage ? _self.wage : wage // ignore: cast_nullable_to_non_nullable
as int,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isAd: null == isAd ? _self.isAd : isAd // ignore: cast_nullable_to_non_nullable
as bool,adTitle: freezed == adTitle ? _self.adTitle : adTitle // ignore: cast_nullable_to_non_nullable
as String?,adDescription: freezed == adDescription ? _self.adDescription : adDescription // ignore: cast_nullable_to_non_nullable
as String?,adImageUrl: freezed == adImageUrl ? _self.adImageUrl : adImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerModel].
extension WorkerModelPatterns on WorkerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String adCode,  String statusLabel,  int age,  double rating,  int reviewCount,  int wage,  String? avatarUrl,  bool isAd,  String? adTitle,  String? adDescription,  String? adImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerModel() when $default != null:
return $default(_that.id,_that.name,_that.adCode,_that.statusLabel,_that.age,_that.rating,_that.reviewCount,_that.wage,_that.avatarUrl,_that.isAd,_that.adTitle,_that.adDescription,_that.adImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String adCode,  String statusLabel,  int age,  double rating,  int reviewCount,  int wage,  String? avatarUrl,  bool isAd,  String? adTitle,  String? adDescription,  String? adImageUrl)  $default,) {final _that = this;
switch (_that) {
case _WorkerModel():
return $default(_that.id,_that.name,_that.adCode,_that.statusLabel,_that.age,_that.rating,_that.reviewCount,_that.wage,_that.avatarUrl,_that.isAd,_that.adTitle,_that.adDescription,_that.adImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String adCode,  String statusLabel,  int age,  double rating,  int reviewCount,  int wage,  String? avatarUrl,  bool isAd,  String? adTitle,  String? adDescription,  String? adImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _WorkerModel() when $default != null:
return $default(_that.id,_that.name,_that.adCode,_that.statusLabel,_that.age,_that.rating,_that.reviewCount,_that.wage,_that.avatarUrl,_that.isAd,_that.adTitle,_that.adDescription,_that.adImageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerModel implements WorkerModel {
  const _WorkerModel({required this.id, required this.name, required this.adCode, this.statusLabel = 'Availble', required this.age, required this.rating, required this.reviewCount, required this.wage, this.avatarUrl, this.isAd = false, this.adTitle, this.adDescription, this.adImageUrl});
  

@override final  String id;
@override final  String name;
@override final  String adCode;
@override@JsonKey() final  String statusLabel;
@override final  int age;
@override final  double rating;
@override final  int reviewCount;
@override final  int wage;
@override final  String? avatarUrl;
@override@JsonKey() final  bool isAd;
// Ad specific fields
@override final  String? adTitle;
@override final  String? adDescription;
@override final  String? adImageUrl;

/// Create a copy of WorkerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerModelCopyWith<_WorkerModel> get copyWith => __$WorkerModelCopyWithImpl<_WorkerModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.age, age) || other.age == age)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wage, wage) || other.wage == wage)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isAd, isAd) || other.isAd == isAd)&&(identical(other.adTitle, adTitle) || other.adTitle == adTitle)&&(identical(other.adDescription, adDescription) || other.adDescription == adDescription)&&(identical(other.adImageUrl, adImageUrl) || other.adImageUrl == adImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,adCode,statusLabel,age,rating,reviewCount,wage,avatarUrl,isAd,adTitle,adDescription,adImageUrl);

@override
String toString() {
  return 'WorkerModel(id: $id, name: $name, adCode: $adCode, statusLabel: $statusLabel, age: $age, rating: $rating, reviewCount: $reviewCount, wage: $wage, avatarUrl: $avatarUrl, isAd: $isAd, adTitle: $adTitle, adDescription: $adDescription, adImageUrl: $adImageUrl)';
}


}

/// @nodoc
abstract mixin class _$WorkerModelCopyWith<$Res> implements $WorkerModelCopyWith<$Res> {
  factory _$WorkerModelCopyWith(_WorkerModel value, $Res Function(_WorkerModel) _then) = __$WorkerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String adCode, String statusLabel, int age, double rating, int reviewCount, int wage, String? avatarUrl, bool isAd, String? adTitle, String? adDescription, String? adImageUrl
});




}
/// @nodoc
class __$WorkerModelCopyWithImpl<$Res>
    implements _$WorkerModelCopyWith<$Res> {
  __$WorkerModelCopyWithImpl(this._self, this._then);

  final _WorkerModel _self;
  final $Res Function(_WorkerModel) _then;

/// Create a copy of WorkerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? adCode = null,Object? statusLabel = null,Object? age = null,Object? rating = null,Object? reviewCount = null,Object? wage = null,Object? avatarUrl = freezed,Object? isAd = null,Object? adTitle = freezed,Object? adDescription = freezed,Object? adImageUrl = freezed,}) {
  return _then(_WorkerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,wage: null == wage ? _self.wage : wage // ignore: cast_nullable_to_non_nullable
as int,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isAd: null == isAd ? _self.isAd : isAd // ignore: cast_nullable_to_non_nullable
as bool,adTitle: freezed == adTitle ? _self.adTitle : adTitle // ignore: cast_nullable_to_non_nullable
as String?,adDescription: freezed == adDescription ? _self.adDescription : adDescription // ignore: cast_nullable_to_non_nullable
as String?,adImageUrl: freezed == adImageUrl ? _self.adImageUrl : adImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
