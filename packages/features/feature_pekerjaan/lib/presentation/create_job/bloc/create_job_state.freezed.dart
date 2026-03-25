// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_job_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateJobState {

 TextInput get title; TextInput get description; TextInput get requirements; List<File> get images; String get salaryType;// Changed: dropdown for salary type
 String get salaryAmount;// Changed: currency input
 String get workerCount; DateTime? get selectedDate; TimeOfDay? get selectedTime; TextInput get address; String? get selectedProvince; String? get selectedCity; String? get selectedDistrict; String? get selectedWard; TextInput get village;// New field
 FormzSubmissionStatus get status; JobFailure? get failure;// Using shared JobFailure
// GPS coordinates — nullable (GPS may not be available)
 double? get latitude; double? get longitude;
/// Create a copy of CreateJobState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateJobStateCopyWith<CreateJobState> get copyWith => _$CreateJobStateCopyWithImpl<CreateJobState>(this as CreateJobState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateJobState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.salaryType, salaryType) || other.salaryType == salaryType)&&(identical(other.salaryAmount, salaryAmount) || other.salaryAmount == salaryAmount)&&(identical(other.workerCount, workerCount) || other.workerCount == workerCount)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.address, address) || other.address == address)&&(identical(other.selectedProvince, selectedProvince) || other.selectedProvince == selectedProvince)&&(identical(other.selectedCity, selectedCity) || other.selectedCity == selectedCity)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedWard, selectedWard) || other.selectedWard == selectedWard)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hashAll([runtimeType,title,description,requirements,const DeepCollectionEquality().hash(images),salaryType,salaryAmount,workerCount,selectedDate,selectedTime,address,selectedProvince,selectedCity,selectedDistrict,selectedWard,village,status,failure,latitude,longitude]);

