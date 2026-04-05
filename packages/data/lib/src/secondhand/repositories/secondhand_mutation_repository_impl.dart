import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../datasources/secondhand_mutation_datasource.dart';

/// Implementation of [SecondhandMutationRepository].
class SecondhandMutationRepositoryImpl implements SecondhandMutationRepository {
  final SecondhandMutationDataSource _dataSource;

  SecondhandMutationRepositoryImpl(this._dataSource);

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> createSecondhand(
    CreateSecondhandParams params,
  ) async {
    try {
      debugPrint('[SecondhandMutationRepository] createSecondhand called');
      final model = await _dataSource.createSecondhand(params);
      return Right(model.toEntity());
    } on ApiError catch (e) {
      debugPrint('[SecondhandMutationRepository] ApiError: $e');
      return Left(_mapApiError(e));
    } catch (e, st) {
      debugPrint('[SecondhandMutationRepository] Unexpected error: $e\n$st');
      return Left(SecondhandFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<SecondhandFailure, Unit>> claimSecondhand(String id) async {
    try {
      debugPrint('[SecondhandMutationRepository] claimSecondhand id=$id');
      await _dataSource.claimSecondhand(id);
      return const Right(unit);
    } on ApiError catch (e) {
      return Left(_mapApiError(e));
    } catch (e, st) {
      debugPrint('[SecondhandMutationRepository] claimSecondhand error: $e\n$st');
      return Left(SecondhandFailure.serverError(e.toString()));
    }
  }

  SecondhandFailure _mapApiError(ApiError error) {
    switch (error.type) {
      case ApiErrorType.network:
      case ApiErrorType.timeout:
        return const SecondhandFailure.networkError();
      case ApiErrorType.unauthorized:
        return const SecondhandFailure.unauthorized();
      case ApiErrorType.notFound:
        return const SecondhandFailure.notFound();
      case ApiErrorType.validation:
        return SecondhandFailure.validationError(error.message);
      case ApiErrorType.server:
      case ApiErrorType.forbidden:
      case ApiErrorType.unknown:
        return SecondhandFailure.serverError(error.message);
    }
  }
}
