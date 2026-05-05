import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/core/presentation/custom/custom_button.dart';
import 'package:crypto_app/src/core/presentation/custom/glass.dart';
import 'package:crypto_app/src/core/util/assets/app_assets.dart';
import 'package:crypto_app/src/core/util/extension/build_context_ext.dart';
import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.portfolio),
        actions: [
          SizedBox(
            width: 46,
            height: 46,
            child: Glass(
              elevation: 2,
              child: CustomButton(
                onPressed: () {

                },
                child: SvgPicture.asset(
                  assets.icons.plus,
                  fit: .scaleDown,
                  colorFilter: .mode(
                    context.theme.textColor, .srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16,),
        ],
      ),
    );
  }
}
