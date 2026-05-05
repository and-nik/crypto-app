import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/core/util/router/app_router.dart';
import 'package:crypto_app/src/feature/tab_bar/presentation/components/floating_tab_bar.dart';
import 'package:flutter/material.dart';


@RoutePage()
class TabBarPage extends StatefulWidget {

  const TabBarPage({
    super.key,
  });

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const CoinsRoute(),
        const PortfolioRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return child;
        /// If need transition between pages
        /// return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          body: Stack(
            alignment: .bottomCenter,
            children: [

              /// Main app
              child,

              /// Tab bar
              SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    FloatingTabBar(
                      currentIndex: tabsRouter.activeIndex,
                      onItemTap: tabsRouter.setActiveIndex,
                    ),

                    if (Platform.isAndroid)
                      const SizedBox(height: 12,),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}