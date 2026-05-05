import 'package:crypto_app/src/core/util/di/setup_di.dart';
import 'package:crypto_app/src/feature/app/presentation/app_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDeps();
  runApp(AppPage());
}