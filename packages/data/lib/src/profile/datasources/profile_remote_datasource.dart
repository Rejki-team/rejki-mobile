import 'dart:io';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../../auth/models/user_model.dart';
import '../models/ads_summary_model.dart';

/// Remote data source untuk profile API.
abstract class ProfileRemoteDataSource {
  /// Update profile user dengan FormData (multipart).
  Future<ApiResponse<dynamic>> updateProfile(UpdateProfileParams params);

  /// Ambil profil user yang sedang login (GET /users/profile).
  Future<UserModel> getProfile();

  /// Ambil ringkasan statistik iklan user (GET /users/ads-summary).
  Future<AdsSummaryModel> getAdsSummary();

  /// Upload atau update foto profil (PUT /users/profile/photo).
  ///
  /// Mengembalikan path foto baru dari response API.
  Future<String> uploadProfilePhoto(File photo);

  /// Update jam kerja user (PUT /users/working-hours).
  Future<void> updateWorkingHours(String workingHours);

  /// Toggle visibilitas nomor telepon (PUT /users/phone-visibility).
  Future<void> updatePhoneVisibility({required bool isVisible});
}

/// Implementasi [ProfileRemoteDataSource].
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient _dioClient;

  ProfileRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponse<dynamic>> updateProfile(
    UpdateProfileParams params,
  ) async {
    final formData = FormData.fromMap({
      'full_name': params.fullName,
      'nik': params.nik,
      'gender': params.gender,
      'dob': params.dob,
      'address_ktp': params.addressKtp,
      'country': params.country,
      'province': params.province,
      'city': params.city,
      'districts': params.districts,
      'village': params.village,
      'education_level': params.educationLevel,
      'education_focus': params.educationFocus,
      'work_experience': params.workExperience,
      'ktp_file': await MultipartFile.fromFile(
        params.ktpFile.path,
        filename: 'ktp_file.jpg',
      ),
      'selfie_ktp_file': await MultipartFile.fromFile(
        params.selfieKtpFile.path,
        filename: 'selfie_ktp_file.jpg',
      ),
    });

    final response = await _dioClient.uploadPut(
      ApiConfig.profile,
      data: formData,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await _dioClient.get(ApiConfig.profile);
    final data = response.data['data'] as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  @override
  Future<AdsSummaryModel> getAdsSummary() async {
    final response = await _dioClient.get(ApiConfig.adsSummary);
    final data = response.data['data'] as Map<String, dynamic>;
    return AdsSummaryModel.fromJson(data);
  }

  @override
  Future<String> uploadProfilePhoto(File photo) async {
    final formData = FormData.fromMap({
      'profile_photo': await MultipartFile.fromFile(
        photo.path,
        filename: 'profile_photo.jpg',
      ),
    });

    final response = await _dioClient.uploadPut(
      ApiConfig.profilePhoto,
      data: formData,
    );

    // Parse path foto baru dari response
    final data = response.data['data'] as Map<String, dynamic>?;
    return (data?['profile_photo_path'] as String?) ?? '';
  }

  @override
  Future<void> updateWorkingHours(String workingHours) async {
    await _dioClient.put(
      ApiConfig.workingHours,
      data: {'working_hours': workingHours},
    );
  }

  @override
  Future<void> updatePhoneVisibility({required bool isVisible}) async {
    await _dioClient.put(
      ApiConfig.phoneVisibility,
      data: {'is_visible': isVisible},
    );
  }
}
