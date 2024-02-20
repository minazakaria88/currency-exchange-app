

import 'package:currency/core/api/api_helper.dart';
import 'package:currency/core/api/end_points.dart';
import 'package:dio/dio.dart';


class DioHelper implements ApiHelper
{
  final Dio dio;

  DioHelper({required this.dio}){
    dio.options
        ..baseUrl=EndPoints.baseUrl
        ..receiveDataWhenStatusError=true;
  }

  @override
  Future<Response> get({required String path, Map<String, dynamic>? query})async {
     return await dio.get(
        path,
        queryParameters: query,
      );
  }
  
}