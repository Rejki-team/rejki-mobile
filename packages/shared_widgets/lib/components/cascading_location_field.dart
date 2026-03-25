import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';

/// Cascading Location Dropdown Field Component
///
/// A multi-level cascading dropdown for location selection
/// (Country -> Province -> City/Regency -> District/Kecamatan -> Village/Kelurahan).
/// Each level depends on the previous selection.
///
/// This widget uses [LocationEntity] from the domain package.
/// State management should be handled by the parent widget or a Bloc in the feature package.
///
/// Example usage:
/// ```dart
/// CascadingLocationField(
///   number: '9',
///   label: 'Lokasi Detail',
///   isMandatory: true,
///   selectedProvince: selectedProvince,
///   selectedCity: selectedCity,
///   selectedDistrict: selectedDistrict,
///   selectedVillage: selectedVillage,
///   provinceItems: provinces,
///   cityItems: cities,
///   districtItems: districts,
///   villageItems: villages,
///   isLoadingProvinces: isLoadingProvinces,
///   isLoadingCities: isLoadingCities,
///   isLoadingDistricts: isLoadingDistricts,
///   isLoadingVillages: isLoadingVillages,
///   onProvinceChanged: (province) => handleProvinceChange(province),
///   onCityChanged: (city) => handleCityChange(city),
///   onDistrictChanged: (district) => handleDistrictChange(district),
///   onVillageChanged: (village) => handleVillageChange(village),
/// )
/// ```
class CascadingLocationField extends StatelessWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Lokasi Detail")
  final String label;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  // Selected values
  final LocationEntity? selectedCountry;
  final LocationEntity? selectedProvince;
  final LocationEntity? selectedCity;
  final LocationEntity? selectedDistrict;
  final LocationEntity? selectedVillage;

  // Dropdown items
  final List<LocationEntity> countryItems;
  final List<LocationEntity> provinceItems;
  final List<LocationEntity> cityItems;
  final List<LocationEntity> districtItems;
  final List<LocationEntity> villageItems;

  // Loading states for each level
  final bool isLoadingCountries;
  final bool isLoadingProvinces;
  final bool isLoadingCities;
  final bool isLoadingDistricts;
  final bool isLoadingVillages;

  // Callbacks
  final ValueChanged<LocationEntity?>? onCountryChanged;
  final ValueChanged<LocationEntity?>? onProvinceChanged;
  final ValueChanged<LocationEntity?>? onCityChanged;
  final ValueChanged<LocationEntity?>? onDistrictChanged;
  final ValueChanged<LocationEntity?>? onVillageChanged;

  /// Error message to display
  final String? errorText;

  const CascadingLocationField({
    super.key,
    required this.number,
    required this.label,
    this.isMandatory = false,
    this.selectedCountry,
    this.selectedProvince,
    this.selectedCity,
    this.selectedDistrict,
    this.selectedVillage,
    this.countryItems = const [],
    this.provinceItems = const [],
    this.cityItems = const [],
    this.districtItems = const [],
    this.villageItems = const [],
    this.isLoadingCountries = false,
    this.isLoadingProvinces = false,
    this.isLoadingCities = false,
    this.isLoadingDistricts = false,
    this.isLoadingVillages = false,
    this.onCountryChanged,
    this.onProvinceChanged,
    this.onCityChanged,
    this.onDistrictChanged,
    this.onVillageChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label Row
          _buildLabelRow(),

          const SizedBox(height: AppSpacing.xs),

          // Country Dropdown (Always enabled)
          _buildDropdownField(
            label: 'Negara',
            hint: '-Pilih Negara-',
            value: selectedCountry,
            items: countryItems,
            enabled: !isLoadingCountries,
            isLoading: isLoadingCountries,
            onChanged: onCountryChanged,
          ),

          const SizedBox(height: AppSpacing.md),

          // Province Dropdown (Enabled if country selected)
          _buildDropdownField(
            label: 'Provinsi',
            hint: '-Pilih Provinsi-',
            value: selectedProvince,
            items: provinceItems,
            enabled: selectedCountry != null && !isLoadingProvinces,
            isLoading: isLoadingProvinces,
            onChanged: onProvinceChanged,
          ),

          const SizedBox(height: AppSpacing.md),

          // City/Regency Dropdown (Enabled if province selected)
          _buildDropdownField(
            label: 'Kota/Kabupaten',
            hint: '-Pilih Kota/Kabupaten-',
            value: selectedCity,
            items: cityItems,
            enabled: selectedProvince != null && !isLoadingCities,
            isLoading: isLoadingCities,
            onChanged: onCityChanged,
          ),

          const SizedBox(height: AppSpacing.md),

          // District Dropdown (Enabled if city selected)
          _buildDropdownField(
            label: 'Kecamatan',
            hint: '-Pilih Kecamatan-',
            value: selectedDistrict,
            items: districtItems,
            enabled: selectedCity != null && !isLoadingDistricts,
            isLoading: isLoadingDistricts,
            onChanged: onDistrictChanged,
          ),

          const SizedBox(height: AppSpacing.md),

          // Village Dropdown (Enabled if district selected)
          _buildDropdownField(
            label: 'Kelurahan',
            hint: '-Pilih Kelurahan-',
            value: selectedVillage,
            items: villageItems,
            enabled: selectedDistrict != null && !isLoadingVillages,
            isLoading: isLoadingVillages,
            onChanged: onVillageChanged,
          ),

          // Error Text
          if (errorText != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              errorText!,
              style: AppTypography.caption.copyWith(color: AppColors.error),
            ),
          ],
        ],
      ),
    );
  }

  /// Builds the label row with number, label text, and mandatory indicator
  Widget _buildLabelRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Number
        Text('$number.', style: AppTypography.formLabel),

        const SizedBox(width: AppSpacing.xxs),

        // Label
        Text(label, style: AppTypography.formLabel),

        // Mandatory indicator
        if (isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text('*', style: AppTypography.formLabel),
        ],
      ],
    );
  }

  /// Builds a single dropdown field with loading indicator support
  Widget _buildDropdownField({
    required String label,
    required String hint,
    required LocationEntity? value,
    required List<LocationEntity> items,
    required bool enabled,
    required bool isLoading,
    required ValueChanged<LocationEntity?>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        SizedBox(
          width: double.infinity,
          child: Text(label, style: AppTypography.formLabel),
        ),

        const SizedBox(height: AppSpacing.xs),

        // Dropdown
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.inputPaddingVerticalSm,
            horizontal: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: enabled ? AppColors.inputBackground : AppColors.background,
            borderRadius: AppDimensions.borderRadiusSm,
            border: Border.all(
              color: AppColors.border,
              width: AppDimensions.borderThin,
            ),
          ),
          child: isLoading
              ? _buildLoadingIndicator()
              : DropdownButtonHideUnderline(
                  child: DropdownButton<LocationEntity>(
                    value: value,
                    hint: Text(hint, style: AppTypography.formHint),
                    icon: SvgPicture.asset(
                      AppAssets.iconArrowIosDown,
                      width: AppDimensions.iconXxs14,
                      height: AppDimensions.iconXxs14,
                      colorFilter: ColorFilter.mode(
                        enabled ? AppColors.textCaption : AppColors.border,
                        BlendMode.srcIn,
                      ),
                    ),
                    isExpanded: true,
                    isDense: true,
                    style: AppTypography.formHint.copyWith(
                      color: AppColors.textBlack,
                    ),
                    items: enabled
                        ? items.map((LocationEntity item) {
                            return DropdownMenuItem<LocationEntity>(
                              value: item,
                              child: Text(item.name),
                            );
                          }).toList()
                        : [],
                    onChanged: enabled ? onChanged : null,
                  ),
                ),
        ),
      ],
    );
  }

  /// Builds a loading indicator for dropdown
  Widget _buildLoadingIndicator() {
    return Row(
      children: [
        SizedBox(
          width: AppDimensions.iconXxs14,
          height: AppDimensions.iconXxs14,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Memuat...',
          style: AppTypography.formHint.copyWith(color: AppColors.textCaption),
        ),
      ],
    );
  }
}
