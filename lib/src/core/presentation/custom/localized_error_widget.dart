import 'dart:math';

import 'package:crypto_app/src/core/data/api/exception/api_exception.dart';
import 'package:crypto_app/src/core/data/exception/app_exception.dart';
import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Not Error because Flutter framework already
/// has [ErrorWidget]
class LocalizedErrorWidget extends StatelessWidget {

  final Object error;
  final bool wrapWithScaffold;
  final void Function()? onTryAgain;

  const LocalizedErrorWidget({
    super.key,
    required this.error,
    this.wrapWithScaffold = true,
    this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    String text;

    final error = this.error;
    if (error is LocalizedException) {
      text = error.localized(context);
    } else {
      // text = S.of(context).undefined_error_desc(error);
      text = "";
    }

    final iconData = switch (error) {
      NoInternetConnection() => CupertinoIcons.wifi_slash,
      ServerIsUnavailable() => CupertinoIcons.wifi_exclamationmark,
      _ => CupertinoIcons.exclamationmark_triangle_fill,
    };

    final body = Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(
            iconData,
            size: 32,
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).secondaryTextColor,
                ),
              ),
            ),
          ),
          if (onTryAgain != null)
            TextButton(
              onPressed: onTryAgain,
              child: Text(
                //todo loc
                "Try again",
                // S.of(context).try_again,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );

    if (wrapWithScaffold) {
      return Scaffold(
        appBar: AppBar(
      //todo loc
      //     title: Text(S.of(context).error_title),
          title: Text("Error"),
        ),
        body: body,
      );
    } else {
      return body;
    }
  }
}
