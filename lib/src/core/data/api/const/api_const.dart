import 'package:crypto_app/src/core/util/typedef/app_typedef.dart';

/// Coinmarketcap docs - https://coinmarketcap.com/api/documentation/guides/get-top-coins-by-market-cap
abstract class ApiConst {
  const ApiConst._();

  static const String baseUrl = "https://pro-api.coinmarketcap.com";
  static const String coinmarketcapSecretApiKey = "6e350b285e9a47e293bb29b85838f5e2";

  static const Json headerMapCoinmarketcapApiKeyRequired = { "coinmarketcapApiKeyRequired": true, };
  static const String headerCoinmarketcapApiKeyRequired = "coinmarketcapApiKeyRequired";
  static const String headerCoinmarketcapApiKey= "X-CMC_PRO_API_KEY";

  static const Json headerMapFirebaseUserTokenRequired = { "firebaseUserTokenRequired": true, };
  static const String headerFirebaseUserTokenRequired = "firebaseUserTokenRequired";

  static const String queryStart = "start";
  static const String queryLimit = "limit";
  static const String queryConvert = "convert";

  static const String endpointCoins = "/v3/cryptocurrency/listings/latest";

}