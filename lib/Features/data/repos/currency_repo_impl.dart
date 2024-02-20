import 'package:currency/Features/data/data_source/remote_data_source.dart';
import 'package:currency/Features/domain/entities/currency.dart';
import 'package:currency/Features/domain/repos/currency_repo.dart';
import 'package:currency/core/errors/exceptions.dart';
import 'package:currency/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CurrencyRepoImpl implements CurrencyRepo {
  final RemoteDataSource remoteDataSource;

  CurrencyRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CurrencyEntity>> getCurrencyData({
    required final String from,
    required final String to,
  }) async {
    try {
      final remote = await remoteDataSource.getCurrency(from: from, to: to);
      return Right(remote);
    } on ServerException catch (e) {
      if(e is DioException)
        {
          return Left(ServerFailure.dioError(e as DioException));
        }
      return Left(ServerFailure(e.toString()));
    }
  }
}
