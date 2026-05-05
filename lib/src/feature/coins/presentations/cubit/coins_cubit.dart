import 'package:crypto_app/src/core/data/api/pagination/paginator.dart';
import 'package:crypto_app/src/core/domain/model/coin.dart';
import 'package:crypto_app/src/core/domain/model/resp/coins_response.dart';
import 'package:crypto_app/src/core/util/func/app_func.dart';
import 'package:crypto_app/src/core/util/model/app_nullable.dart';
import 'package:crypto_app/src/feature/coins/domain/use_case/load_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coins_state.dart';

class CoinsCubit extends Cubit<CoinsState> {

  late final Paginator<Coin, LoadCoinsParams, CoinsResponse> _paginator;

  CoinsCubit(LoadCoins loadCoins): super(CoinsState()) {
    _paginator = Paginator(
      call: loadCoins.call,
      getItems: (response) => response.coins,
      copyWithItems: ({required items, required response}) {
        return response.copyWith(coins: items);
      },
    );
    load();
  }

  Future<void> load() async {
    await handleErrors(onTry: () async {
      emit(state.copyWith(
        isLoading: true,
        error: Nullable(null),
      ));
      final resp = await _paginator.initialLoad(LoadCoinsParams(currency: .usd));
      emit(state.copyWith(
        isLoading: false,
        coins: resp.coins,
        timestamp: resp.status.timestamp,
      ));
    }, onError: (error) {
      emit(state.copyWith(
        isLoading: false,
        error: Nullable(error),
      ));
    },);
  }

  Future<void> paginate() async {
    await handleErrors(onTry: () async {
      emit(state.copyWith(
        isPaginating: true,
        error: Nullable(null),
      ));
      final resp = await _paginator.loadMore(LoadCoinsParams(currency: .usd));
      emit(state.copyWith(
        isPaginating: false,
        coins: resp.coins,
        timestamp: resp.status.timestamp,
      ));
    }, onError: (error) {
      emit(state.copyWith(
        isPaginating: false,
        error: Nullable(error),
      ));
    },);
  }

}