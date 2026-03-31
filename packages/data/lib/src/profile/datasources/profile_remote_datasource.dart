import 'package:network/network.dart';
import 'package:domain/domain.dart';

/// Remote data source untuk profile API.
///
/// Membuat FormData dan mengirim ke backend via PUT.
abstract class ProfileRemoteDataSource {
  /// Update profile user dengan FormData (multipart).
  Future<ApiResponse<dynamic>> updateProfile(UpdateProfileParams params);
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
}
