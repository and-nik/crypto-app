extension DoubleExt on double {
  String smart() {
    final abs = this.abs();

    // >= 10 → 2 знака
    if (abs >= 10) {
      return toStringAsFixed(2);
    }

    // 1–10 → 3 знака
    if (abs >= 1) {
      return toStringAsFixed(3);
    }

    // < 1 → анализируем дробную часть
    final str = abs.toStringAsFixed(20);
    final parts = str.split('.');
    final decimals = parts[1];

    int leadingZeros = 0;
    for (final char in decimals.split('')) {
      if (char == '0') {
        leadingZeros++;
      } else {
        break;
      }
    }

    // если мало нулей — обычный формат
    if (leadingZeros < 3) {
      final precision = leadingZeros + 3;
      return toStringAsFixed(precision);
    }

    // если много нулей — compress
    final significant = decimals.substring(leadingZeros);

    // берем 4 значащие цифры
    final cut = significant.substring(0, 4);

    final sign = this < 0 ? '-' : '';

    return '0.0($leadingZeros)$cut';
  }
}