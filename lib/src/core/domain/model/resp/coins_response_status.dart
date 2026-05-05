class CoinsResponseStatus {
  final DateTime timestamp;
  final int? errorCode;
  final String? errorMessage;
  final int elapsed;
  final int? creditCount;

  CoinsResponseStatus({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
  });

}