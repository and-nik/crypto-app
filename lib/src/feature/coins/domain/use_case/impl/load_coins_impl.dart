import 'package:crypto_app/src/core/data/api/pagination/pagination_params.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/domain/repo/coin_repo.dart';
import 'package:crypto_app/src/feature/coins/domain/use_case/load_coins.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoadCoins)
class LoadCoinsImpl extends LoadCoins {
  final CoinRepo _coinRepo;

  LoadCoinsImpl(this._coinRepo);

  @override
  Future<CoinsResponse> call(PaginationParams<LoadCoinsParams> params) {
    return _coinRepo.list(
      start: params.start,
      limit: params.limit,
      convert: params.otherParams.currency.name.toUpperCase(),
    );
  }
}