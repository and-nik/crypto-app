class PaginationParams<Params> {
  final int start;
  final int limit;
  final Params otherParams;
  PaginationParams({
    required this.start,
    required this.limit,
    required this.otherParams,
  });
}