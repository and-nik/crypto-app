import 'package:crypto_app/src/core/data/api/pagination/pagination_params.dart';

/// [Params] is equal to [OtherFunctionParams]
class PaginationIterator<T, Params> {
  int _start;
  int _limit;

  bool _isEnd = false;

  /// Безопасность от race-conditions
  /// защищает от двойного loadMore()
  /// критично для scroll pagination
  int _requestId = 0;
  List<T> _list = [];

  final Future<List<T>> Function(PaginationParams params) call;

  PaginationIterator({
    int start = 1,
    int limit = 100,
    required this.call,
  }): _start = start, _limit = limit;

  Future<List<T>> initialLoad(Params params) async {
    final list = await call(PaginationParams(
      start: _start,
      limit: _limit,
      otherParams: params,
    ));
    _list = list;
    _start += _limit;
    _limit += _limit;
    _isEnd = list.isEmpty;
    return _list;
  }

  /// Or paginate
  Future<List<T>> loadMore(Params params) async {
    if (_isEnd) return _list;
    final requestId = ++_requestId;
    final list = await call(PaginationParams(
      start: _start,
      limit: _limit,
      otherParams: params,
    ));
    if (requestId != _requestId) return _list;
    _list = _list + list;
    _isEnd = list.isEmpty;
    return _list;
  }

}