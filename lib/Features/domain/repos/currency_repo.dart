

import 'package:currency/Features/domain/entities/currency.dart';
import 'package:currency/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepo
{
  Future<Either<Failure,CurrencyEntity>> getCurrencyData({
    required final String from,
    required final String to,
  });
}