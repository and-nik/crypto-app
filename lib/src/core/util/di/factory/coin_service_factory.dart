import 'package:crypto_app/src/core/data/api/service/coin_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoinServiceFactory {

  @singleton
  CoinService factoryMethod(Dio dio) {
    return CoinService(dio);
  }
}