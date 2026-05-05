import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/core/util/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit/entry_cubit.dart';
part 'cubit/entry_state.dart';

@RoutePage()
class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = EntryCubit();
        Future.microtask(() {
          cubit.load();
        });
        return cubit;
      },
      child: BlocListener<EntryCubit, _EntryState>(
        listener: (context, state) {
          if (state is _NotFirstTimeState) {
            context.router.replaceAll([const CoinsRoute()]);
          }
          if (state is _FirstTimeState) {
            // context.router.replaceAll([CoinsRoute()]);
          }
        },
        child: const Scaffold(
          body: CupertinoActivityIndicator(color: Colors.red,),
        ),
      ),
    );
  }
}
