import 'package:flutter/material.dart';

abstract class LocalizedException implements Exception {
  String localized(BuildContext context);
}