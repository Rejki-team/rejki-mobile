// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_used_goods_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateUsedGoodsAdState {

 String get title; String get description; String get condition; String get amount; List<File> get selectedImages; String get address; String get province; String get city; String get subdistrict; String get village; bool get isRequesting; bool get isSuccess; String? get errorMessage; double? get latitude; double? get longitude;
/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUsedGoodsAdStateCopyWith<CreateUsedGoodsAdState> get copyWith => _$CreateUsedGoodsAdStateCopyWithImpl<CreateUsedGoodsAdState>(this as CreateUsedGoodsAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUsedGoodsAdState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other.selectedImages, selectedImages)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.village, village) || other.village == village)&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,condition,amount,const DeepCollectionEquality().hash(selectedImages),address,province,city,subdistrict,village,isRequesting,isSuccess,errorMessage,latitude,longitude);

@override
String toString() {
  return 'CreateUsedGoodsAdState(title: $title, description: $description, condition: $condition, amount: $amount, selectedImages: $selectedImages, address: $address, province: $province, city: $city, subdistrict: $subdistrict, village: $village, isRequesting: $isRequesting, isSuccess: $isSuccess, errorMessage: $errorMessage, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CreateUsedGoodsAdStateCopyWith<$Res>  {
  factory $CreateUsedGoodsAdStateCopyWith(CreateUsedGoodsAdState value, $Res Function(CreateUsedGoodsAdState) _then) = _$CreateUsedGoodsAdStateCopyWithImpl;
@useResult
$Res call({
 String title, String description, String condition, String amount, List<File> selectedImages, String address, String province, String city, String subdistrict, String village, bool isRequesting, bool isSuccess, String? errorMessage, double? latitude, double? longitude
});




}
/// @nodoc
class _$CreateUsedGoodsAdStateCopyWithImpl<$Res>
    implements $CreateUsedGoodsAdStateCopyWith<$Res> {
  _$CreateUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final CreateUsedGoodsAdState _self;
  final $Res Function(CreateUsedGoodsAdState) _then;

/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? selectedImages = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? village = null,Object? isRequesting = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,selectedImages: null == selectedImages ? _self.selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<File>,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUsedGoodsAdState].
extension CreateUsedGoodsAdStatePatterns on CreateUsedGoodsAdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUsedGoodsAdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUsedGoodsAdState value)  $default,){
final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUsedGoodsAdState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String condition,  String amount,  List<File> selectedImages,  String address,  String province,  String city,  String subdistrict,  String village,  bool isRequesting,  bool isSuccess,  String? errorMessage,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
return $default(_that.title,_that.description,_that.condition,_that.amount,_that.selectedImages,_that.address,_that.province,_that.city,_that.subdistrict,_that.village,_that.isRequesting,_that.isSuccess,_that.errorMessage,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String condition,  String amount,  List<File> selectedImages,  String address,  String province,  String city,  String subdistrict,  String village,  bool isRequesting,  bool isSuccess,  String? errorMessage,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState():
return $default(_that.title,_that.description,_that.condition,_that.amount,_that.selectedImages,_that.address,_that.province,_that.city,_that.subdistrict,_that.village,_that.isRequesting,_that.isSuccess,_that.errorMessage,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String condition,  String amount,  List<File> selectedImages,  String address,  String province,  String city,  String subdistrict,  String village,  bool isRequesting,  bool isSuccess,  String? errorMessage,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _CreateUsedGoodsAdState() when $default != null:
return $default(_that.title,_that.description,_that.condition,_that.amount,_that.selectedImages,_that.address,_that.province,_that.city,_that.subdistrict,_that.village,_that.isRequesting,_that.isSuccess,_that.errorMessage,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _CreateUsedGoodsAdState extends CreateUsedGoodsAdState {
  const _CreateUsedGoodsAdState({this.title = '', this.description = '', this.condition = '', this.amount = '', final  List<File> selectedImages = const [], this.address = '', this.province = '', this.city = '', this.subdistrict = '', this.village = '', this.isRequesting = false, this.isSuccess = false, this.errorMessage, this.latitude, this.longitude}): _selectedImages = selectedImages,super._();
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String condition;
@override@JsonKey() final  String amount;
 final  List<File> _selectedImages;
@override@JsonKey() List<File> get selectedImages {
  if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImages);
}

@override@JsonKey() final  String address;
@override@JsonKey() final  String province;
@override@JsonKey() final  String city;
@override@JsonKey() final  String subdistrict;
@override@JsonKey() final  String village;
@override@JsonKey() final  bool isRequesting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUsedGoodsAdStateCopyWith<_CreateUsedGoodsAdState> get copyWith => __$CreateUsedGoodsAdStateCopyWithImpl<_CreateUsedGoodsAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUsedGoodsAdState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other._selectedImages, _selectedImages)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.village, village) || other.village == village)&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,condition,amount,const DeepCollectionEquality().hash(_selectedImages),address,province,city,subdistrict,village,isRequesting,isSuccess,errorMessage,latitude,longitude);

@override
String toString() {
  return 'CreateUsedGoodsAdState(title: $title, description: $description, condition: $condition, amount: $amount, selectedImages: $selectedImages, address: $address, province: $province, city: $city, subdistrict: $subdistrict, village: $village, isRequesting: $isRequesting, isSuccess: $isSuccess, errorMessage: $errorMessage, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CreateUsedGoodsAdStateCopyWith<$Res> implements $CreateUsedGoodsAdStateCopyWith<$Res> {
  factory _$CreateUsedGoodsAdStateCopyWith(_CreateUsedGoodsAdState value, $Res Function(_CreateUsedGoodsAdState) _then) = __$CreateUsedGoodsAdStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String condition, String amount, List<File> selectedImages, String address, String province, String city, String subdistrict, String village, bool isRequesting, bool isSuccess, String? errorMessage, double? latitude, double? longitude
});




}
/// @nodoc
class __$CreateUsedGoodsAdStateCopyWithImpl<$Res>
    implements _$CreateUsedGoodsAdStateCopyWith<$Res> {
  __$CreateUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final _CreateUsedGoodsAdState _self;
  final $Res Function(_CreateUsedGoodsAdState) _then;

/// Create a copy of CreateUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? selectedImages = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? village = null,Object? isRequesting = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_CreateUsedGoodsAdState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,selectedImages: null == selectedImages ? _self._selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<File>,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
