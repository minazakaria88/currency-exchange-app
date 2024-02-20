import 'package:currency/core/api/api_helper.dart';
import 'package:currency/core/api/end_points.dart';

import '../../../core/errors/exceptions.dart';
import '../models/currency_model.dart';

abstract class RemoteDataSource {
  Future<CurrencyModel> getCurrency({
    required final String from,
    required final String to,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiHelper apiHelper;
  RemoteDataSourceImpl({required this.apiHelper});


  @override
  Future<CurrencyModel> getCurrency({
    required final String from,
    required final String to,
  }) async {
    try {
      final response = await apiHelper.get(
        path: EndPoints.path,
        query: {
          'from': from,
          'to':to,
          EndPoints.apiKey: EndPoints.apiValueKey,
        },
      );
      print(response.data);
       return CurrencyModel.fromJson(response.data, to);
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
