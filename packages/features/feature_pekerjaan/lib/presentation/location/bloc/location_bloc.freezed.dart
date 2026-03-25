// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent()';
}


}

/// @nodoc
class $LocationEventCopyWith<$Res>  {
$LocationEventCopyWith(LocationEvent _, $Res Function(LocationEvent) __);
}


/// Adds pattern-matching-related methods to [LocationEvent].
extension LocationEventPatterns on LocationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SelectCountry value)?  selectCountry,TResult Function( _LoadProvinces value)?  loadProvinces,TResult Function( _SelectProvince value)?  selectProvince,TResult Function( _SelectRegency value)?  selectRegency,TResult Function( _SelectDistrict value)?  selectDistrict,TResult Function( _SelectVillage value)?  selectVillage,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectCountry() when selectCountry != null:
return selectCountry(_that);case _LoadProvinces() when loadProvinces != null:
return loadProvinces(_that);case _SelectProvince() when selectProvince != null:
return selectProvince(_that);case _SelectRegency() when selectRegency != null:
return selectRegency(_that);case _SelectDistrict() when selectDistrict != null:
return selectDistrict(_that);case _SelectVillage() when selectVillage != null:
return selectVillage(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SelectCountry value)  selectCountry,required TResult Function( _LoadProvinces value)  loadProvinces,required TResult Function( _SelectProvince value)  selectProvince,required TResult Function( _SelectRegency value)  selectRegency,required TResult Function( _SelectDistrict value)  selectDistrict,required TResult Function( _SelectVillage value)  selectVillage,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _SelectCountry():
return selectCountry(_that);case _LoadProvinces():
return loadProvinces(_that);case _SelectProvince():
return selectProvince(_that);case _SelectRegency():
return selectRegency(_that);case _SelectDistrict():
return selectDistrict(_that);case _SelectVillage():
return selectVillage(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SelectCountry value)?  selectCountry,TResult? Function( _LoadProvinces value)?  loadProvinces,TResult? Function( _SelectProvince value)?  selectProvince,TResult? Function( _SelectRegency value)?  selectRegency,TResult? Function( _SelectDistrict value)?  selectDistrict,TResult? Function( _SelectVillage value)?  selectVillage,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _SelectCountry() when selectCountry != null:
return selectCountry(_that);case _LoadProvinces() when loadProvinces != null:
return loadProvinces(_that);case _SelectProvince() when selectProvince != null:
return selectProvince(_that);case _SelectRegency() when selectRegency != null:
return selectRegency(_that);case _SelectDistrict() when selectDistrict != null:
return selectDistrict(_that);case _SelectVillage() when selectVillage != null:
return selectVillage(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( dynamic country)?  selectCountry,TResult Function()?  loadProvinces,TResult Function( LocationEntity province)?  selectProvince,TResult Function( LocationEntity regency)?  selectRegency,TResult Function( LocationEntity district)?  selectDistrict,TResult Function( LocationEntity village)?  selectVillage,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectCountry() when selectCountry != null:
return selectCountry(_that.country);case _LoadProvinces() when loadProvinces != null:
return loadProvinces();case _SelectProvince() when selectProvince != null:
return selectProvince(_that.province);case _SelectRegency() when selectRegency != null:
return selectRegency(_that.regency);case _SelectDistrict() when selectDistrict != null:
return selectDistrict(_that.district);case _SelectVillage() when selectVillage != null:
return selectVillage(_that.village);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( dynamic country)  selectCountry,required TResult Function()  loadProvinces,required TResult Function( LocationEntity province)  selectProvince,required TResult Function( LocationEntity regency)  selectRegency,required TResult Function( LocationEntity district)  selectDistrict,required TResult Function( LocationEntity village)  selectVillage,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _SelectCountry():
return selectCountry(_that.country);case _LoadProvinces():
return loadProvinces();case _SelectProvince():
return selectProvince(_that.province);case _SelectRegency():
return selectRegency(_that.regency);case _SelectDistrict():
return selectDistrict(_that.district);case _SelectVillage():
return selectVillage(_that.village);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( dynamic country)?  selectCountry,TResult? Function()?  loadProvinces,TResult? Function( LocationEntity province)?  selectProvince,TResult? Function( LocationEntity regency)?  selectRegency,TResult? Function( LocationEntity district)?  selectDistrict,TResult? Function( LocationEntity village)?  selectVillage,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _SelectCountry() when selectCountry != null:
return selectCountry(_that.country);case _LoadProvinces() when loadProvinces != null:
return loadProvinces();case _SelectProvince() when selectProvince != null:
return selectProvince(_that.province);case _SelectRegency() when selectRegency != null:
return selectRegency(_that.regency);case _SelectDistrict() when selectDistrict != null:
return selectDistrict(_that.district);case _SelectVillage() when selectVillage != null:
return selectVillage(_that.village);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _SelectCountry implements LocationEvent {
  const _SelectCountry(this.country);
  

 final  dynamic country;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCountryCopyWith<_SelectCountry> get copyWith => __$SelectCountryCopyWithImpl<_SelectCountry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectCountry&&const DeepCollectionEquality().equals(other.country, country));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(country));

