enum CurrencyTicker {
  usd("\$"),
  eur("€"),
  rub("₽");
  static const String usdStr = "USD";
  static const String eurStr = "EUR";
  static const String rubStr = "RUB";

  final String symbol;

  const CurrencyTicker(this.symbol);
}