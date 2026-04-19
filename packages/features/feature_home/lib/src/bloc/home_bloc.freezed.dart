// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadRequested value)?  loadRequested,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _LoadMoreRequested value)?  loadMoreRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadRequested() when loadRequested != null:
return loadRequested(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _LoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadRequested value)  loadRequested,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _LoadMoreRequested value)  loadMoreRequested,}){
final _that = this;
switch (_that) {
case _LoadRequested():
return loadRequested(_that);case _RefreshRequested():
return refreshRequested(_that);case _LoadMoreRequested():
return loadMoreRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadRequested value)?  loadRequested,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _LoadMoreRequested value)?  loadMoreRequested,}){
final _that = this;
switch (_that) {
case _LoadRequested() when loadRequested != null:
return loadRequested(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _LoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadRequested,TResult Function()?  refreshRequested,TResult Function()?  loadMoreRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadRequested() when loadRequested != null:
return loadRequested();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _LoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadRequested,required TResult Function()  refreshRequested,required TResult Function()  loadMoreRequested,}) {final _that = this;
switch (_that) {
case _LoadRequested():
return loadRequested();case _RefreshRequested():
return refreshRequested();case _LoadMoreRequested():
return loadMoreRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadRequested,TResult? Function()?  refreshRequested,TResult? Function()?  loadMoreRequested,}) {final _that = this;
switch (_that) {
case _LoadRequested() when loadRequested != null:
return loadRequested();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _LoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested();case _:
  return null;

}
}

}

/// @nodoc


class _LoadRequested implements HomeEvent {
  const _LoadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.loadRequested()';
}


}




/// @nodoc


class _RefreshRequested implements HomeEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.refreshRequested()';
}


}




/// @nodoc


class _LoadMoreRequested implements HomeEvent {
  const _LoadMoreRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.loadMoreRequested()';
}


}




/// @nodoc
mixin _$HomeState {

/// Status loading saat ini
 HomeStatus get status;/// Pesan error jika status failure
 String? get errorMessage;/// Nama pengguna untuk header (dari user_info.full_name)
 String get userName;/// Status verifikasi pengguna: 'verified', 'pending', 'not_verified', atau '' jika belum di-load
///
/// Digunakan oleh HomeHeader untuk menentukan apakah menampilkan
/// avatar + nama, atau tombol "Verifikasi".
 String get userVerificationStatus;/// Path foto profil pengguna dari API (kosong jika belum upload).
///
/// Gunakan [ApiConfig.buildImageUrl] untuk membentuk URL lengkap
/// sebelum meneruskan ke [HomeProfileAvatar].
 String get userProfilePhotoPath;/// Jumlah notifikasi yang belum dibaca
 int get notificationCount;/// List banner/carousel items
 List<dynamic> get banners;/// List kategori layanan
 List<dynamic> get categories;/// Latest jobs from API (max 2 for home page display)
 List<JobEntity> get latestJobs;/// List featured items (job cards, etc.)
 List<dynamic> get featuredItems;/// Flag untuk menandakan sedang refresh (pull-to-refresh)
 bool get isRefreshing;/// Flag untuk infinite scroll - sudah mencapai akhir data
 bool get hasReachedMax;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userVerificationStatus, userVerificationStatus) || other.userVerificationStatus == userVerificationStatus)&&(identical(other.userProfilePhotoPath, userProfilePhotoPath) || other.userProfilePhotoPath == userProfilePhotoPath)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&const DeepCollectionEquality().equals(other.banners, banners)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.latestJobs, latestJobs)&&const DeepCollectionEquality().equals(other.featuredItems, featuredItems)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,userName,userVerificationStatus,userProfilePhotoPath,notificationCount,const DeepCollectionEquality().hash(banners),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(latestJobs),const DeepCollectionEquality().hash(featuredItems),isRefreshing,hasReachedMax);