@override
String toString() {
  return 'LocationEvent.selectCountry(country: $country)';
}


}

/// @nodoc
abstract mixin class _$SelectCountryCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$SelectCountryCopyWith(_SelectCountry value, $Res Function(_SelectCountry) _then) = __$SelectCountryCopyWithImpl;
@useResult
$Res call({
 dynamic country
});




}
/// @nodoc
class __$SelectCountryCopyWithImpl<$Res>
    implements _$SelectCountryCopyWith<$Res> {
  __$SelectCountryCopyWithImpl(this._self, this._then);

  final _SelectCountry _self;
  final $Res Function(_SelectCountry) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? country = freezed,}) {
  return _then(_SelectCountry(
freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class _LoadProvinces implements LocationEvent {
  const _LoadProvinces();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadProvinces);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent.loadProvinces()';
}


}




/// @nodoc


class _SelectProvince implements LocationEvent {
  const _SelectProvince(this.province);
  

 final  LocationEntity province;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectProvinceCopyWith<_SelectProvince> get copyWith => __$SelectProvinceCopyWithImpl<_SelectProvince>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectProvince&&(identical(other.province, province) || other.province == province));
}


@override
int get hashCode => Object.hash(runtimeType,province);

@override
String toString() {
  return 'LocationEvent.selectProvince(province: $province)';
}


}

/// @nodoc
abstract mixin class _$SelectProvinceCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$SelectProvinceCopyWith(_SelectProvince value, $Res Function(_SelectProvince) _then) = __$SelectProvinceCopyWithImpl;
@useResult
$Res call({
 LocationEntity province
});


$LocationEntityCopyWith<$Res> get province;

}
/// @nodoc
class __$SelectProvinceCopyWithImpl<$Res>
    implements _$SelectProvinceCopyWith<$Res> {
  __$SelectProvinceCopyWithImpl(this._self, this._then);

  final _SelectProvince _self;
  final $Res Function(_SelectProvince) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? province = null,}) {
  return _then(_SelectProvince(
null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as LocationEntity,
  ));
}

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res> get province {
  
  return $LocationEntityCopyWith<$Res>(_self.province, (value) {
    return _then(_self.copyWith(province: value));
  });
}
}

/// @nodoc


class _SelectRegency implements LocationEvent {
  const _SelectRegency(this.regency);
  

 final  LocationEntity regency;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectRegencyCopyWith<_SelectRegency> get copyWith => __$SelectRegencyCopyWithImpl<_SelectRegency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectRegency&&(identical(other.regency, regency) || other.regency == regency));
}


@override
int get hashCode => Object.hash(runtimeType,regency);

@override
String toString() {
  return 'LocationEvent.selectRegency(regency: $regency)';
}


}

