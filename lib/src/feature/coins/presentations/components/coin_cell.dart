import 'package:crypto_app/src/core/domain/model/coin.dart';
import 'package:flutter/material.dart';

class CoinCell extends StatelessWidget {

  final Coin coin;

  const CoinCell({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Text(coin.name);
  }
}
