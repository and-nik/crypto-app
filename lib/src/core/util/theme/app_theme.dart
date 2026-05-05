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
      // elevation: 1.5,
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
    scaffoldBackgroundColor: _scaffoldTint(_primary, .dark, 0.92),
    colorScheme: const ColorScheme.dark(
      primary: _primary,
    ),
  ),
  );

}

extension ThemeExt on ThemeData {

  static final _isLight = AppTheme.appBr == .light;

  Color get lightSoftPrimary => _scaffoldTint(colorScheme.primary, .light, 0.6);

  /// Text colors

  Color get textColor => _isLight
      ? textTheme.bodySmall?.color ?? Colors.black
      : textTheme.bodySmall?.color ?? Colors.white;

  Color get secondaryTextColor => _isLight
      ? Color(0xff9E9E9E)
      : Color(0xff9E9E9E);

  Color get tertiaryTextColor => _isLight
      ? Color(0xff9E9E9E)
      : Color(0xff9E9E9E);

  Color get errorTextColor => _isLight
      ? Color(0xFFD10D00)
      : Color(0xFFD10D00);

  Color get successTextColor => _isLight
      ? Color(0xff0DAD1D)
      : Color(0xff0DAD1D);

  Color get waitTextColor => _isLight
      ? Color(0xff246BFD)
      : Color(0xff246BFD);

  Color get notBlackTextColor => _isLight
      ? Color(0xFF212121)
      : Color(0xFF212121);

  Color get appNameTextColor => _isLight
      ? Color(0xff5E6278)
      : Color(0xff5E6278);

/// Others

  Color get blackoutColor => _isLight
      ? Colors.black38
      : Colors.black38;

  Color get waitRegCircleSoftColor => _isLight
      ? Color(0xff6F9EFF)
      : Color(0xff6F9EFF);

  Color get waitRegCircleColor => _isLight
      ? Color(0xff246BFD)
      : Color(0xff246BFD);

  Color get successRegCircleSoftColor => _isLight
      ? Color(0xff0DAD1D)
      : Color(0xff0DAD1D);

  Color get successRegCircleColor => _isLight
      ? Color(0xff1DD30D)
      : Color(0xff1DD30D);

  Color get alwaysWhite => Colors.white;

  Color get highlightTabBarItemColor => _isLight
      ? colorScheme.primary.withValues(alpha: 0.12)
      : colorScheme.primary.withValues(alpha: 0.12);

  Color get tabBarColor => _isLight
      ? Colors.grey.shade300
      : Colors.grey.shade300;

  Color get tabBarShadowColor => Colors.black45;

  Color get highlightTextFieldColor => _isLight
      ? colorScheme.primary.withValues(alpha: 0.06)
      : colorScheme.primary.withValues(alpha: 0.06);

  Color get textFieldBorderColor => _isLight
      ? Color(0xFFE1E0E0) ///Color(0xffDCDCDC)
      : Color(0xFFE1E0E0);

  Color get disabledButtonBackgroundColor => secondaryTextColor;

  Color get black => _isLight
      ? Colors.black
      : Colors.white;

  Color get white => _isLight
      ? Colors.white
      : Colors.black;
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