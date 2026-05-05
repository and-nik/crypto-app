import 'package:crypto_app/src/core/util/di/setup_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> setupDeps() async {
  getIt.init();
}