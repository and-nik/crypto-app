import 'package:crypto_app/src/core/domain/model/coin.dart';
import 'package:crypto_app/src/core/domain/model/currency_ticker.dart';
import 'package:crypto_app/src/core/domain/model/quote.dart';
import 'package:crypto_app/src/core/util/extension/double_ext.dart';
import 'package:flutter/material.dart';

final ccur = CurrencyTicker.usd;

const _iconSize = 30.0;

class CoinCell extends StatelessWidget {

  final int index;
  final Coin coin;

  const CoinCell({
    super.key,
    required this.index,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {

    final quote = coin
        .quotes
        .firstWhere((e) => e.ticker == ccur,);
    final price = quote
        .price
        .smart();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 8, 3),
      child: Row(
        children: [

          SizedBox(
            width: 52,
            child: Center(
              child: Text("${index+1}"),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: .circular(_iconSize/2),
            ),
            clipBehavior: .hardEdge,
            child: Image.network(
              coin.iconUrl(),
              width: _iconSize,
              height: _iconSize,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              coin.symbol,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Text(
            ccur == .usd
                ? "${ccur.symbol}$price"
                : "$price ${ccur.symbol}",
          ),

          SizedBox(
            width: 100,
            child: Align(
              alignment: .centerRight,
              child: Text(
                quote.percentChange24h > 0
                    ? "+${quote.percentChange24h.smart()}%"
                    : "${quote.percentChange24h.smart()}%",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: quote.percentChange24h > 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
