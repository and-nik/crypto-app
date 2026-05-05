part of 'coins_cubit.dart';

class CoinsState {
  final bool isLoading;
  final bool isPaginating;
  final Object? error;
  final List<Coin> coins;
  final DateTime? timestamp;

  CoinsState({
    this.isLoading = true,
    this.isPaginating = false,
    this.error,
    this.coins = const [],
    this.timestamp,
  });

  CoinsState copyWith({
    bool? isLoading,
    bool? isPaginating,
    Nullable<Object?>? error,
    List<Coin>? coins,
    DateTime? timestamp,
  }) {
    return CoinsState(
      isLoading: isLoading ?? this.isLoading,
      isPaginating: isPaginating ?? this.isPaginating,
      error: error != null ? error.value : this.error,
      coins: coins ?? this.coins,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}