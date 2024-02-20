import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
 final String error;

 const Failure(this.error);
 @override

 List<Object?> get props => [];
}

class ServerFailure extends Failure
{
  const ServerFailure(super.error);
  factory ServerFailure.dioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServe');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFailure(' Unexpected Error, Please try again!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse();
      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        return const ServerFailure('Request to ApiServer was canceled');
      default:
        return  ServerFailure(dioException.response!.data.toString());
    }
  }

  factory ServerFailure.fromResponse() {
    return const ServerFailure('bad response');
  }





}