import 'package:crypto_app/src/core/data/api/exception/api_exception.dart';

/// Функция, которая помогает обрабатывать ошибки
/// и ошибки с интеренет соединением
Future<void> handleErrors<T extends Object>({
  required Future<void> Function() onTry,
  void Function(Object error)? onError,
  void Function(NoInternetConnection error)? onInternetConnectionError,
  void Function(ServerIsUnavailable error)? onServerIsUnavailableError,
  // void Function(BadResponse error)? onBadResponse,
  void Function(Object error)? onOtherError,
  void Function(T error)? onCustom,
  bool includeErrorInCustom = false,
}) async {
  try {
    await onTry();
    return;
  } on NoInternetConnection catch (e) {
    onError?.call(e);
    onInternetConnectionError?.call(e);
  } on ServerIsUnavailable catch (e) {
    onError?.call(e);
    onServerIsUnavailableError?.call(e);
  } catch (e, s) {

    final hasCustomType = onCustom != null && e is T;
    if (hasCustomType) {
      if (includeErrorInCustom) {
        onError?.call(e);
      }
      onCustom.call(e);
      return;
    }

    /// here also handled BadResponse api error
    onError?.call(e);
    onOtherError?.call(e);
    // reportCrashlyticsError(e, s);
  }
}