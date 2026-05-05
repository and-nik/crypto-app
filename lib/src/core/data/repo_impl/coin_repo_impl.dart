import 'package:crypto_app/src/core/data/api/data_source/coin_data_source.dart';
import 'package:crypto_app/src/core/data/mapper/coins_response_mapper.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/domain/repo/coin_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoinRepo)
class CoinRepoImpl extends CoinRepo {

  final CoinDataSource _coinDataSource;

  CoinRepoImpl(this._coinDataSource);

  @override
  Future<CoinsResponse> list({
    required int start,
    required int limit,
    String convert = CurrencyTicker.usdStr,
  }) async {
    final resp = await _coinDataSource.list(
      start: start,
      limit: limit,
      convert: convert,
    );
    return CoinsResponseMapper.toModel(resp);
  }

}