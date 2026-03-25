// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_training_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTrainingAdState {

 String get email; String get companyName; String get position; String get title; String get description; String get date; String get time; String get location; String get country; String get cost; bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of CreateTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTrainingAdStateCopyWith<CreateTrainingAdState> get copyWith => _$CreateTrainingAdStateCopyWithImpl<CreateTrainingAdState>(this as CreateTrainingAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTrainingAdState&&(identical(other.email, email) || other.email == email)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.position, position) || other.position == position)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.country, country) || other.country == country)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,companyName,position,title,description,date,time,location,country,cost,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'CreateTrainingAdState(email: $email, companyName: $companyName, position: $position, title: $title, description: $description, date: $date, time: $time, location: $location, country: $country, cost: $cost, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CreateTrainingAdStateCopyWith<$Res>  {
  factory $CreateTrainingAdStateCopyWith(CreateTrainingAdState value, $Res Function(CreateTrainingAdState) _then) = _$CreateTrainingAdStateCopyWithImpl;
@useResult
$Res call({
 String email, String companyName, String position, String title, String description, String date, String time, String location, String country, String cost, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$CreateTrainingAdStateCopyWithImpl<$Res>
    implements $CreateTrainingAdStateCopyWith<$Res> {
  _$CreateTrainingAdStateCopyWithImpl(this._self, this._then);

  final CreateTrainingAdState _self;
  final $Res Function(CreateTrainingAdState) _then;

/// Create a copy of CreateTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? companyName = null,Object? position = null,Object? title = null,Object? description = null,Object? date = null,Object? time = null,Object? location = null,Object? country = null,Object? cost = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTrainingAdState].
extension CreateTrainingAdStatePatterns on CreateTrainingAdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTrainingAdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTrainingAdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTrainingAdState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTrainingAdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTrainingAdState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTrainingAdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String companyName,  String position,  String title,  String description,  String date,  String time,  String location,  String country,  String cost,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTrainingAdState() when $default != null:
return $default(_that.email,_that.companyName,_that.position,_that.title,_that.description,_that.date,_that.time,_that.location,_that.country,_that.cost,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String companyName,  String position,  String title,  String description,  String date,  String time,  String location,  String country,  String cost,  bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CreateTrainingAdState():
return $default(_that.email,_that.companyName,_that.position,_that.title,_that.description,_that.date,_that.time,_that.location,_that.country,_that.cost,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String companyName,  String position,  String title,  String description,  String date,  String time,  String location,  String country,  String cost,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CreateTrainingAdState() when $default != null:
return $default(_that.email,_that.companyName,_that.position,_that.title,_that.description,_that.date,_that.time,_that.location,_that.country,_that.cost,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTrainingAdState extends CreateTrainingAdState {
  const _CreateTrainingAdState({this.email = 'ridwanaam@gmail.com', this.companyName = 'PT ABC', this.position = 'Oprasional HEad', this.title = 'SkillUp: Pelatihan Peningkatan Keterampilan Pekerja', this.description = 'Pelatihan ini dirancang untuk meningkatkan keterampilan teknis dan produktivitas pekerja kerah biru.', this.date = '22/06/2025', this.time = '14:00', this.location = 'Gedung Pertemuan RW Jl Pisang BAru RT 01 RW 03', this.country = 'Indonesia', this.cost = 'Pernah jadi tukang masak di warteg, dan pernah jadi kurir angkut', this.isSubmitting = false, this.isSuccess = false, this.errorMessage}): super._();
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String companyName;
@override@JsonKey() final  String position;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String date;
@override@JsonKey() final  String time;
@override@JsonKey() final  String location;
@override@JsonKey() final  String country;
@override@JsonKey() final  String cost;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of CreateTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTrainingAdStateCopyWith<_CreateTrainingAdState> get copyWith => __$CreateTrainingAdStateCopyWithImpl<_CreateTrainingAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTrainingAdState&&(identical(other.email, email) || other.email == email)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.position, position) || other.position == position)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.country, country) || other.country == country)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,companyName,position,title,description,date,time,location,country,cost,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'CreateTrainingAdState(email: $email, companyName: $companyName, position: $position, title: $title, description: $description, date: $date, time: $time, location: $location, country: $country, cost: $cost, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CreateTrainingAdStateCopyWith<$Res> implements $CreateTrainingAdStateCopyWith<$Res> {
  factory _$CreateTrainingAdStateCopyWith(_CreateTrainingAdState value, $Res Function(_CreateTrainingAdState) _then) = __$CreateTrainingAdStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String companyName, String position, String title, String description, String date, String time, String location, String country, String cost, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$CreateTrainingAdStateCopyWithImpl<$Res>
    implements _$CreateTrainingAdStateCopyWith<$Res> {
  __$CreateTrainingAdStateCopyWithImpl(this._self, this._then);

  final _CreateTrainingAdState _self;
  final $Res Function(_CreateTrainingAdState) _then;

/// Create a copy of CreateTrainingAdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? companyName = null,Object? position = null,Object? title = null,Object? description = null,Object? date = null,Object? time = null,Object? location = null,Object? country = null,Object? cost = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_CreateTrainingAdState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
