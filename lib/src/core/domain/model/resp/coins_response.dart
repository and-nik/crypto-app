import 'package:crypto_app/src/core/domain/model/coin.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response_status.dart';

class CoinsResponse {
  final CoinsResponseStatus status;
  final List<Coin> coins;
  CoinsResponse({
    required this.status,
    required this.coins,
  });

  CoinsResponse copyWith({
    CoinsResponseStatus? status,
    List<Coin>? coins,
  }) {
    return CoinsResponse(
      status: status ?? this.status,
      coins: coins ?? this.coins,
    );
  }
}