@override
String toString() {
  return 'HomeState(status: $status, errorMessage: $errorMessage, userName: $userName, userVerificationStatus: $userVerificationStatus, userProfilePhotoPath: $userProfilePhotoPath, notificationCount: $notificationCount, banners: $banners, categories: $categories, latestJobs: $latestJobs, featuredItems: $featuredItems, isRefreshing: $isRefreshing, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeStatus status, String? errorMessage, String userName, String userVerificationStatus, String userProfilePhotoPath, int notificationCount, List<dynamic> banners, List<dynamic> categories, List<JobEntity> latestJobs, List<dynamic> featuredItems, bool isRefreshing, bool hasReachedMax
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,Object? userName = null,Object? userVerificationStatus = null,Object? userProfilePhotoPath = null,Object? notificationCount = null,Object? banners = null,Object? categories = null,Object? latestJobs = null,Object? featuredItems = null,Object? isRefreshing = null,Object? hasReachedMax = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userVerificationStatus: null == userVerificationStatus ? _self.userVerificationStatus : userVerificationStatus // ignore: cast_nullable_to_non_nullable
as String,userProfilePhotoPath: null == userProfilePhotoPath ? _self.userProfilePhotoPath : userProfilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<dynamic>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>,latestJobs: null == latestJobs ? _self.latestJobs : latestJobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,featuredItems: null == featuredItems ? _self.featuredItems : featuredItems // ignore: cast_nullable_to_non_nullable
as List<dynamic>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeStatus status,  String? errorMessage,  String userName,  String userVerificationStatus,  String userProfilePhotoPath,  int notificationCount,  List<dynamic> banners,  List<dynamic> categories,  List<JobEntity> latestJobs,  List<dynamic> featuredItems,  bool isRefreshing,  bool hasReachedMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.userName,_that.userVerificationStatus,_that.userProfilePhotoPath,_that.notificationCount,_that.banners,_that.categories,_that.latestJobs,_that.featuredItems,_that.isRefreshing,_that.hasReachedMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeStatus status,  String? errorMessage,  String userName,  String userVerificationStatus,  String userProfilePhotoPath,  int notificationCount,  List<dynamic> banners,  List<dynamic> categories,  List<JobEntity> latestJobs,  List<dynamic> featuredItems,  bool isRefreshing,  bool hasReachedMax)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.status,_that.errorMessage,_that.userName,_that.userVerificationStatus,_that.userProfilePhotoPath,_that.notificationCount,_that.banners,_that.categories,_that.latestJobs,_that.featuredItems,_that.isRefreshing,_that.hasReachedMax);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeStatus status,  String? errorMessage,  String userName,  String userVerificationStatus,  String userProfilePhotoPath,  int notificationCount,  List<dynamic> banners,  List<dynamic> categories,  List<JobEntity> latestJobs,  List<dynamic> featuredItems,  bool isRefreshing,  bool hasReachedMax)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.userName,_that.userVerificationStatus,_that.userProfilePhotoPath,_that.notificationCount,_that.banners,_that.categories,_that.latestJobs,_that.featuredItems,_that.isRefreshing,_that.hasReachedMax);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.status = HomeStatus.initial, this.errorMessage, this.userName = 'Pengguna', this.userVerificationStatus = '', this.userProfilePhotoPath = '', this.notificationCount = 0, final  List<dynamic> banners = const [], final  List<dynamic> categories = const [], final  List<JobEntity> latestJobs = const [], final  List<dynamic> featuredItems = const [], this.isRefreshing = false, this.hasReachedMax = false}): _banners = banners,_categories = categories,_latestJobs = latestJobs,_featuredItems = featuredItems;
  

