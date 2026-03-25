import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';

/// Data source for Bidding on Jobs
abstract class BidJobDataSource {
  Future<void> bidJob(BidJobParams params);
}

/// Implementation of BidJobDataSource
@LazySingleton(as: BidJobDataSource)
class BidJobDataSourceImpl implements BidJobDataSource {
  final Dio dio;

  BidJobDataSourceImpl({required this.dio});

  @override
  Future<void> bidJob(BidJobParams params) async {
    debugPrint('🚀 [BidJobDataSource] Calling POST /jobs/${params.jobId}/bids...');
    debugPrint('📍 [BidJobDataSource] date_of_job: ${params.dateOfJob}');
    debugPrint('📍 [BidJobDataSource] worker_id: ${params.workerId}');
    
    final response = await dio.post(
      '/jobs/${params.jobId}/bids',
      data: {
        'date_of_job': params.dateOfJob,
        'worker_id': params.workerId,
      },
    );

    debugPrint('✅ [BidJobDataSource] Response received! Status: ${response.statusCode}');

    final apiResponse = ApiResponse<dynamic>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );

    if (apiResponse.hasError) {
      debugPrint('❌ [BidJobDataSource] API Error: ${apiResponse.errorMessage}');
      throw Exception(apiResponse.errorMessage);
    }
  }
}