@override
String toString() {
  return 'CreateJobState(title: $title, description: $description, requirements: $requirements, images: $images, salaryType: $salaryType, salaryAmount: $salaryAmount, workerCount: $workerCount, selectedDate: $selectedDate, selectedTime: $selectedTime, address: $address, selectedProvince: $selectedProvince, selectedCity: $selectedCity, selectedDistrict: $selectedDistrict, selectedWard: $selectedWard, village: $village, status: $status, failure: $failure, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CreateJobStateCopyWith<$Res>  {
  factory $CreateJobStateCopyWith(CreateJobState value, $Res Function(CreateJobState) _then) = _$CreateJobStateCopyWithImpl;
@useResult
$Res call({
 TextInput title, TextInput description, TextInput requirements, List<File> images, String salaryType, String salaryAmount, String workerCount, DateTime? selectedDate, TimeOfDay? selectedTime, TextInput address, String? selectedProvince, String? selectedCity, String? selectedDistrict, String? selectedWard, TextInput village, FormzSubmissionStatus status, JobFailure? failure, double? latitude, double? longitude
});


$JobFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$CreateJobStateCopyWithImpl<$Res>
    implements $CreateJobStateCopyWith<$Res> {
  _$CreateJobStateCopyWithImpl(this._self, this._then);

  final CreateJobState _self;
  final $Res Function(CreateJobState) _then;

/// Create a copy of CreateJobState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? requirements = null,Object? images = null,Object? salaryType = null,Object? salaryAmount = null,Object? workerCount = null,Object? selectedDate = freezed,Object? selectedTime = freezed,Object? address = null,Object? selectedProvince = freezed,Object? selectedCity = freezed,Object? selectedDistrict = freezed,Object? selectedWard = freezed,Object? village = null,Object? status = null,Object? failure = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as TextInput,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as TextInput,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as TextInput,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<File>,salaryType: null == salaryType ? _self.salaryType : salaryType // ignore: cast_nullable_to_non_nullable
as String,salaryAmount: null == salaryAmount ? _self.salaryAmount : salaryAmount // ignore: cast_nullable_to_non_nullable
as String,workerCount: null == workerCount ? _self.workerCount : workerCount // ignore: cast_nullable_to_non_nullable
as String,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as TextInput,selectedProvince: freezed == selectedProvince ? _self.selectedProvince : selectedProvince // ignore: cast_nullable_to_non_nullable
as String?,selectedCity: freezed == selectedCity ? _self.selectedCity : selectedCity // ignore: cast_nullable_to_non_nullable
as String?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as String?,selectedWard: freezed == selectedWard ? _self.selectedWard : selectedWard // ignore: cast_nullable_to_non_nullable
as String?,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as TextInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as JobFailure?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of CreateJobState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $JobFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateJobState].
extension CreateJobStatePatterns on CreateJobState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateJobState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateJobState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateJobState value)  $default,){
final _that = this;
switch (_that) {
case _CreateJobState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateJobState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateJobState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextInput title,  TextInput description,  TextInput requirements,  List<File> images,  String salaryType,  String salaryAmount,  String workerCount,  DateTime? selectedDate,  TimeOfDay? selectedTime,  TextInput address,  String? selectedProvince,  String? selectedCity,  String? selectedDistrict,  String? selectedWard,  TextInput village,  FormzSubmissionStatus status,  JobFailure? failure,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateJobState() when $default != null:
return $default(_that.title,_that.description,_that.requirements,_that.images,_that.salaryType,_that.salaryAmount,_that.workerCount,_that.selectedDate,_that.selectedTime,_that.address,_that.selectedProvince,_that.selectedCity,_that.selectedDistrict,_that.selectedWard,_that.village,_that.status,_that.failure,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextInput title,  TextInput description,  TextInput requirements,  List<File> images,  String salaryType,  String salaryAmount,  String workerCount,  DateTime? selectedDate,  TimeOfDay? selectedTime,  TextInput address,  String? selectedProvince,  String? selectedCity,  String? selectedDistrict,  String? selectedWard,  TextInput village,  FormzSubmissionStatus status,  JobFailure? failure,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _CreateJobState():
return $default(_that.title,_that.description,_that.requirements,_that.images,_that.salaryType,_that.salaryAmount,_that.workerCount,_that.selectedDate,_that.selectedTime,_that.address,_that.selectedProvince,_that.selectedCity,_that.selectedDistrict,_that.selectedWard,_that.village,_that.status,_that.failure,_that.latitude,_that.longitude);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextInput title,  TextInput description,  TextInput requirements,  List<File> images,  String salaryType,  String salaryAmount,  String workerCount,  DateTime? selectedDate,  TimeOfDay? selectedTime,  TextInput address,  String? selectedProvince,  String? selectedCity,  String? selectedDistrict,  String? selectedWard,  TextInput village,  FormzSubmissionStatus status,  JobFailure? failure,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _CreateJobState() when $default != null:
return $default(_that.title,_that.description,_that.requirements,_that.images,_that.salaryType,_that.salaryAmount,_that.workerCount,_that.selectedDate,_that.selectedTime,_that.address,_that.selectedProvince,_that.selectedCity,_that.selectedDistrict,_that.selectedWard,_that.village,_that.status,_that.failure,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _CreateJobState extends CreateJobState {
  const _CreateJobState({this.title = const TextInput.pure(), this.description = const TextInput.pure(), this.requirements = const TextInput.pure(), final  List<File> images = const [], this.salaryType = '', this.salaryAmount = '', this.workerCount = '', this.selectedDate, this.selectedTime, this.address = const TextInput.pure(), this.selectedProvince, this.selectedCity, this.selectedDistrict, this.selectedWard, this.village = const TextInput.pure(), this.status = FormzSubmissionStatus.initial, this.failure, this.latitude, this.longitude}): _images = images,super._();
  

@override@JsonKey() final  TextInput title;
@override@JsonKey() final  TextInput description;
@override@JsonKey() final  TextInput requirements;
 final  List<File> _images;
@override@JsonKey() List<File> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey() final  String salaryType;
// Changed: dropdown for salary type
@override@JsonKey() final  String salaryAmount;
// Changed: currency input
@override@JsonKey() final  String workerCount;
@override final  DateTime? selectedDate;
@override final  TimeOfDay? selectedTime;
@override@JsonKey() final  TextInput address;
@override final  String? selectedProvince;
@override final  String? selectedCity;
@override final  String? selectedDistrict;
@override final  String? selectedWard;
@override@JsonKey() final  TextInput village;
// New field
@override@JsonKey() final  FormzSubmissionStatus status;
@override final  JobFailure? failure;
// Using shared JobFailure
// GPS coordinates — nullable (GPS may not be available)
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of CreateJobState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateJobStateCopyWith<_CreateJobState> get copyWith => __$CreateJobStateCopyWithImpl<_CreateJobState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateJobState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.salaryType, salaryType) || other.salaryType == salaryType)&&(identical(other.salaryAmount, salaryAmount) || other.salaryAmount == salaryAmount)&&(identical(other.workerCount, workerCount) || other.workerCount == workerCount)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.address, address) || other.address == address)&&(identical(other.selectedProvince, selectedProvince) || other.selectedProvince == selectedProvince)&&(identical(other.selectedCity, selectedCity) || other.selectedCity == selectedCity)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedWard, selectedWard) || other.selectedWard == selectedWard)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hashAll([runtimeType,title,description,requirements,const DeepCollectionEquality().hash(_images),salaryType,salaryAmount,workerCount,selectedDate,selectedTime,address,selectedProvince,selectedCity,selectedDistrict,selectedWard,village,status,failure,latitude,longitude]);

