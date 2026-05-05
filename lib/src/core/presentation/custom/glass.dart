import 'dart:ui';

import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum GlassAlpha {
  low(0.15),
  medium(0.6),
  strange(0.8);

  final double alpha;

  const GlassAlpha(this.alpha);
}

class Glass extends StatelessWidget {

  final double elevation;
  final double border;
  final Widget child;
  final GlassAlpha alpha;

  const Glass({
    super.key,
    this.elevation = 10,
    this.border = 32,
    this.alpha = .medium,
    required this.child,
  });

  static const double _blurStrength = 8.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        border: Border.all(
          color: Colors.grey.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Material(
        color: theme.white.withValues(alpha: alpha.alpha),
        borderRadius: BorderRadius.circular(border),
        clipBehavior: Clip.hardEdge,
        elevation: elevation,
        shadowColor: theme.tabBarShadowColor,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: _blurStrength,
            sigmaY: _blurStrength,
          ),
          child: child,
        ),
      ),
    );
  }
}
