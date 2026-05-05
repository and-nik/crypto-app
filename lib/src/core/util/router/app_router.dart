import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/feature/coins/presentations/coins_page.dart';
import 'package:crypto_app/src/feature/entry/presentation/entry_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: EntryRoute.page, initial: true),
    AutoRoute(page: CoinsRoute.page),
  ];
}


