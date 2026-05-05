import 'package:crypto_app/src/core/data/api/exception/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// This class handle any Exceptions from network and Api layer
@singleton
class ApiExceptionHandler {
  const ApiExceptionHandler();

  Exception handle(Object e, StackTrace stackTrace) {
    print("---------------==================FROM HANDLER==============---------------");
    print(e);
    print(stackTrace);
    print("---------------==================++++++++++++==============---------------");
    switch (e) {
      case DioException(:final response, :final type):
        switch (type) {
          case DioExceptionType.connectionError:
            return NoInternetConnection(e);
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            return ServerIsUnavailable(e);
          case DioExceptionType.badResponse:
            final json = response?.data;
            switch (response?.statusCode) {
              case 403:
                return BadResponse(e, badStatusCode: response?.statusCode, data: json);
              default:
                return BadResponse(e, badStatusCode: response?.statusCode, data: json);
            }
          case DioExceptionType.cancel:
          case DioExceptionType.badCertificate:
          case DioExceptionType.unknown:
            return Undefined(e);
        }
      default:
        return Undefined(e);
    }
  }
}