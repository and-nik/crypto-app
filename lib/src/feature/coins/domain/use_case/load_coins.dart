import 'package:crypto_app/src/core/data/api/pagination/pagination_params.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/util/model/use_case.dart';

abstract class LoadCoins
    extends UseCase<CoinsResponse, PaginationParams<LoadCoinsParams>> {}

class LoadCoinsParams {
  final CurrencyTicker currency;
  LoadCoinsParams({required this.currency});
}