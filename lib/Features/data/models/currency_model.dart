import 'package:currency/Features/domain/entities/currency.dart';

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel(
      {required super.results,
      required super.base,
      required super.update,
      required super.ms});

  factory CurrencyModel.fromJson(Map<String, dynamic> json,String code) => CurrencyModel(
        base: json['base'],
        update: json['updated'],
        ms: json['ms'],
        results: ResultsModel.fromJson(json['results'], code),
      );
}

class ResultsModel extends Results {

  const ResultsModel({required super.country});
  factory ResultsModel.fromJson(Map<String, dynamic> json, String code) {
    return  ResultsModel(
      country: json[code],
    );
  }

}
