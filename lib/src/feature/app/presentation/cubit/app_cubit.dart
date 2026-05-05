import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(theme: .light));

}