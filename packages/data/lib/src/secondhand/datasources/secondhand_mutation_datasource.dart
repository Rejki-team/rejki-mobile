import 'package:domain/domain.dart';
import 'package:network/network.dart';
import '../models/bider_model.dart';
import '../models/secondhand_model.dart';

/// Abstract interface untuk operasi WRITE Iklan Barang Bekas + Bider (F-15).
abstract class SecondhandMutationDataSource {
  Future<SecondhandModel> createSecondhand(CreateSecondhandParams params);
  Future<BiderModel> ambilBarang(String iklanId);
  Future<BiderModel> setujuiBider({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  });
  Future<BiderModel> withdrawBider({
    required String iklanId,
    required String biderId,
  });
}

/// Implementasi menggunakan [DioClient]. Upload foto DIHAPUS dari `createSecondhand`
/// (backend `foto_urls` butuh presigned-URL flow terpisah, belum di-wire — pola
/// sama `create_job` Kelompok 3 Phase 2).
class SecondhandMutationDataSourceImpl implements SecondhandMutationDataSource {
  final DioClient _dioClient;

  SecondhandMutationDataSourceImpl(this._dioClient);

  @override
  Future<SecondhandModel> createSecondhand(
    CreateSecondhandParams params,
  ) async {
    final response = await _dioClient.post(
      ApiConfig.secondhands,
      data: {
        'judul': params.judul,
        'deskripsi': params.deskripsi,
        'jenis_barang': params.jenisBarang,
        'jumlah': params.jumlah,
        'lokasi_pengambilan': params.lokasiPengambilan,
        if (params.lokasi != null) 'lokasi': params.lokasi,
        if (params.regionId != null) 'region_id': params.regionId,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return SecondhandModel.fromJson(data);
  }

  @override
  Future<BiderModel> ambilBarang(String iklanId) async {
    final response = await _dioClient.post(ApiConfig.secondhandAmbil(iklanId));
    final data = response.data['data'] as Map<String, dynamic>;
    return BiderModel.fromJson(data);
  }

  @override
  Future<BiderModel> setujuiBider({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  }) async {
    final response = await _dioClient.patch(
      ApiConfig.secondhandBiderSetujui(iklanId, biderId),
      data: {'sudah_menghubungi': sudahMenghubungi},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return BiderModel.fromJson(data);
  }

  @override
  Future<BiderModel> withdrawBider({
    required String iklanId,
    required String biderId,
  }) async {
    final response = await _dioClient.patch(
      ApiConfig.secondhandBiderWithdraw(iklanId, biderId),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return BiderModel.fromJson(data);
  }
}
