import 'package:domain/domain.dart';
import 'package:network/network.dart';
import '../models/bider_model.dart';
import '../models/secondhand_model.dart';
import '../models/secondhands_response_model.dart';
import '../../job/models/pagination_model.dart';

/// Abstract interface untuk operasi READ Iklan Barang Bekas + Bider (F-15).
abstract class SecondhandRemoteDataSource {
  Future<SecondhandsResponseModel> getSecondhand(SecondhandQueryParams params);
  Future<SecondhandModel> getSecondhandById(String id);
  Future<SecondhandsResponseModel> getMyAds({
    required int page,
    required int limit,
  });
  Future<List<BiderModel>> getBiderSaya();
  Future<List<BiderModel>> getBiderForIklan(String iklanId);
}

/// Implementasi menggunakan [DioClient]. `GET /barang`/`/barang/saya`
/// mengembalikan array flat (backend tidak memaginasi listing ini) —
/// pagination disintesis client-side (pola sama `JobRemoteDataSourceImpl`).
class SecondhandRemoteDataSourceImpl implements SecondhandRemoteDataSource {
  final DioClient _dioClient;

  SecondhandRemoteDataSourceImpl(this._dioClient);

  SecondhandsResponseModel _toSecondhandsResponse(
    List<dynamic> raw, {
    required int page,
    required int limit,
  }) {
    final items = raw
        .map((e) => SecondhandModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return SecondhandsResponseModel(
      data: items,
      pagination: PaginationModel(
        limit: limit,
        page: page,
        sort: 'created_at desc',
        totalRows: items.length,
        totalPages: 1,
        hasNext: false,
      ),
    );
  }

  @override
  Future<SecondhandsResponseModel> getSecondhand(
    SecondhandQueryParams params,
  ) async {
    final response = await _dioClient.get(
      ApiConfig.secondhands,
      queryParameters: {
        'limit': params.limit,
        'offset': (params.page - 1) * params.limit,
        if (params.latitude != null) 'latitude': params.latitude,
        if (params.longitude != null) 'longitude': params.longitude,
      },
    );
    final data = response.data['data'] as List<dynamic>;
    return _toSecondhandsResponse(data, page: params.page, limit: params.limit);
  }

  @override
  Future<SecondhandModel> getSecondhandById(String id) async {
    final response = await _dioClient.get(ApiConfig.secondhandById(id));
    final data = response.data['data'] as Map<String, dynamic>;
    return SecondhandModel.fromJson(data);
  }

  @override
  Future<SecondhandsResponseModel> getMyAds({
    required int page,
    required int limit,
  }) async {
    final response = await _dioClient.get(
      ApiConfig.secondhandMyAds,
      queryParameters: {'limit': limit, 'offset': (page - 1) * limit},
    );
    final data = response.data['data'] as List<dynamic>;
    return _toSecondhandsResponse(data, page: page, limit: limit);
  }

  @override
  Future<List<BiderModel>> getBiderSaya() async {
    final response = await _dioClient.get(ApiConfig.secondhandBiderSaya);
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) => BiderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BiderModel>> getBiderForIklan(String iklanId) async {
    final response = await _dioClient.get(
      ApiConfig.secondhandBiderList(iklanId),
    );
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) => BiderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