/// Status loading saat ini
@override@JsonKey() final  HomeStatus status;
/// Pesan error jika status failure
@override final  String? errorMessage;
/// Nama pengguna untuk header (dari user_info.full_name)
@override@JsonKey() final  String userName;
/// Status verifikasi pengguna: 'verified', 'pending', 'not_verified', atau '' jika belum di-load
///
/// Digunakan oleh HomeHeader untuk menentukan apakah menampilkan
/// avatar + nama, atau tombol "Verifikasi".
@override@JsonKey() final  String userVerificationStatus;
/// Path foto profil pengguna dari API (kosong jika belum upload).
///
/// Gunakan [ApiConfig.buildImageUrl] untuk membentuk URL lengkap
/// sebelum meneruskan ke [HomeProfileAvatar].
@override@JsonKey() final  String userProfilePhotoPath;
/// Jumlah notifikasi yang belum dibaca
@override@JsonKey() final  int notificationCount;
/// List banner/carousel items
 final  List<dynamic> _banners;
/// List banner/carousel items
@override@JsonKey() List<dynamic> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

/// List kategori layanan
 final  List<dynamic> _categories;
/// List kategori layanan
@override@JsonKey() List<dynamic> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// Latest jobs from API (max 2 for home page display)
 final  List<JobEntity> _latestJobs;
/// Latest jobs from API (max 2 for home page display)
@override@JsonKey() List<JobEntity> get latestJobs {
  if (_latestJobs is EqualUnmodifiableListView) return _latestJobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latestJobs);
}

/// List featured items (job cards, etc.)
 final  List<dynamic> _featuredItems;
/// List featured items (job cards, etc.)
@override@JsonKey() List<dynamic> get featuredItems {
  if (_featuredItems is EqualUnmodifiableListView) return _featuredItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredItems);
}

/// Flag untuk menandakan sedang refresh (pull-to-refresh)
@override@JsonKey() final  bool isRefreshing;
/// Flag untuk infinite scroll - sudah mencapai akhir data
@override@JsonKey() final  bool hasReachedMax;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userVerificationStatus, userVerificationStatus) || other.userVerificationStatus == userVerificationStatus)&&(identical(other.userProfilePhotoPath, userProfilePhotoPath) || other.userProfilePhotoPath == userProfilePhotoPath)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&const DeepCollectionEquality().equals(other._banners, _banners)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._latestJobs, _latestJobs)&&const DeepCollectionEquality().equals(other._featuredItems, _featuredItems)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,userName,userVerificationStatus,userProfilePhotoPath,notificationCount,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_latestJobs),const DeepCollectionEquality().hash(_featuredItems),isRefreshing,hasReachedMax);

@override
String toString() {
  return 'HomeState(status: $status, errorMessage: $errorMessage, userName: $userName, userVerificationStatus: $userVerificationStatus, userProfilePhotoPath: $userProfilePhotoPath, notificationCount: $notificationCount, banners: $banners, categories: $categories, latestJobs: $latestJobs, featuredItems: $featuredItems, isRefreshing: $isRefreshing, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeStatus status, String? errorMessage, String userName, String userVerificationStatus, String userProfilePhotoPath, int notificationCount, List<dynamic> banners, List<dynamic> categories, List<JobEntity> latestJobs, List<dynamic> featuredItems, bool isRefreshing, bool hasReachedMax
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,Object? userName = null,Object? userVerificationStatus = null,Object? userProfilePhotoPath = null,Object? notificationCount = null,Object? banners = null,Object? categories = null,Object? latestJobs = null,Object? featuredItems = null,Object? isRefreshing = null,Object? hasReachedMax = null,}) {
  return _then(_HomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userVerificationStatus: null == userVerificationStatus ? _self.userVerificationStatus : userVerificationStatus // ignore: cast_nullable_to_non_nullable
as String,userProfilePhotoPath: null == userProfilePhotoPath ? _self.userProfilePhotoPath : userProfilePhotoPath // ignore: cast_nullable_to_non_nullable
as String,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<dynamic>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>,latestJobs: null == latestJobs ? _self._latestJobs : latestJobs // ignore: cast_nullable_to_non_nullable
as List<JobEntity>,featuredItems: null == featuredItems ? _self._featuredItems : featuredItems // ignore: cast_nullable_to_non_nullable
as List<dynamic>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