/// @nodoc
abstract mixin class _$SelectRegencyCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$SelectRegencyCopyWith(_SelectRegency value, $Res Function(_SelectRegency) _then) = __$SelectRegencyCopyWithImpl;
@useResult
$Res call({
 LocationEntity regency
});


$LocationEntityCopyWith<$Res> get regency;

}
/// @nodoc
class __$SelectRegencyCopyWithImpl<$Res>
    implements _$SelectRegencyCopyWith<$Res> {
  __$SelectRegencyCopyWithImpl(this._self, this._then);

  final _SelectRegency _self;
  final $Res Function(_SelectRegency) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? regency = null,}) {
  return _then(_SelectRegency(
null == regency ? _self.regency : regency // ignore: cast_nullable_to_non_nullable
as LocationEntity,
  ));
}

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res> get regency {
  
  return $LocationEntityCopyWith<$Res>(_self.regency, (value) {
    return _then(_self.copyWith(regency: value));
  });
}
}

/// @nodoc


class _SelectDistrict implements LocationEvent {
  const _SelectDistrict(this.district);
  

 final  LocationEntity district;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectDistrictCopyWith<_SelectDistrict> get copyWith => __$SelectDistrictCopyWithImpl<_SelectDistrict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectDistrict&&(identical(other.district, district) || other.district == district));
}


@override
int get hashCode => Object.hash(runtimeType,district);

@override
String toString() {
  return 'LocationEvent.selectDistrict(district: $district)';
}


}

/// @nodoc
abstract mixin class _$SelectDistrictCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$SelectDistrictCopyWith(_SelectDistrict value, $Res Function(_SelectDistrict) _then) = __$SelectDistrictCopyWithImpl;
@useResult
$Res call({
 LocationEntity district
});


$LocationEntityCopyWith<$Res> get district;

}
/// @nodoc
class __$SelectDistrictCopyWithImpl<$Res>
    implements _$SelectDistrictCopyWith<$Res> {
  __$SelectDistrictCopyWithImpl(this._self, this._then);

  final _SelectDistrict _self;
  final $Res Function(_SelectDistrict) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? district = null,}) {
  return _then(_SelectDistrict(
null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as LocationEntity,
  ));
}

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res> get district {
  
  return $LocationEntityCopyWith<$Res>(_self.district, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

/// @nodoc


class _SelectVillage implements LocationEvent {
  const _SelectVillage(this.village);
  

 final  LocationEntity village;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectVillageCopyWith<_SelectVillage> get copyWith => __$SelectVillageCopyWithImpl<_SelectVillage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectVillage&&(identical(other.village, village) || other.village == village));
}


@override
int get hashCode => Object.hash(runtimeType,village);

@override
String toString() {
  return 'LocationEvent.selectVillage(village: $village)';
}


}

/// @nodoc
abstract mixin class _$SelectVillageCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$SelectVillageCopyWith(_SelectVillage value, $Res Function(_SelectVillage) _then) = __$SelectVillageCopyWithImpl;
@useResult
$Res call({
 LocationEntity village
});


$LocationEntityCopyWith<$Res> get village;

}
/// @nodoc
class __$SelectVillageCopyWithImpl<$Res>
    implements _$SelectVillageCopyWith<$Res> {
  __$SelectVillageCopyWithImpl(this._self, this._then);

  final _SelectVillage _self;
  final $Res Function(_SelectVillage) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? village = null,}) {
  return _then(_SelectVillage(
null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as LocationEntity,
  ));
}

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res> get village {
  
  return $LocationEntityCopyWith<$Res>(_self.village, (value) {
    return _then(_self.copyWith(village: value));
  });
}
}

/// @nodoc


class _Reset implements LocationEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent.reset()';
}


}




