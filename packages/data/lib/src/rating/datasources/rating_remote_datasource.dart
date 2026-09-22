import 'package:network/network.dart';

/// `GET /rating/profil/{userId}` (F-17, PRD §5.15, publik — tanpa auth).
/// Registrasi DI manual — lihat `register_module.dart` (konvensi baku
/// seluruh repository/datasource di codebase ini, bukan via anotasi kelas).
abstract class RatingRemoteDataSource {
  Future<ApiResponse<dynamic>> getAggregate(String userId);
}

class RatingRemoteDataSourceImpl implements RatingRemoteDataSource {
  final DioClient _dioClient;

  RatingRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponse<dynamic>> getAggregate(String userId) async {
    final response = await _dioClient.get(ApiConfig.ratingProfil(userId));
    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (json) => json,
    );
  }
}