@override
String toString() {
  return 'CreateJobState(title: $title, description: $description, requirements: $requirements, images: $images, salaryType: $salaryType, salaryAmount: $salaryAmount, workerCount: $workerCount, selectedDate: $selectedDate, selectedTime: $selectedTime, address: $address, selectedProvince: $selectedProvince, selectedCity: $selectedCity, selectedDistrict: $selectedDistrict, selectedWard: $selectedWard, village: $village, status: $status, failure: $failure, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CreateJobStateCopyWith<$Res> implements $CreateJobStateCopyWith<$Res> {
  factory _$CreateJobStateCopyWith(_CreateJobState value, $Res Function(_CreateJobState) _then) = __$CreateJobStateCopyWithImpl;
@override @useResult
$Res call({
 TextInput title, TextInput description, TextInput requirements, List<File> images, String salaryType, String salaryAmount, String workerCount, DateTime? selectedDate, TimeOfDay? selectedTime, TextInput address, String? selectedProvince, String? selectedCity, String? selectedDistrict, String? selectedWard, TextInput village, FormzSubmissionStatus status, JobFailure? failure, double? latitude, double? longitude
});


@override $JobFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$CreateJobStateCopyWithImpl<$Res>
    implements _$CreateJobStateCopyWith<$Res> {
  __$CreateJobStateCopyWithImpl(this._self, this._then);

  final _CreateJobState _self;
  final $Res Function(_CreateJobState) _then;

/// Create a copy of CreateJobState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? requirements = null,Object? images = null,Object? salaryType = null,Object? salaryAmount = null,Object? workerCount = null,Object? selectedDate = freezed,Object? selectedTime = freezed,Object? address = null,Object? selectedProvince = freezed,Object? selectedCity = freezed,Object? selectedDistrict = freezed,Object? selectedWard = freezed,Object? village = null,Object? status = null,Object? failure = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_CreateJobState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as TextInput,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as TextInput,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as TextInput,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<File>,salaryType: null == salaryType ? _self.salaryType : salaryType // ignore: cast_nullable_to_non_nullable
as String,salaryAmount: null == salaryAmount ? _self.salaryAmount : salaryAmount // ignore: cast_nullable_to_non_nullable
as String,workerCount: null == workerCount ? _self.workerCount : workerCount // ignore: cast_nullable_to_non_nullable
as String,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as TextInput,selectedProvince: freezed == selectedProvince ? _self.selectedProvince : selectedProvince // ignore: cast_nullable_to_non_nullable
as String?,selectedCity: freezed == selectedCity ? _self.selectedCity : selectedCity // ignore: cast_nullable_to_non_nullable
as String?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as String?,selectedWard: freezed == selectedWard ? _self.selectedWard : selectedWard // ignore: cast_nullable_to_non_nullable
as String?,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as TextInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as JobFailure?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of CreateJobState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $JobFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
