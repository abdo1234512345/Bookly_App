import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure(dioError.response!.data['error']['message']);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('NO Internet Connection');
        }
        return ServerFailure('NO Internet Connection');
    }
  }
  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Not Found,please try again later.....');
    } else if (statuscode == 500) {
      return ServerFailure('Internal Server Error,please try again later.....');
    } else {
      return ServerFailure(
          'Opps There was an Error,please try again later.....');
    }
  }
}
