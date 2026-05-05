import 'package:crypto_app/src/core/data/api/const/api_const.dart';
import 'package:crypto_app/src/core/data/api/interceptor/api_key_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioFactory {

  @singleton
  Dio factoryMethod() {
    final dio = Dio();
    dio.options.baseUrl = ApiConst.baseUrl;
    dio.interceptors.add(const ApiKeyInterceptor());
    dio.options.headers.addAll({
      Headers.acceptHeader : Headers.jsonContentType,
      Headers.contentTypeHeader : Headers.jsonContentType,
    });
    return dio;
  }
}