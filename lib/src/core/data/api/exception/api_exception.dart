import 'dart:io';

import 'package:crypto_app/src/core/data/api/exception/api_exception_handler.dart';
import 'package:crypto_app/src/core/data/api/exports/api_exports.dart';
import 'package:crypto_app/src/core/data/exception/app_exception.dart';
import 'package:crypto_app/src/core/util/typedef/app_typedef.dart';
import 'package:flutter/widgets.dart';

/// This classes are returned from Api layer on any
/// Exception inside Api layer
///
/// This and all children errors are handled
/// by [ApiExceptionHandler]
abstract class ApiException implements Exception {
  final Object baseException;
  const ApiException(this.baseException);
}

/// Throws on [SocketException] if on internet connection exception
class NoInternetConnection extends ApiException implements LocalizedException {
  NoInternetConnection(super.baseException);
  @override
  String localized(BuildContext context) {
    return "";
    // return S.of(context).networkException;
  }
}

/// Throws on ony Dio time out exceptions
class ServerIsUnavailable extends ApiException implements LocalizedException {
  ServerIsUnavailable(super.baseException);
  @override
  String localized(BuildContext context) {
    return "";
    // return S.of(context).bad_response_desc;
  }
}

/// Thrown on [DioExceptionType.badResponse] (server returns 4xx / 5xx)
///
/// Only [DioExceptionType.badResponse] Exception type in [Dio] has
/// [DioException.response] != null.
class BadResponse extends ApiException implements LocalizedException {
  final int? badStatusCode;
  final Json? data;
  BadResponse(super.baseException, {
    this.badStatusCode,
    this.data,
  }) : assert(
  badStatusCode == null || (badStatusCode >= 400 && badStatusCode <= 599),
  'BadResponse badStatusCode must be between 400 and 599',
  );
  @override
  String localized(BuildContext context) {
    return "";
    // return "Bad response${badStatusCode == null ? "" : " with bad status code $badStatusCode"}: Sorry, something went wrong on our side. Please try again later.";
    // return S.of(context).bad_response + (badStatusCode == null ? "" : S.of(context).bad_response_code(badStatusCode!)) + ": " + S.of(context).bad_response_desc;
  }
}

/// Throws when exception is unhandled or undefined
/// by [ApiExceptionHandler]
class Undefined extends ApiException implements LocalizedException {
  const Undefined(super.baseException);
  @override
  String localized(BuildContext context) {
    return "";
    // return S.of(context).undefined_api_error_desc(baseException);
  }
}