/// @nodoc
mixin _$LocationState {

// Loading statuses
 LocationLoadStatus get provincesStatus; LocationLoadStatus get regenciesStatus; LocationLoadStatus get districtsStatus; LocationLoadStatus get villagesStatus;// Data lists
 List<LocationEntity> get provinces; List<LocationEntity> get regencies; List<LocationEntity> get districts; List<LocationEntity> get villages;// Selected values (country is stored as LocationItem from UI)
 dynamic get selectedCountry;// Can be LocationItem or null
 LocationEntity? get selectedProvince; LocationEntity? get selectedRegency; LocationEntity? get selectedDistrict; LocationEntity? get selectedVillage;// Error message
 String? get errorMessage;
/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationStateCopyWith<LocationState> get copyWith => _$LocationStateCopyWithImpl<LocationState>(this as LocationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationState&&(identical(other.provincesStatus, provincesStatus) || other.provincesStatus == provincesStatus)&&(identical(other.regenciesStatus, regenciesStatus) || other.regenciesStatus == regenciesStatus)&&(identical(other.districtsStatus, districtsStatus) || other.districtsStatus == districtsStatus)&&(identical(other.villagesStatus, villagesStatus) || other.villagesStatus == villagesStatus)&&const DeepCollectionEquality().equals(other.provinces, provinces)&&const DeepCollectionEquality().equals(other.regencies, regencies)&&const DeepCollectionEquality().equals(other.districts, districts)&&const DeepCollectionEquality().equals(other.villages, villages)&&const DeepCollectionEquality().equals(other.selectedCountry, selectedCountry)&&(identical(other.selectedProvince, selectedProvince) || other.selectedProvince == selectedProvince)&&(identical(other.selectedRegency, selectedRegency) || other.selectedRegency == selectedRegency)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedVillage, selectedVillage) || other.selectedVillage == selectedVillage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,provincesStatus,regenciesStatus,districtsStatus,villagesStatus,const DeepCollectionEquality().hash(provinces),const DeepCollectionEquality().hash(regencies),const DeepCollectionEquality().hash(districts),const DeepCollectionEquality().hash(villages),const DeepCollectionEquality().hash(selectedCountry),selectedProvince,selectedRegency,selectedDistrict,selectedVillage,errorMessage);

