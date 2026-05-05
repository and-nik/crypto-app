import 'package:crypto_app/src/core/data/api/pagination/pagination_params.dart';

/// [Params] is equal to [OtherFunctionParams]
/// Usage Example
// final paginator = PaginationIterator<CoinDto, CoinsParams, CoinsResponse>(
//   call: (paginationParams) {
//     return coinsDataSource.getCoins(paginationParams);
//   },
//   getItems: (response) => response.data,
//   copyWithItems: ({required response, required items}) {
//     return response.copyWith(data: items);
//   },
// );
class Paginator<T, Params, Response> {

  final int initialStart;
  final int _limit;

  final Future<Response> Function(PaginationParams<Params> params) call;

  /// Root items to get from
  final List<T> Function(Response response) getItems;

  final Response Function({
  required Response response,
  required List<T> items,
  }) copyWithItems;

  Paginator({
    this.initialStart = 1,
    int limit = 100,
    required this.call,
    required this.getItems,
    required this.copyWithItems,
  }): _start = initialStart, _limit = limit;

  /// Безопасность от race-conditions
  /// защищает от двойного loadMore()
  /// критично для scroll pagination
  int _requestId = 0;

  int _start;
  bool _isEnd = false;
  List<T> _list = [];
  Response? _response;

  void _init() {
    _start = initialStart;
    _isEnd = false;
    _list = [];
  }

  Future<Response> initialLoad(Params params) async {
    _init();

    final resp = await call(PaginationParams(
      start: _start,
      limit: _limit,
      otherParams: params,
    ));

    _response = resp;
    final list = getItems(resp);
    _list = list;
    _start += _limit;
    _isEnd = list.isEmpty;

    return copyWithItems(
      response: resp,
      items: _list,
    );
  }

  /// Or paginate
  Future<Response> loadMore(Params params) async {
    if (_isEnd && _response != null) {
      return copyWithItems(
        response: _response!,
        items: _list,
      );
    }
    final requestId = ++_requestId;
    final resp = await call(PaginationParams(
      start: _start,
      limit: _limit,
      otherParams: params,
    ));
    if (requestId != _requestId && _response != null) {
      return copyWithItems(
        response: _response!,
        items: _list,
      );
    }
    final list = getItems(resp);

    _list = [..._list, ...list];
    _response = resp;
    _start += _limit;
    _isEnd = list.isEmpty;

    return copyWithItems(
      response: _response!,
      items: _list,
    );
  }

}