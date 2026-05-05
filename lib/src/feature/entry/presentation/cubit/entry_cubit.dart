part of '../entry_page.dart';

class EntryCubit extends Cubit<_EntryState> {

  EntryCubit(): super(_LoadingState()) {
    load();
  }

  Future<void> load() async {
    if (false) {
      emit(_FirstTimeState());
    } else {
      emit(_NotFirstTimeState());
    }
  }
}