import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/core/presentation/custom/localized_error_widget.dart';
import 'package:crypto_app/src/core/presentation/custom/paginated_list_view.dart';
import 'package:crypto_app/src/core/util/di/setup_di.dart';
import 'package:crypto_app/src/feature/coins/presentations/components/coin_cell.dart';
import 'package:crypto_app/src/feature/coins/presentations/cubit/coins_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinsCubit(getIt()),
      child: BlocBuilder<CoinsCubit, CoinsState>(
        builder: (context, state) {

          final cubit = context.read<CoinsCubit>();

          return Scaffold(
            body: state.isLoading ? const Center(
              child: CupertinoActivityIndicator(),
            ) : state.error != null ? LocalizedErrorWidget(
              error: state.error!,
              wrapWithScaffold: false,
              onTryAgain: () => cubit.load(),
            ) : RefreshIndicator(
              onRefresh: () => cubit.load(),
              child: state.coins.isEmpty ? const Center(
                child: Text("Empty Coins List"),
              ) : PaginatedListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemCount: state.coins.length,
                padding: const EdgeInsets.only(bottom: 40),
                itemBuilder: (context, index) {
                  return CoinCell(coin: state.coins[index]);
                },
                onPaginate: () => cubit.paginate(),
                isPaginating: state.isPaginating,
              ),
            ),
          );
        }
      ),
    );
  }
}
