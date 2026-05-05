import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/feature/coins/presentations/coins_page.dart';
import 'package:crypto_app/src/feature/entry/presentation/entry_page.dart';
import 'package:crypto_app/src/feature/portfolio/presentation/portfolio_page.dart';
import 'package:crypto_app/src/feature/tab_bar/presentation/tab_bar_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: EntryRoute.page, initial: true),
    AutoRoute(
      page: TabBarRoute.page,
      children: [
        AutoRoute(page: CoinsRoute.page),
        AutoRoute(page: PortfolioRoute.page),
      ],
    ),
  ];
}


