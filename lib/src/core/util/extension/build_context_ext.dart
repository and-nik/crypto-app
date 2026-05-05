import 'package:crypto_app/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
}