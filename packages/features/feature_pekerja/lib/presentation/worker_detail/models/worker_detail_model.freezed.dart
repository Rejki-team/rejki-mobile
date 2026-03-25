// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerDetailModel {

 String get id; String get name; String get adCode; String get statusLabel; int get age; double get rating; int get reviewCount; String get wageText; String? get avatarUrl; String get address; List<String> get workExperiences; String get workingHours; String get phoneNumber; List<String> get badges;
/// Create a copy of WorkerDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerDetailModelCopyWith<WorkerDetailModel> get copyWith => _$WorkerDetailModelCopyWithImpl<WorkerDetailModel>(this as WorkerDetailModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.age, age) || other.age == age)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wageText, wageText) || other.wageText == wageText)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.workExperiences, workExperiences)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&const DeepCollectionEquality().equals(other.badges, badges));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,adCode,statusLabel,age,rating,reviewCount,wageText,avatarUrl,address,const DeepCollectionEquality().hash(workExperiences),workingHours,phoneNumber,const DeepCollectionEquality().hash(badges));

@override
String toString() {
  return 'WorkerDetailModel(id: $id, name: $name, adCode: $adCode, statusLabel: $statusLabel, age: $age, rating: $rating, reviewCount: $reviewCount, wageText: $wageText, avatarUrl: $avatarUrl, address: $address, workExperiences: $workExperiences, workingHours: $workingHours, phoneNumber: $phoneNumber, badges: $badges)';
}


}

/// @nodoc
abstract mixin class $WorkerDetailModelCopyWith<$Res>  {
  factory $WorkerDetailModelCopyWith(WorkerDetailModel value, $Res Function(WorkerDetailModel) _then) = _$WorkerDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String adCode, String statusLabel, int age, double rating, int reviewCount, String wageText, String? avatarUrl, String address, List<String> workExperiences, String workingHours, String phoneNumber, List<String> badges
});




}
/// @nodoc
class _$WorkerDetailModelCopyWithImpl<$Res>
    implements $WorkerDetailModelCopyWith<$Res> {
  _$WorkerDetailModelCopyWithImpl(this._self, this._then);

  final WorkerDetailModel _self;
  final $Res Function(WorkerDetailModel) _then;

/// Create a copy of WorkerDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? adCode = null,Object? statusLabel = null,Object? age = null,Object? rating = null,Object? reviewCount = null,Object? wageText = null,Object? avatarUrl = freezed,Object? address = null,Object? workExperiences = null,Object? workingHours = null,Object? phoneNumber = null,Object? badges = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,wageText: null == wageText ? _self.wageText : wageText // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,workExperiences: null == workExperiences ? _self.workExperiences : workExperiences // ignore: cast_nullable_to_non_nullable
as List<String>,workingHours: null == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerDetailModel].
extension WorkerDetailModelPatterns on WorkerDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkerDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String adCode,  String statusLabel,  int age,  double rating,  int reviewCount,  String wageText,  String? avatarUrl,  String address,  List<String> workExperiences,  String workingHours,  String phoneNumber,  List<String> badges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.adCode,_that.statusLabel,_that.age,_that.rating,_that.reviewCount,_that.wageText,_that.avatarUrl,_that.address,_that.workExperiences,_that.workingHours,_that.phoneNumber,_that.badges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String adCode,  String statusLabel,  int age,  double rating,  int reviewCount,  String wageText,  String? avatarUrl,  String address,  List<String> workExperiences,  String workingHours,  String phoneNumber,  List<String> badges)  $default,) {final _that = this;
switch (_that) {
case _WorkerDetailModel():
return $default(_that.id,_that.name,_that.adCode,_that.statusLabel,_that.age,_that.rating,_that.reviewCount,_that.wageText,_that.avatarUrl,_that.address,_that.workExperiences,_that.workingHours,_that.phoneNumber,_that.badges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String adCode,  String statusLabel,  int age,  double rating,  int reviewCount,  String wageText,  String? avatarUrl,  String address,  List<String> workExperiences,  String workingHours,  String phoneNumber,  List<String> badges)?  $default,) {final _that = this;
switch (_that) {
case _WorkerDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.adCode,_that.statusLabel,_that.age,_that.rating,_that.reviewCount,_that.wageText,_that.avatarUrl,_that.address,_that.workExperiences,_that.workingHours,_that.phoneNumber,_that.badges);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerDetailModel implements WorkerDetailModel {
  const _WorkerDetailModel({required this.id, required this.name, required this.adCode, required this.statusLabel, required this.age, required this.rating, required this.reviewCount, required this.wageText, this.avatarUrl, required this.address, required final  List<String> workExperiences, required this.workingHours, required this.phoneNumber, required final  List<String> badges}): _workExperiences = workExperiences,_badges = badges;
  

@override final  String id;
@override final  String name;
@override final  String adCode;
@override final  String statusLabel;
@override final  int age;
@override final  double rating;
@override final  int reviewCount;
@override final  String wageText;
@override final  String? avatarUrl;
@override final  String address;
 final  List<String> _workExperiences;
@override List<String> get workExperiences {
  if (_workExperiences is EqualUnmodifiableListView) return _workExperiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workExperiences);
}

@override final  String workingHours;
@override final  String phoneNumber;
 final  List<String> _badges;
@override List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}


/// Create a copy of WorkerDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerDetailModelCopyWith<_WorkerDetailModel> get copyWith => __$WorkerDetailModelCopyWithImpl<_WorkerDetailModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.age, age) || other.age == age)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wageText, wageText) || other.wageText == wageText)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._workExperiences, _workExperiences)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&const DeepCollectionEquality().equals(other._badges, _badges));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,adCode,statusLabel,age,rating,reviewCount,wageText,avatarUrl,address,const DeepCollectionEquality().hash(_workExperiences),workingHours,phoneNumber,const DeepCollectionEquality().hash(_badges));

@override
String toString() {
  return 'WorkerDetailModel(id: $id, name: $name, adCode: $adCode, statusLabel: $statusLabel, age: $age, rating: $rating, reviewCount: $reviewCount, wageText: $wageText, avatarUrl: $avatarUrl, address: $address, workExperiences: $workExperiences, workingHours: $workingHours, phoneNumber: $phoneNumber, badges: $badges)';
}


}

/// @nodoc
abstract mixin class _$WorkerDetailModelCopyWith<$Res> implements $WorkerDetailModelCopyWith<$Res> {
  factory _$WorkerDetailModelCopyWith(_WorkerDetailModel value, $Res Function(_WorkerDetailModel) _then) = __$WorkerDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String adCode, String statusLabel, int age, double rating, int reviewCount, String wageText, String? avatarUrl, String address, List<String> workExperiences, String workingHours, String phoneNumber, List<String> badges
});




}
/// @nodoc
class __$WorkerDetailModelCopyWithImpl<$Res>
    implements _$WorkerDetailModelCopyWith<$Res> {
  __$WorkerDetailModelCopyWithImpl(this._self, this._then);

  final _WorkerDetailModel _self;
  final $Res Function(_WorkerDetailModel) _then;

/// Create a copy of WorkerDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? adCode = null,Object? statusLabel = null,Object? age = null,Object? rating = null,Object? reviewCount = null,Object? wageText = null,Object? avatarUrl = freezed,Object? address = null,Object? workExperiences = null,Object? workingHours = null,Object? phoneNumber = null,Object? badges = null,}) {
  return _then(_WorkerDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,wageText: null == wageText ? _self.wageText : wageText // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,workExperiences: null == workExperiences ? _self._workExperiences : workExperiences // ignore: cast_nullable_to_non_nullable
as List<String>,workingHours: null == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
