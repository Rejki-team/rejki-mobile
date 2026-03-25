/// Shared Widgets Package
///
/// Widgets that depend on domain entities and are shared across multiple features.
/// Unlike `components` package which contains pure UI widgets, this package
/// contains widgets that are aware of business entities.
///
/// Usage:
/// ```dart
/// import 'package:shared_widgets/shared_widgets.dart';
///
/// // Location field with LocationEntity
/// CascadingLocationField(
///   number: '9',
///   label: 'Lokasi Detail',
///   provinceItems: provinces,
///   onProvinceChanged: (province) => handleProvinceChange(province),
/// )
/// ```
library;

// Location widgets
export 'components/cascading_location_field.dart';
