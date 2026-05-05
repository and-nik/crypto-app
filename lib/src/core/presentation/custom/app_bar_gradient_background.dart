import 'package:crypto_app/src/core/util/extension/build_context_ext.dart';
import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class AppBarGradientBackground extends StatelessWidget {
  const AppBarGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.theme.white,
            context.theme.white.withValues(alpha: 0.6),
            context.theme.white.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
