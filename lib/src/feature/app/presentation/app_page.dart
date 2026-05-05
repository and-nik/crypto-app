import 'package:crypto_app/l10n/gen/app_localizations.dart';
import 'package:crypto_app/src/core/util/router/app_router.dart';
import 'package:crypto_app/src/feature/app/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppPage extends StatelessWidget {

  final AppRouter _appRouter = AppRouter();

  AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.theme.theme,
            /// MaterialApp рисует весь контент приложения через свой child.
            /// А builder позволяет обернуть этот child во что-то свое.
            builder: (context, child) {
              return child ?? const SizedBox.shrink();
              // Overlay
            },
            routerConfig: _appRouter.config(
              // navigatorObservers: () => [
              //   _autoRouteObserver,
              // ],
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }

}