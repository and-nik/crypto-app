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
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image.network(coin.iconUrl()),
        ),
        Text(coin.name),
      ],
    );
  }
}
