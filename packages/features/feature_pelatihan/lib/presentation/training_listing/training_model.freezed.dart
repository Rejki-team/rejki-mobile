// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingModel {

 String get id; String? get imageUrl; String get title; String get description; String get date; String get time; String get location; List<String> get facilities; String get fee; String get feeNotice;
/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingModelCopyWith<TrainingModel> get copyWith => _$TrainingModelCopyWithImpl<TrainingModel>(this as TrainingModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.facilities, facilities)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.feeNotice, feeNotice) || other.feeNotice == feeNotice));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,title,description,date,time,location,const DeepCollectionEquality().hash(facilities),fee,feeNotice);

@override
String toString() {
  return 'TrainingModel(id: $id, imageUrl: $imageUrl, title: $title, description: $description, date: $date, time: $time, location: $location, facilities: $facilities, fee: $fee, feeNotice: $feeNotice)';
}


}

/// @nodoc
abstract mixin class $TrainingModelCopyWith<$Res>  {
  factory $TrainingModelCopyWith(TrainingModel value, $Res Function(TrainingModel) _then) = _$TrainingModelCopyWithImpl;
@useResult
$Res call({
 String id, String? imageUrl, String title, String description, String date, String time, String location, List<String> facilities, String fee, String feeNotice
});




}
/// @nodoc
class _$TrainingModelCopyWithImpl<$Res>
    implements $TrainingModelCopyWith<$Res> {
  _$TrainingModelCopyWithImpl(this._self, this._then);

  final TrainingModel _self;
  final $Res Function(TrainingModel) _then;

/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = freezed,Object? title = null,Object? description = null,Object? date = null,Object? time = null,Object? location = null,Object? facilities = null,Object? fee = null,Object? feeNotice = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,facilities: null == facilities ? _self.facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<String>,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as String,feeNotice: null == feeNotice ? _self.feeNotice : feeNotice // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingModel].
extension TrainingModelPatterns on TrainingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String title,  String description,  String date,  String time,  String location,  List<String> facilities,  String fee,  String feeNotice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.description,_that.date,_that.time,_that.location,_that.facilities,_that.fee,_that.feeNotice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String title,  String description,  String date,  String time,  String location,  List<String> facilities,  String fee,  String feeNotice)  $default,) {final _that = this;
switch (_that) {
case _TrainingModel():
return $default(_that.id,_that.imageUrl,_that.title,_that.description,_that.date,_that.time,_that.location,_that.facilities,_that.fee,_that.feeNotice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? imageUrl,  String title,  String description,  String date,  String time,  String location,  List<String> facilities,  String fee,  String feeNotice)?  $default,) {final _that = this;
switch (_that) {
case _TrainingModel() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.description,_that.date,_that.time,_that.location,_that.facilities,_that.fee,_that.feeNotice);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingModel implements TrainingModel {
  const _TrainingModel({required this.id, this.imageUrl, required this.title, required this.description, required this.date, required this.time, required this.location, required final  List<String> facilities, required this.fee, required this.feeNotice}): _facilities = facilities;
  

@override final  String id;
@override final  String? imageUrl;
@override final  String title;
@override final  String description;
@override final  String date;
@override final  String time;
@override final  String location;
 final  List<String> _facilities;
@override List<String> get facilities {
  if (_facilities is EqualUnmodifiableListView) return _facilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facilities);
}

@override final  String fee;
@override final  String feeNotice;

/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingModelCopyWith<_TrainingModel> get copyWith => __$TrainingModelCopyWithImpl<_TrainingModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._facilities, _facilities)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.feeNotice, feeNotice) || other.feeNotice == feeNotice));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,title,description,date,time,location,const DeepCollectionEquality().hash(_facilities),fee,feeNotice);

@override
String toString() {
  return 'TrainingModel(id: $id, imageUrl: $imageUrl, title: $title, description: $description, date: $date, time: $time, location: $location, facilities: $facilities, fee: $fee, feeNotice: $feeNotice)';
}


}

/// @nodoc
abstract mixin class _$TrainingModelCopyWith<$Res> implements $TrainingModelCopyWith<$Res> {
  factory _$TrainingModelCopyWith(_TrainingModel value, $Res Function(_TrainingModel) _then) = __$TrainingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? imageUrl, String title, String description, String date, String time, String location, List<String> facilities, String fee, String feeNotice
});




}
/// @nodoc
class __$TrainingModelCopyWithImpl<$Res>
    implements _$TrainingModelCopyWith<$Res> {
  __$TrainingModelCopyWithImpl(this._self, this._then);

  final _TrainingModel _self;
  final $Res Function(_TrainingModel) _then;

/// Create a copy of TrainingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = freezed,Object? title = null,Object? description = null,Object? date = null,Object? time = null,Object? location = null,Object? facilities = null,Object? fee = null,Object? feeNotice = null,}) {
  return _then(_TrainingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,facilities: null == facilities ? _self._facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<String>,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as String,feeNotice: null == feeNotice ? _self.feeNotice : feeNotice // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
