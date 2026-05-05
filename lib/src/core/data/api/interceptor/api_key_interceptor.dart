import 'package:crypto_app/src/core/data/api/const/api_const.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {

  const ApiKeyInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final bool? requiresToken = options.headers.remove(ApiConst.headerCoinmarketcapApiKeyRequired);

    if (requiresToken != null) {
      options.headers[ApiConst.headerCoinmarketcapApiKey] = ApiConst.coinmarketcapSecretApiKey;
    }

    handler.next(options);
  }
}