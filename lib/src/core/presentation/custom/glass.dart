import 'package:crypto_app/src/core/util/extension/build_context_ext.dart';
import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum GlassAlpha {
  low(0.15),
  medium(0.6),
  strange(0.8);

  final double alpha;

  const GlassAlpha(this.alpha);
}

const double _blurStrength = 8.0;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(border),
        border: .all(
          color: context.theme.glassBorderColor,
          width: 1,
        ),
      ),
      child: Material(
        color: context.theme.glassBackgroundColor.withValues(alpha: alpha.alpha),
        borderRadius: .circular(border),
        clipBehavior: .hardEdge,
        elevation: elevation,
        shadowColor: context.theme.glassShadowColor,
        child: BackdropFilter(
          filter: .blur(
            sigmaX: _blurStrength,
            sigmaY: _blurStrength,
          ),
          child: child,
        ),
      ),
    );
  }
}