@override
String toString() {
  return 'LocationState(provincesStatus: $provincesStatus, regenciesStatus: $regenciesStatus, districtsStatus: $districtsStatus, villagesStatus: $villagesStatus, provinces: $provinces, regencies: $regencies, districts: $districts, villages: $villages, selectedCountry: $selectedCountry, selectedProvince: $selectedProvince, selectedRegency: $selectedRegency, selectedDistrict: $selectedDistrict, selectedVillage: $selectedVillage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LocationStateCopyWith<$Res>  {
  factory $LocationStateCopyWith(LocationState value, $Res Function(LocationState) _then) = _$LocationStateCopyWithImpl;
@useResult
$Res call({
 LocationLoadStatus provincesStatus, LocationLoadStatus regenciesStatus, LocationLoadStatus districtsStatus, LocationLoadStatus villagesStatus, List<LocationEntity> provinces, List<LocationEntity> regencies, List<LocationEntity> districts, List<LocationEntity> villages, dynamic selectedCountry, LocationEntity? selectedProvince, LocationEntity? selectedRegency, LocationEntity? selectedDistrict, LocationEntity? selectedVillage, String? errorMessage
});


$LocationEntityCopyWith<$Res>? get selectedProvince;$LocationEntityCopyWith<$Res>? get selectedRegency;$LocationEntityCopyWith<$Res>? get selectedDistrict;$LocationEntityCopyWith<$Res>? get selectedVillage;

}
/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._self, this._then);

  final LocationState _self;
  final $Res Function(LocationState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provincesStatus = null,Object? regenciesStatus = null,Object? districtsStatus = null,Object? villagesStatus = null,Object? provinces = null,Object? regencies = null,Object? districts = null,Object? villages = null,Object? selectedCountry = freezed,Object? selectedProvince = freezed,Object? selectedRegency = freezed,Object? selectedDistrict = freezed,Object? selectedVillage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
provincesStatus: null == provincesStatus ? _self.provincesStatus : provincesStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,regenciesStatus: null == regenciesStatus ? _self.regenciesStatus : regenciesStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,districtsStatus: null == districtsStatus ? _self.districtsStatus : districtsStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,villagesStatus: null == villagesStatus ? _self.villagesStatus : villagesStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,provinces: null == provinces ? _self.provinces : provinces // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,regencies: null == regencies ? _self.regencies : regencies // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,villages: null == villages ? _self.villages : villages // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,selectedCountry: freezed == selectedCountry ? _self.selectedCountry : selectedCountry // ignore: cast_nullable_to_non_nullable
as dynamic,selectedProvince: freezed == selectedProvince ? _self.selectedProvince : selectedProvince // ignore: cast_nullable_to_non_nullable
as LocationEntity?,selectedRegency: freezed == selectedRegency ? _self.selectedRegency : selectedRegency // ignore: cast_nullable_to_non_nullable
as LocationEntity?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as LocationEntity?,selectedVillage: freezed == selectedVillage ? _self.selectedVillage : selectedVillage // ignore: cast_nullable_to_non_nullable
as LocationEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedProvince {
    if (_self.selectedProvince == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedProvince!, (value) {
    return _then(_self.copyWith(selectedProvince: value));
  });
}/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedRegency {
    if (_self.selectedRegency == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedRegency!, (value) {
    return _then(_self.copyWith(selectedRegency: value));
  });
}/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedDistrict {
    if (_self.selectedDistrict == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedDistrict!, (value) {
    return _then(_self.copyWith(selectedDistrict: value));
  });
}/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedVillage {
    if (_self.selectedVillage == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedVillage!, (value) {
    return _then(_self.copyWith(selectedVillage: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationState value)  $default,){
final _that = this;
switch (_that) {
case _LocationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationState value)?  $default,){
final _that = this;
switch (_that) {
case _LocationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocationLoadStatus provincesStatus,  LocationLoadStatus regenciesStatus,  LocationLoadStatus districtsStatus,  LocationLoadStatus villagesStatus,  List<LocationEntity> provinces,  List<LocationEntity> regencies,  List<LocationEntity> districts,  List<LocationEntity> villages,  dynamic selectedCountry,  LocationEntity? selectedProvince,  LocationEntity? selectedRegency,  LocationEntity? selectedDistrict,  LocationEntity? selectedVillage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationState() when $default != null:
return $default(_that.provincesStatus,_that.regenciesStatus,_that.districtsStatus,_that.villagesStatus,_that.provinces,_that.regencies,_that.districts,_that.villages,_that.selectedCountry,_that.selectedProvince,_that.selectedRegency,_that.selectedDistrict,_that.selectedVillage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocationLoadStatus provincesStatus,  LocationLoadStatus regenciesStatus,  LocationLoadStatus districtsStatus,  LocationLoadStatus villagesStatus,  List<LocationEntity> provinces,  List<LocationEntity> regencies,  List<LocationEntity> districts,  List<LocationEntity> villages,  dynamic selectedCountry,  LocationEntity? selectedProvince,  LocationEntity? selectedRegency,  LocationEntity? selectedDistrict,  LocationEntity? selectedVillage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LocationState():
return $default(_that.provincesStatus,_that.regenciesStatus,_that.districtsStatus,_that.villagesStatus,_that.provinces,_that.regencies,_that.districts,_that.villages,_that.selectedCountry,_that.selectedProvince,_that.selectedRegency,_that.selectedDistrict,_that.selectedVillage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocationLoadStatus provincesStatus,  LocationLoadStatus regenciesStatus,  LocationLoadStatus districtsStatus,  LocationLoadStatus villagesStatus,  List<LocationEntity> provinces,  List<LocationEntity> regencies,  List<LocationEntity> districts,  List<LocationEntity> villages,  dynamic selectedCountry,  LocationEntity? selectedProvince,  LocationEntity? selectedRegency,  LocationEntity? selectedDistrict,  LocationEntity? selectedVillage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LocationState() when $default != null:
return $default(_that.provincesStatus,_that.regenciesStatus,_that.districtsStatus,_that.villagesStatus,_that.provinces,_that.regencies,_that.districts,_that.villages,_that.selectedCountry,_that.selectedProvince,_that.selectedRegency,_that.selectedDistrict,_that.selectedVillage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LocationState extends LocationState {
  const _LocationState({this.provincesStatus = LocationLoadStatus.initial, this.regenciesStatus = LocationLoadStatus.initial, this.districtsStatus = LocationLoadStatus.initial, this.villagesStatus = LocationLoadStatus.initial, final  List<LocationEntity> provinces = const [], final  List<LocationEntity> regencies = const [], final  List<LocationEntity> districts = const [], final  List<LocationEntity> villages = const [], this.selectedCountry, this.selectedProvince, this.selectedRegency, this.selectedDistrict, this.selectedVillage, this.errorMessage}): _provinces = provinces,_regencies = regencies,_districts = districts,_villages = villages,super._();
  

// Loading statuses
@override@JsonKey() final  LocationLoadStatus provincesStatus;
@override@JsonKey() final  LocationLoadStatus regenciesStatus;
@override@JsonKey() final  LocationLoadStatus districtsStatus;
@override@JsonKey() final  LocationLoadStatus villagesStatus;
// Data lists
 final  List<LocationEntity> _provinces;
// Data lists
@override@JsonKey() List<LocationEntity> get provinces {
  if (_provinces is EqualUnmodifiableListView) return _provinces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_provinces);
}

 final  List<LocationEntity> _regencies;
@override@JsonKey() List<LocationEntity> get regencies {
  if (_regencies is EqualUnmodifiableListView) return _regencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regencies);
}

 final  List<LocationEntity> _districts;
@override@JsonKey() List<LocationEntity> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}

 final  List<LocationEntity> _villages;
@override@JsonKey() List<LocationEntity> get villages {
  if (_villages is EqualUnmodifiableListView) return _villages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_villages);
}

// Selected values (country is stored as LocationItem from UI)
@override final  dynamic selectedCountry;
// Can be LocationItem or null
@override final  LocationEntity? selectedProvince;
@override final  LocationEntity? selectedRegency;
@override final  LocationEntity? selectedDistrict;
@override final  LocationEntity? selectedVillage;
// Error message
@override final  String? errorMessage;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationStateCopyWith<_LocationState> get copyWith => __$LocationStateCopyWithImpl<_LocationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationState&&(identical(other.provincesStatus, provincesStatus) || other.provincesStatus == provincesStatus)&&(identical(other.regenciesStatus, regenciesStatus) || other.regenciesStatus == regenciesStatus)&&(identical(other.districtsStatus, districtsStatus) || other.districtsStatus == districtsStatus)&&(identical(other.villagesStatus, villagesStatus) || other.villagesStatus == villagesStatus)&&const DeepCollectionEquality().equals(other._provinces, _provinces)&&const DeepCollectionEquality().equals(other._regencies, _regencies)&&const DeepCollectionEquality().equals(other._districts, _districts)&&const DeepCollectionEquality().equals(other._villages, _villages)&&const DeepCollectionEquality().equals(other.selectedCountry, selectedCountry)&&(identical(other.selectedProvince, selectedProvince) || other.selectedProvince == selectedProvince)&&(identical(other.selectedRegency, selectedRegency) || other.selectedRegency == selectedRegency)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedVillage, selectedVillage) || other.selectedVillage == selectedVillage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,provincesStatus,regenciesStatus,districtsStatus,villagesStatus,const DeepCollectionEquality().hash(_provinces),const DeepCollectionEquality().hash(_regencies),const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_villages),const DeepCollectionEquality().hash(selectedCountry),selectedProvince,selectedRegency,selectedDistrict,selectedVillage,errorMessage);

@override
String toString() {
  return 'LocationState(provincesStatus: $provincesStatus, regenciesStatus: $regenciesStatus, districtsStatus: $districtsStatus, villagesStatus: $villagesStatus, provinces: $provinces, regencies: $regencies, districts: $districts, villages: $villages, selectedCountry: $selectedCountry, selectedProvince: $selectedProvince, selectedRegency: $selectedRegency, selectedDistrict: $selectedDistrict, selectedVillage: $selectedVillage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LocationStateCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory _$LocationStateCopyWith(_LocationState value, $Res Function(_LocationState) _then) = __$LocationStateCopyWithImpl;
@override @useResult
$Res call({
 LocationLoadStatus provincesStatus, LocationLoadStatus regenciesStatus, LocationLoadStatus districtsStatus, LocationLoadStatus villagesStatus, List<LocationEntity> provinces, List<LocationEntity> regencies, List<LocationEntity> districts, List<LocationEntity> villages, dynamic selectedCountry, LocationEntity? selectedProvince, LocationEntity? selectedRegency, LocationEntity? selectedDistrict, LocationEntity? selectedVillage, String? errorMessage
});


@override $LocationEntityCopyWith<$Res>? get selectedProvince;@override $LocationEntityCopyWith<$Res>? get selectedRegency;@override $LocationEntityCopyWith<$Res>? get selectedDistrict;@override $LocationEntityCopyWith<$Res>? get selectedVillage;

}
/// @nodoc
class __$LocationStateCopyWithImpl<$Res>
    implements _$LocationStateCopyWith<$Res> {
  __$LocationStateCopyWithImpl(this._self, this._then);

  final _LocationState _self;
  final $Res Function(_LocationState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provincesStatus = null,Object? regenciesStatus = null,Object? districtsStatus = null,Object? villagesStatus = null,Object? provinces = null,Object? regencies = null,Object? districts = null,Object? villages = null,Object? selectedCountry = freezed,Object? selectedProvince = freezed,Object? selectedRegency = freezed,Object? selectedDistrict = freezed,Object? selectedVillage = freezed,Object? errorMessage = freezed,}) {
  return _then(_LocationState(
provincesStatus: null == provincesStatus ? _self.provincesStatus : provincesStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,regenciesStatus: null == regenciesStatus ? _self.regenciesStatus : regenciesStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,districtsStatus: null == districtsStatus ? _self.districtsStatus : districtsStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,villagesStatus: null == villagesStatus ? _self.villagesStatus : villagesStatus // ignore: cast_nullable_to_non_nullable
as LocationLoadStatus,provinces: null == provinces ? _self._provinces : provinces // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,regencies: null == regencies ? _self._regencies : regencies // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,villages: null == villages ? _self._villages : villages // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,selectedCountry: freezed == selectedCountry ? _self.selectedCountry : selectedCountry // ignore: cast_nullable_to_non_nullable
as dynamic,selectedProvince: freezed == selectedProvince ? _self.selectedProvince : selectedProvince // ignore: cast_nullable_to_non_nullable
as LocationEntity?,selectedRegency: freezed == selectedRegency ? _self.selectedRegency : selectedRegency // ignore: cast_nullable_to_non_nullable
as LocationEntity?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as LocationEntity?,selectedVillage: freezed == selectedVillage ? _self.selectedVillage : selectedVillage // ignore: cast_nullable_to_non_nullable
as LocationEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedProvince {
    if (_self.selectedProvince == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedProvince!, (value) {
    return _then(_self.copyWith(selectedProvince: value));
  });
}/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedRegency {
    if (_self.selectedRegency == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedRegency!, (value) {
    return _then(_self.copyWith(selectedRegency: value));
  });
}/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedDistrict {
    if (_self.selectedDistrict == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedDistrict!, (value) {
    return _then(_self.copyWith(selectedDistrict: value));
  });
}/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get selectedVillage {
    if (_self.selectedVillage == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.selectedVillage!, (value) {
    return _then(_self.copyWith(selectedVillage: value));
  });
}
}

// dart format on
