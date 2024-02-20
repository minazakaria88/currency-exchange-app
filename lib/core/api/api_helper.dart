

import 'package:dio/dio.dart';

abstract class ApiHelper
{
  Future<Response> get({required String path, Map<String,dynamic>? query});
}