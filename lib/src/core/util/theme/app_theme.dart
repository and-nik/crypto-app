import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

enum AppThemeType {
  system,
  light,
  dark,
}

class AppTheme {

  final AppThemeType type;
  final ThemeData theme;

  const AppTheme._(this.type, this.theme);

  static Brightness appBr = SchedulerBinding.instance.platformDispatcher.platformBrightness;

  /// The main active color of the app
  ///
  /// Change it to other and all active
  /// colors will be changed
  static const _primary = Color(0xFF246BFD);
  // static const _primary = Colors.green;

  static final system = AppTheme._(
    .system,
    appBr == .light ? light.theme : dark.theme,
  );

  static final light = AppTheme._(
    .light,
    ThemeData.light(
      useMaterial3: true,
    ).copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: _primary,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark, /// темные иконки
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      // iconTheme: const IconThemeData(
      //   color: _primary,
      // ),
    ),
  ),
  );

  static final dark = AppTheme._(
    .dark,
    ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: _primary,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  );

}

extension ThemeExt on ThemeData {

  static final _isLight = AppTheme.appBr == .light;

  Color get lightSoftPrimary => _scaffoldTint(colorScheme.primary, .light, 0.6);

  /// Colors

  Color get black => _isLight
      ? Colors.black
      : Colors.white;

  Color get white => _isLight
      ? Colors.white
      : Colors.black;

  /// Text colors

  Color get textColor => _isLight
      ? textTheme.bodySmall?.color ?? Colors.black
      : textTheme.bodySmall?.color ?? Colors.white;

  Color get secondaryTextColor => _isLight
      ? const Color(0xff9E9E9E)
      : const Color(0xff9E9E9E);

  Color get tertiaryTextColor => _isLight
      ? const Color(0xff9E9E9E)
      : const Color(0xff9E9E9E);

  Color get errorTextColor => _isLight
      ? Colors.red[800]!
      : Colors.red;

  Color get successTextColor => _isLight
      ? Colors.green[700]!
      : Colors.green;

  Color get alwaysWhite => Colors.white;

  Color get tabBarIndicatorColor => _isLight
      ? Colors.grey.withValues(alpha: 0.2)
      : Colors.grey.withValues(alpha: 0.2);

  /// Other colors

  Color get glassShadowColor => Colors.black45;

  Color get glassBorderColor => _isLight
      ? Colors.grey.withValues(alpha: 0.05)
      : Colors.grey.withValues(alpha: 0.2);

}

/// Generate color relatively to primary color, brightness (white or black color)
/// and percent of brightness main color, but DON'T touch alfa layer of color
///
/// Example:
/// primary = [Colors.blue]
/// -> _scaffoldTint(primary, .light, 0.95) ->
/// == result = ~Color(0xFFF7FAFF)
Color _scaffoldTint(
    Color primary, [
      Brightness brightness = .light,
      double brightnessColorPercent = 0.96
    ]) => Color.lerp(
    primary,
    brightness == .light ? Colors.white : Colors.black,
    brightnessColorPercent,
  )!;