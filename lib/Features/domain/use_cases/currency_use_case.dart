


import 'package:currency/Features/domain/entities/currency.dart';
import 'package:currency/Features/domain/repos/currency_repo.dart';
import 'package:currency/core/errors/failure.dart';
import 'package:currency/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class CurrencyUseCase implements UseCase<CurrencyEntity,Data>{
  final CurrencyRepo currencyRepo;
  CurrencyUseCase({required this.currencyRepo});
  @override
  Future<Either<Failure,CurrencyEntity>> call(Data params) {
    return currencyRepo.getCurrencyData(from: params.from, to: params.to);
  }


}
class Data
{
  final String from;
  final String to;
  Data({required this.from, required this.to});
}
