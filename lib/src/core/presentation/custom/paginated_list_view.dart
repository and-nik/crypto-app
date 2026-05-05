import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final ScrollController? controller;
  final VoidCallback onPaginate;
  final bool isPaginating;
  final EdgeInsets padding;
  final ScrollPhysics physics;
  final bool shrinkWrap;

  const PaginatedListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
    this.controller,
    required this.onPaginate,
    required this.isPaginating,
    this.shrinkWrap = false,
    this.padding = EdgeInsets.zero,
    this.physics = const AlwaysScrollableScrollPhysics(),
  });

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  static const _threshold = 100.0;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ScrollController();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final position = _controller.position;
    if (position.pixels < 0) return;
    final reachedBottom = position.pixels >= position.maxScrollExtent - _threshold;
    if (reachedBottom && !widget.isPaginating) {
      widget.onPaginate();
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller?.removeListener(_onScroll);
    } else {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: widget.shrinkWrap,
      controller: _controller,
      physics: widget.physics,
      padding: widget.padding.copyWith(bottom: widget.padding.bottom + 100),
      itemCount: widget.itemCount + (widget.isPaginating ? 1 : 0),
      separatorBuilder: widget.separatorBuilder ?? (context, index) {
        return const SizedBox();
      },
      itemBuilder: (context, index) {
        if (index == widget.itemCount && widget.isPaginating) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return widget.itemBuilder(context, index);
      },
    );
  }
}