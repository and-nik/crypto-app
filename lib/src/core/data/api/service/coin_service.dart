import 'package:crypto_app/src/core/data/api/const/api_const.dart';
import 'package:crypto_app/src/core/data/api/exports/api_exports.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:crypto_app/src/core/data/api/model/resp/coins_response.dart';

part 'coin_service.g.dart';

@RestApi()
abstract class CoinService {

  factory CoinService(Dio dio) = _CoinService;

  @GET(ApiConst.endpointCoins)
  Future<CoinsResponse> list({
    @Query(ApiConst.queryStart) required int start,
    @Query(ApiConst.queryLimit) required int limit,
    @Query(ApiConst.queryConvert) String convert = CurrencyTicker.usd,
  });

}